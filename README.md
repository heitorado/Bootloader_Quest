# Bootloader Quest

Bootloader written in NASM Assembly x86 for academic project, made in group.

### Overview
At startup, the qemu emulated BIOS checks the first 512 bytes of the sector, head and trail 0 of the hard disk (this is called the bootsector). If there is a valid boot, then these 512 bytes are loaded in memory, and it runs the code. This bootable code is the boot1, responsible for calling the second code, boot2, making a memory jump for the sector of the code (which is different from the bootsector). After loading and running boot2, the kernel is called.

This kernel consists in a small sci-fi text-based RPG game with 3 possible endings. Five minutes of gameplay, more or less.

### Installation

Bootloader Quest requires [QEMU](https://www.qemu.org/) and [NASM](http://www.nasm.us/) to run.

Install commands:

```sh
$ sudo apt-get install nasm
$ sudo apt-get install qemu-system-x86
```

For running the bootloader (provided you're already inside the folder)...

```sh
$ make
```


### Screenshots
![alt-text](https://i.imgur.com/5qbVMz0.gif)
![alt-text](https://i.imgur.com/u9bfh9Y.gif)

