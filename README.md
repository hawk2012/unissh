# Bash script for performing various system tasks

This script provides the user with a menu with various functions that they can select. Each function is implemented as a separate function in the script. The user can select one of the functions, enter the necessary data (if required), and the script will perform the appropriate operation.

## Functions

- `check_disks` - checking all disks
- `get_uuid` - getting the UUID of the disk
- `get_external_ip` - getting the external IP address of the PC
- `create_raid` - creating a RAID from the specified disks
- `remove_raid` - removing the RAID
- `do_traceroute` - execution of the traceroute to the specified IP or host
- `update_system` - system update in hidden mode
- `install_program` - search for the program in the system repositories and install it with dependencies

## Usage

To use the script, follow these steps:

1. Copy the contents of the script to a file with the extension `.sh`.
2. Change the file access rights so that it can be executed: `chmod +x script.sh`.
3. Run the script: `./script.sh `.
4. Select the desired function from the menu.

## Notes

- This script is intended for use on Linux systems.
- Some functions require superuser privileges (`sudo`).
- Some functions may require user input.
- When using the `update_system` function, the script automatically installs all available updates without requesting confirmation.
- The `install_program` function uses the `apt-get` package manager to install programs from the official Ubuntu repositories.

## License

The script is distributed under the MIT License.
