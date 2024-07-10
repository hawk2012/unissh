#!/bin/bash

# Функция для проверки всех дисков
function check_disks() {
    echo "Проверка дисков..."
    sudo fdisk -l
}

# Функция для получения UUID диска
function get_uuid() {
    read -p "Введите имя диска: " disk_name
    echo "UUID диска $disk_name: $(sudo blkid | grep $disk_name | awk '{print $2}')"
}

# Функция для получения внешнего IP адреса ПК
function get_external_ip() {
    curl ifconfig.me
}

# Функция для создания RAID из указанных дисков
function create_raid() {
    read -p "Введите имена дисков через пробел: " disks
    sudo mdadm --create /dev/md0 --level=RAID1 --raid-devices=$#disks $disks
}

# Функция для удаления RAID
function remove_raid() {
    echo "Удаление RAID..."
    sudo mdadm -S /dev/md0
}

# Функция для выполнения traceroute
function do_traceroute() {
    read -p "Введите IP или хост для traceroute: " host
    traceroute $host
}

# Функция для обновления системы в скрытом режиме
function update_system() {
    sudo apt-get update && sudo apt-get upgrade -y
}

# Функция для поиска программы в репозиториях системы и установки её с зависимостями
function install_program() {
    read -p "Введите имя программы для установки: " program
    sudo apt-get install $program -y
}

# Меню пользователя
clear
echo "Меню:"
echo "a) Проверить все диски"
echo "b) Узнать UUID конкретного диска"
echo "c) Узнать внешний IP адрес ПК"
echo "d) Создать RAID из указанных дисков"
echo "e) Удалить RAID"
echo "f) Выполнить traceroute до указанного IP или хоста"
echo "g) Обновить систему в скрытом режиме"
echo "h) Найти программу в репозиториях системы и установить её с зависимостями"
echo "q) Выйти из меню"

# Цикл меню
while true; do
    read -p "Выберите действие: " option
    case $option in
        a) check_disks ;;
        b) get_uuid ;;
        c) get_external_ip ;;
        d) create_raid ;;
        e) remove_raid ;;
        f) do_traceroute ;;
        g) update_system ;;
        h) install_program ;;
        q) break ;;
        *) echo "Неверный выбор. Попробуйте еще раз." ;;
    esac
done

echo "До свидания!"
