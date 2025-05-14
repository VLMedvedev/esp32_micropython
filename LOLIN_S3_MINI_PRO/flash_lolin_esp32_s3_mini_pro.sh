#/bin/bash -x

project_dir=$PWD
ports_dir=$project_dir/micropython/ports/esp32

board=LOLIN_S3_MINI_PRO
board_variant=OTA
device_variant=lolin_esp32s3_mini_pro_4m

cp -f -r $project_dir/modules $ports_dir/
. $HOME/esp/esp-idf/export.sh
cd $ports_dir

port=/dev/ttyACM0

ls $port

#make erase
#esptool.py   --chip esp32s3  --port /dev/ttyACM0  erase_flash

fw_bin='firmware-LOLIN_S3_MINI_PRO-v1.24.1-1-g50c8864e7(1).bin'

esptool.py  --chip esp32s3  --port $port --baud 1000000 write_flash -z 0 $fw_bin


#make deploy  BOARD=$board BOARD_VARIANT=$board_variant

#minicom -D $port

exit 0
