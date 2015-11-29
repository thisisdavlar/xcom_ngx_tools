# xcom_ngx_tools
JZ4770 dump tools for neogeox (nandflash Samsung KLM2G1DEHE-B101)

This is only an adaptation of ingenic-boot tools.
See the original README file in xcom_ngx_tools/ingenic-boot-master/README

"
ingenic-boot is copyright (C) 2012 by Duke Fong <duke@dukelec.com>, and is
licensed under the terms of the GNU General Public License version 3.
See the file COPYING for more information.
"

HOWTO compile ingenic-boot tools

1.Go to the right directory:
cd xcom_ngx_tools/ingenic-boot-master

2.Run the compilation script
./rebuild.sh


./ingenic-boot-master/rebuild.sh

HOWTO dump your handheld nandflash:
1.Keep your handhelp powered off.

2.Hold the start button, and plug your USB cable into the handheld, then release the start button.

3.Run the following command (sudo password will be request):
./dump_handheld.sh

4.wait for at least 10 minutes the dump is done.
The resulting file "nand.img" will be created.
This is your nanddump.

You can explore your dumped partitions:
$>sfdisk -d nand.img 
partition table of nand.img
unit: sectors

  nand.img1 : start=    24576, size=   983040, Id=83
  nand.img2 : start=  1007616, size=   266240, Id=83
  nand.img3 : start=  1273856, size=    40960, Id=83
  nand.img4 : start=  1314816, size=  2097152, Id= b

mount one of the partition (adjust the value of PARTITION=1 or 2,3,4 )
$>mkdir mnt
$>INFILE=nand.img; MOUNTPT=mnt/; PARTITION=1; sudo mount "$INFILE" "$MOUNTPT" -o loop,offset=$[ `/sbin/sfdisk -d "$INFILE" | grep "start=" | head -n $PARTITION | tail -n1 | sed 's/.*start=[ ]*//' | sed 's/,.*//'` * 512 ]





