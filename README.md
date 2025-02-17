# UFiber Nano G and UFiber LOCO - Serial Hack
This is a slightly modified version of https://github.com/v-a-c-u-u-m/ufiber_nano_serial_hack

I was unable to build the image in that repo, so I modified the dockerfile to make it work, and added instructions on how to build and run it locally in Docker.

## T-Mobile Huawei GPON replacement
For the Dutch (and Germans?) among us with T-Mobile fiber looking to replace the Huawei OptiXstar GPON
https://gathering.tweakers.net/forum/list_messages/2124894 (Article is in Dutch, sorry for any non-Dutch speaking)

# Usage with Docker
If you want to use Docker to build an image to execute the hack with, you can build the image with the following command:

```
docker build -t ubihack .
```

To execute, pass the commands explained in Usage, like so:

```
docker run -it --rm ubihack -r 192.168.1.1 -p 22 --readonly
docker run -it --rm ubihack -r 192.168.1.1 -p 22 --serial 48:57:54:43:30:30:30:30 --mac 11:22:33:44:55:66
```

# Content from original repo README - anything below here I didn't personally verify to be true or working

## Dependencies
pip3 install paramiko scp

## Usage
Сhange your serial number on UFiber Nano G via ssh
```sh
./ubi_serial_hack.py -r 192.168.1.1 -p 22 --serial 48:57:54:43:30:30:30:30
```

Change your serial and MAC
```sh
./ubi_serial_hack.py -r 192.168.1.1 -p 22 --serial 48:57:54:43:30:30:30:30 --mac 11:22:33:44:55:66
```

Manual method. Put the mtdblock3.BIN in the script folder and run with --nossh flag.
```sh
./ubi_serial_hack.py --nossh --serial 48:57:54:43:30:30:30:30
```

Ignoring abnormal termination with unsupported boards.
```sh
./ubi_serial_hack.py --insecure --serial 48:57:54:43:30:30:30:30
```

Read only from filepath
```sh
./ubi_serial_hack.py -f mtdblock3.BIN
```

## UFiber LOCO tips

Before using the script firmware should be upgraded to version 4.2.1 and SSH should be enabled from the device admin panel.
Script will compain about firmware checksum on UFiber LOCO devices so to continue installation you need to use --insecure flag
```sh
./ubi_serial_hack.py -r 192.168.1.1 -p 22 --serial 48:57:54:43:30:30:30:30 --mac 11:22:33:44:55:66 --insecure
```

## Tested
UFiber NANO G Firmware versions: v2.1.1 and v4.1.0

UFiber LOCO Firmware versions: v4.2.1

## Used links/references
https://community.ubnt.com/t5/UFiber-GPON/UFiber-Nano-G-GPON-Huawei-HG8245-Configuration/m-p/2139059#M511

https://web.archive.org/web/20190214022357/https://blog.onedefence.com/changing-the-gpon-serial-on-the-ubiquiti-ufiber-nano-g-part-two/

https://github.com/palmerc/AESCrypt2

https://github.com/dylangerdaly/UFiber-Nano-G-Playpen
