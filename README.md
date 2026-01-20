# ParserHostFile

[English](#english) | [Русский](#russian)

---

## English

PowerShell script for validating the syntactic correctness of the Windows hosts file. The tool checks file structure, IP address and hostname format validity, and compliance with the standard Microsoft header.

### 📋 Description

This project contains scripts for validating the hosts file (`C:\Windows\System32\Drivers\etc\hosts`), which is used in Windows to map IP addresses to hostnames. The scripts verify:

- Presence and correctness of the standard Microsoft header
- Syntax of IP address and host entries
- Proper comment formatting
- Overall file structure

### 🚀 Usage

#### checkHost.ps1 (basic version)

Script with customizable file path:

```powershell
# 1. Open the file script\checkHost.ps1
# 2. Change the $location_file variable to your desired path:
$location_file = "C:\path\to\your\hosts"

# 3. Run the script:
.\script\checkHost.ps1
```

#### checkHostAnsi.ps1 (for system file)

Script automatically checks the system hosts file:

```powershell
# Run as Administrator (recommended)
.\script\checkHostAnsi.ps1
```

### 📁 Project Structure

```
ParserHostFile/
├── hosts                    # Sample hosts file for testing
├── README.md               # Project documentation
└── script/
    ├── checkHost.ps1       # Script with configurable file path
    └── checkHostAnsi.ps1   # Script for checking system hosts file
```

### 🔍 Possible Validation Results

#### ✅ File is correct
```
Файл host пустой и содержит только заголовок
```
or
```
Файл синтаксически верен
```

#### ❌ Errors detected
The script will output:
- Line with error
- Line number
- Problem description

### ⚙️ Requirements

- **OS:** Windows 7/8/10/11 or Windows Server
- **PowerShell:** version 5.1 or higher
- **Permissions:** Administrator rights may be required to check the system hosts file

### 🔧 Technical Details

The scripts use regular expressions for validation:

- **IP addresses:** `^\s*(?<Address>[0-9.:]+)\s+(?<Host>[\w.-]+)`
  - Supports IPv4 and IPv6
- **Comments:** `(?<comment>^#+.+$)|(?<commentNull>#$)`

### 📝 Hosts File Format

Correct entry format:
```
# Comment
127.0.0.1       localhost
::1             localhost
192.168.1.100   example.local    # inline comment
```

### 🐛 Troubleshooting

**Issue:** "File not found"  
**Solution:** Check the path in the `$location_file` variable

**Issue:** "Access denied"  
**Solution:** Run PowerShell as Administrator

**Issue:** "Scripts are disabled"  
**Solution:** Change execution policy:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 📄 License

This project is open source software. You are free to use, modify, and distribute it.

### 👤 Author

Created to simplify administration and validation of hosts files on Windows systems.

---

**Note:** Always create a backup of your hosts file before making changes!

---

## Russian

PowerShell-скрипт для проверки синтаксической корректности файла hosts в Windows. Инструмент проверяет структуру файла, правильность формата IP-адресов и имен хостов, а также соответствие стандартному заголовку Microsoft.

## 📋 Описание

Проект содержит скрипты для валидации файла hosts (`C:\Windows\System32\Drivers\etc\hosts`), который используется в Windows для сопоставления IP-адресов с именами хостов. Скрипты проверяют:

- Наличие и корректность стандартного заголовка Microsoft
- Синтаксис записей IP-адресов и хостов
- Правильность формата комментариев
- Общую структуру файла

## 🚀 Использование

### checkHost.ps1 (базовая версия)

Скрипт с возможностью указания пользовательского пути к файлу:

```powershell
# 1. Откройте файл script\checkHost.ps1
# 2. Измените переменную $location_file на нужный путь:
$location_file = "C:\path\to\your\hosts"

# 3. Запустите скрипт:
.\script\checkHost.ps1
```

### checkHostAnsi.ps1 (для системного файла)

Скрипт автоматически проверяет системный файл hosts:

```powershell
# Запуск от имени администратора (рекомендуется)
.\script\checkHostAnsi.ps1
```

## 📁 Структура проекта

```
ParserHostFile/
├── hosts                    # Пример файла hosts для тестирования
├── README.md               # Документация проекта
└── script/
    ├── checkHost.ps1       # Скрипт с настраиваемым путем к файлу
    └── checkHostAnsi.ps1   # Скрипт для проверки системного файла hosts
```

## 🔍 Возможные результаты проверки

### ✅ Файл корректен
```
Файл host пустой и содержит только заголовок
```
или
```
Файл синтаксически верен
```

### ❌ Обнаружены ошибки
Скрипт выведет:
- Строку с ошибкой
- Номер строки
- Описание проблемы

## ⚙️ Требования

- **ОС:** Windows 7/8/10/11 или Windows Server
- **PowerShell:** версия 5.1 или выше
- **Права:** Для проверки системного файла hosts может потребоваться запуск от имени администратора

## 🔧 Технические детали

Скрипты используют регулярные выражения для проверки:

- **IP-адреса:** `^\s*(?<Address>[0-9.:]+)\s+(?<Host>[\w.-]+)`
  - Поддержка IPv4 и IPv6
- **Комментарии:** `(?<comment>^#+.+$)|(?<commentNull>#$)`

## 📝 Формат файла hosts

Корректный формат записи:
```
# Комментарий
127.0.0.1       localhost
::1             localhost
192.168.1.100   example.local    # комментарий к записи
```

## 🐛 Устранение неполадок

**Проблема:** "Файл не найден"  
**Решение:** Проверьте путь в переменной `$location_file`

**Проблема:** "Доступ запрещен"  
**Решение:** Запустите PowerShell от имени администратора

**Проблема:** "Скрипты отключены"  
**Решение:** Измените политику выполнения:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 📄 Лицензия

Этот проект является открытым программным обеспечением. Вы можете свободно использовать, модифицировать и распространять его.

## 👤 Автор

Создано для упрощения администрирования и проверки файлов hosts в Windows-системах.

---

**Примечание:** Всегда создавайте резервную копию файла hosts перед внесением изменений!
