#!/bin/bash
# instGlobal.sh
 
echo "instGlobal.sh ...."
 
echo "install package for GNU global..."
sudo apt-get update
sudo apt-get -y install curl
sudo apt-get -y install wget
sudo apt-get -y install ncurses-dev
sudo apt-get -y install python
sudo apt-get -y install git


CUR=`pwd`
CORE=`cat /proc/cpuinfo | grep processor | tail -n 1 | cut -d' ' -f 2`
mkdir -p build
cd build
echo "install universal-ctags"
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make -j $CORE
sudo make install
cd ..

echo "install pip..."
curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo python
 
echo "install pygments..."
sudo -H pip -U install pygments

echo "install GNU global..."
wget ftp.gnu.org/pub/gnu/global/global-6.6.2.tar.gz
tar zxvf global-6.6.2.tar.gz
cd global-6.6.2
./configure
make -j $CORE
sudo make install
sudo -H pip install Pygments
cp gtags.conf ~/.globalrc
sed -i 's/tc=native/tc=native:tc=pygments/g' ~/.globalrc

cd $CUR
read -p "Remove all download files?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rm -rf build
fi
echo "install GNU global is Done!"
exit 0
