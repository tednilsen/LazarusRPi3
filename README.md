# LazarusRPi3
FPC and Lazarus binaries for RPi3

built with:
* FPCUPdeluxe V1.8.0e (fpcupdeluxe-arm-linux)
* Raspberry Pi 3
* Linux 5.4.51-v7+ armv7l
* Raspbian GNU/Linux 10 (buster)
* fpcopt="-dFPC_ARMHF -CpARMV7A -CfVFPV4 -OoFASTMATH -CaEABIHF -XX -Xs -CX -O2"
* lazopt="-dFPC_ARMHF -CpARMV7A -CfVFPV4 -OoFASTMATH -CaEABIHF -XX -Xs -CX -O2"
* Lazarus trunk.git db5e3f4d05eb822df895ab1fe615760c1f6799a7
* FPC trunk.git 60773c21b99c3d8317c7698413713f1fa7b2551b

Requirements xz-utils

```bash
# install the xz if needed
sudo apt-get install xz-utils
```

Either install by script:

```bash
wget https://github.com/tednilsen/LazarusRPi3/raw/master/install_all.sh
chmod +x install_all.sh
./install_all.sh
```

or manually install here:

```bash
# create the installation folder
cd
mkdir Development
cd Development

# download all the folders and files
wget https://github.com/tednilsen/LazarusRPi3/raw/master/config_lazarus.tar.xz
wget https://github.com/tednilsen/LazarusRPi3/raw/master/fpcbootstrap.tar.xz
wget https://github.com/tednilsen/LazarusRPi3/raw/master/fpcpkgconfig.tar.xz
wget https://github.com/tednilsen/LazarusRPi3/raw/master/fpcupdeluxe.tar.xz
wget https://github.com/tednilsen/LazarusRPi3/raw/master/fpcupdeluxe.ini
wget https://github.com/tednilsen/LazarusRPi3/raw/master/fpc.tar.xz.partaa
wget https://github.com/tednilsen/LazarusRPi3/raw/master/fpc.tar.xz.partab
wget https://github.com/tednilsen/LazarusRPi3/raw/master/fpcsrc.tar.xz.partaa
wget https://github.com/tednilsen/LazarusRPi3/raw/master/fpcsrc.tar.xz.partab
wget https://github.com/tednilsen/LazarusRPi3/raw/master/lazarus.tar.xz.partaa
wget https://github.com/tednilsen/LazarusRPi3/raw/master/lazarus.tar.xz.partab
wget https://github.com/tednilsen/LazarusRPi3/raw/master/lazarus.tar.xz.partac
wget https://github.com/tednilsen/LazarusRPi3/raw/master/lazarus.tar.xz.partad
wget https://github.com/tednilsen/LazarusRPi3/raw/master/lazarus.tar.xz.partae

# combine parts and delete leftover-parts
cat fpc.tar.xz.part* > fpc.tar.xz
rm fpc.tar.xz.part*
cat fpcsrc.tar.xz.part* > fpcsrc.tar.xz
rm fpcsrc.tar.xz.part*
cat lazarus.tar.xz.part* > lazarus.tar.xz
rm lazarus.tar.xz.part*

# grab extra files if needed
wget https://github.com/tednilsen/LazarusRPi3/raw/master/compress_all.sh
chmod +x compress_all.sh

# extract the folders
for f in *.tar.xz; do tar -xf "$f"; done

# create folders
mkdir -p tmp
mkdir -p projects
```

...all files extracted, now create a desktop shortcut for Lazarus.
```bash
cd
# if no folder named Desktop, create one
mkdir Desktop
cd Desktop
cat <<EOF >Lazarus.desktop
[Desktop Entry]
Name=Lazarus
Encoding=UTF-8
Type=Application
Terminal=false
Icon=/home/pi/Development/lazarus/images/icons/lazarus.ico
Exec=/home/pi/Development/lazarus/lazarus --pcp="/home/pi/Development/config_lazarus" %f
GenericName=Lazarus IDE with Free Pascal Compiler
Category=Application;IDE;Development;GUIDesigner;Programming;
Categories=Application;IDE;Development;GUIDesigner;Programming;
Keywords=editor;Pascal;IDE;FreePascal;fpc;Design;Designer;
EOF
chmod +x Lazarus.desktop
```

All done, Lazarus is installed with a desktop-shortcut ...enjoy FPC and Lazarus on RPi3!
