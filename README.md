# Evolve Logs

## Описание
Evolve Logs - скрипт внутриигровых логов для государственных организаций на серверах Evolve Role Play. Скрипт предназначен для отслеживания повышений, понижений и увольнений сотрудников в различных государственных организациях.

## ⚙️ Установка и использование
1. **Скачайте скрипт** из [официального репозитория](https://github.com/Pugovka/evolvelogs)
2. **Поместите файл EvolveLogs.luac** в папку `moonloader` (обычно находится по пути: `...\GTA San Andreas\moonloader\`)
3. **Запустите игру**. При первом запуске скрипт автоматически скачает все необходимые библиотеки
4. **Используйте команду** `/elogs` для открытия меню скрипта

> **Важно**: Для корректной работы скрипта необходимо наличие установленного [Moonloader](https://www.blast.hk/threads/13305/) и [SAMPFUNCS](https://www.blast.hk/threads/17/).

## 🔍 Функциональность
- Поиск информации о сотрудниках организаций по никнейму или ID
- Отображение истории повышений/понижений/увольнений
- Информация о контрактах для Армии СФ и Армии ЛВ
- Расчет сроков до следующего повышения
- Поддержка серверов Saint-Louis и New Orleans
- Интеграция с Google Spreadsheets для получения дополнительных данных

## 🏢 Поддерживаемые организации
- Мэрия
- ФБР
- Автошкола
- Больница
- Армия СФ
- Армия ЛВ
- Полиция ЛС
- Полиция СФ
- Полиция ЛВ
- Новости ЛС
- Новости СФ
- Новости ЛВ

## 💬 Команды
- `/elogs [ID/Nick_Name]` - поиск информации по конкретному игроку
- `/updlist` - открыть лог обновлений

## 🖥️ Интерфейс
Скрипт имеет удобный графический интерфейс с тремя основными разделами:
1. **Поиск** - функционал для поиска и отображения данных о сотрудниках
2. **Настройки** - выбор организации и другие настройки скрипта
3. **О скрипте** - информация о версии и авторе

## 🔧 Техническая информация
- Автоматическое обновление
- Интеграция с базой данных логов
- Расчет сроков контрактов и повышений для разных рангов
- Поддержка разных стилей контрактов (ВД, Standart, Professional, Admiral)
- Защита от флуда и спама запросами
- Интеграция с Sentry для отслеживания и сбора ошибок скрипта в реальном времени

## 📋 Требования
- SAMP
- Moonloader
- SAMPFUNCS
- Библиотеки:
  - moonloader
  - sampfuncs
  - mimgui (и его компоненты)
  - ffi
  - fAwesome6_solid
  - tabler_icons
  - vkeys
  - memory
  - json
  - encoding
  - requests
  - MoonImGui.dll
