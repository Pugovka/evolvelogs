-- Модуль автообновления

local download_status = require("moonloader").download_status
local json = require("json")

local function downloadModules(modules, prefix, onDone)
    if not modules or type(modules) ~= "table" or #modules == 0 then
        if onDone then onDone() end
        return
    end
    local idx = 1
    local function downloadNext()
        if idx > #modules then
            if onDone then onDone() end
            return
        end
        local entry = modules[idx]
        local path = (entry.path or entry[1]):gsub("/", "\\")
        local dest = getWorkingDirectory() .. "\\" .. path
        downloadUrlToFile(entry.url, dest, function(_, status, loaded, total)
            if status == download_status.STATUS_ENDDOWNLOADDATA or status == download_status.STATUSEX_ENDDOWNLOAD then
                print(prefix .. "Модуль обновлён: " .. path)
            else
                print(prefix .. "Ошибка загрузки модуля: " .. path)
            end
            idx = idx + 1
            downloadNext()
        end)
    end
    downloadNext()
end

function check(json_url, prefix, base_url)
    local tmp = os.tmpname()
    local start = os.clock()
    if doesFileExist(tmp) then os.remove(tmp) end
    downloadUrlToFile(json_url, tmp, function(_, status, _, _)
        if status ~= download_status.STATUSEX_ENDDOWNLOAD then return end
        if not doesFileExist(tmp) then return end
        local f = io.open(tmp, "r")
        if not f then return end
        local content = f:read("*a")
        f:close()
        os.remove(tmp)
        local ok, data = pcall(json.decode, content)
        if not ok or not data then
            print(prefix .. "Не могу проверить обновление.")
            return
        end
        local updateversion = data.latest
        local updatelink = data.updateurl

        local function checkMainUpdate()
            if not updateversion or not updatelink then return end
            if updateversion == thisScript().version then
                print("v" .. thisScript().version .. ": Обновление не требуется.")
                return
            end
            sampAddChatMessage(prefix .. "Обнаружено обновление. Пытаюсь обновиться c " .. thisScript().version .. " на " .. updateversion, -1)
            wait(250)
            downloadUrlToFile(updatelink, thisScript().path, function(_, status, loaded, total)
                if status == download_status.STATUS_DOWNLOADINGDATA then
                    print(string.format("Загружено %d из %d.", loaded, total))
                elseif status == download_status.STATUS_ENDDOWNLOADDATA then
                    print("Загрузка обновления завершена.")
                    sampAddChatMessage(prefix .. "Обновление завершено!", -1)
                    lua_thread.create(function()
                        wait(500)
                        thisScript():reload()
                    end)
                elseif status == download_status.STATUSEX_ENDDOWNLOAD then
                end
            end)
        end

        downloadModules(data.modules, prefix, checkMainUpdate)
        if not data.modules or #data.modules == 0 then
            checkMainUpdate()
        end
    end)
    while os.clock() - start < 10 do wait(100) end
    if os.clock() - start >= 10 then
        print("v" .. thisScript().version .. ": timeout проверки обновления.")
    end
end

return { check = check }