## Overview 
Convert wifi ini to hwparam.bin for flash loading.

## souce code
```
git clone https://github.com/unisoc/hwparam.git
cd hwparam
make
```
## binary
Download url:
```
https://github.com/unisoc/hwparam/releases
```

## Test environment
Ubuntu 18.04.2 LTS

## Usage
```
	./hwparam [-f wifi_board_config.ini]
```
[ ] is optional.

## Show usage
```
        ./hwparam -h
```

## Note
Please add execute permission on hwparam before running it.
```
      chmod u+x hwparam
```
hwparam.bin will be generated in current path.
This version is supporting wifi ini only.



## Flashing tool
### Linux
Here is an example on uwpflash. More usage, please check uwpflash itself.
#### source code
```
git clone https://github.com/unisoc/uwpflash.git
cd uwpflash
sudo make && make install
```
#### binary
https://github.com/unisoc/uwpflash/releases
```
sudo uwpflash -f $(REPO_PATH)/out/$(PROFILE)/images/hwparam-$(BOARD).bin -a 0x2300000 
```
### Windows
Flashing into HWPARAM partition via researchdownload.
