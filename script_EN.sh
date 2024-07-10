#!/bin/bash

function check_disks() {
    echo "Checking disks..."
    sudo fdisk -l
}

function get_uuid() {
    read -p "Enter disk device name: " disk
    echo "Getting UUID for $disk..."
    sudo blkid | grep $disk | awk '{print $2}'
}

function get_external_ip() {
    echo "Getting external IP address..."
    curl ifconfig.co
}

function create_raid() {
    read -p "Enter RAID level (0, 1, 5, 6, 10): " raid_level
    read -p "Enter devices to include in RAID (separated by spaces): " devices
    echo "Creating RAID $raid_level from devices $devices..."
    sudo mdadm --create --verbose /dev/md0 --level=$raid_level $devices
}

function remove_raid() {
    read -p "Enter the MD device to remove: " md_device
    echo "Removing RAID $md_device..."
    sudo mdadm -S /dev/$md_device
}

function trace_route() {
    echo "Performing traceroute..."
    read -p "Enter destination IP or hostname: " destination
    traceroute $destination
}

function update_system() {
    sudo apt-get update && sudo apt-get upgrade -y
}

function find_and_install_package() {
    echo "Finding and installing package with dependencies..."
    read -p "Enter package name: " package
    sudo apt-cache search $package | grep -i "$package" | awk '{print $1}' | xargs sudo apt-get install -y
}

# Меню для выбора функции
clear
echo "Main menu:"
echo "a) Check all disks"
echo "b) Get UUID of a specific disk"
echo "c) Get external IP address"
echo "d) Create RAID"
echo "e) Remove RAID"
echo "f) Trace route to a destination"
echo "g) Update system in background"
echo "h) Find and install package with dependencies"
echo -n "Select an option: "
read option

case $option in
    a) check_disks ;;
    b) get_uuid ;;
    c) get_external_ip ;;
    d) create_raid ;;
    e) remove_raid ;;
    f) trace_route ;;
    g) update_system ;;
    h) find_and_install_package ;;
    *) echo "Invalid option." ;;
esac

echo "Press enter to exit."
read
