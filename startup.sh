#!/bin/bash
clear
HOMEA="$HOME/linux"
HOMEA2="$HOME/vt"
HOMEV=$HOME/vt
DIS=:0
clear
D="https://discord.com/invite/yahCmFYjKe"
SYSINFO=$(uname -a)
SID=$(uname -n)
PID=$(echo $SID | sed 's/[^0-9]*//g')
VERS=$(uname -r)
SYSTEMSTAT=$VERS$SID$PID$VERS$SID$PID$PID$SID$VERS
S1=$(echo $SYSTEMSTAT | sed 's/[^0-9]*//g')
CH=$(head -n 1 $HOME/code.txt);
echo "preferences { ctrl_c_copy = true ctrl_v_paste = true}" >$HOME/.gotty
echo "preferences { ctrl_c_copy = true ctrl_v_paste = true}" >$HOMEA/.gotty
echo "=============================="
echo "VER 5.2"
echo "Copy paste function"
echo "Most of hostings supported"
echo "Soon way of hosting linux on WebHost 24/7"
echo "=============================="
clear
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export DISPLAY=$DIS
APTHinstalled=""
LDinstalled=""
Linstalled=""
Sinstalled=""
Pinstalled=""
Ginstalled=""
Winstalled=""
STAR0="/lib64:/lib/udev:/lib/systeminfo:/lib/terminfo:/lib:/lib/x86_64-linux-gnu"
STAR1="$HOMEA/lib:$HOMEA/usr/lib:$HOMEA/var/lib:$HOMEA/usr/lib/x86_64-linux-gnu:$HOMEA/lib/x86_64-linux-gnu:$HOMEA/lib:$HOMEA/usr/lib/sudo"
STAR2="$HOMEA/usr/include/x86_64-linux-gnu:$HOMEA/usr/include/x86_64-linux-gnu/bits:$HOMEA/usr/include/x86_64-linux-gnu/gnu"
STAR3="$HOMEA/usr/share/lintian/overrides/:$HOMEA/usr/src/glibc/debian/:$HOMEA/usr/src/glibc/debian/debhelper.in:$HOMEA/usr/lib/mono"
STAR4="$HOMEA/usr/src/glibc/debian/control.in:$HOMEA/usr/lib/x86_64-linux-gnu/libcanberra-0.30:$HOMEA/usr/lib/x86_64-linux-gnu/libgtk2.0-0"
STAR5="$HOMEA/usr/lib/x86_64-linux-gnu/gtk-2.0/modules:$HOMEA/usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/immodules:$HOMEA/usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/printbackends"
STAR6="$HOMEA/usr/lib/x86_64-linux-gnu/samba/:$HOMEA/usr/lib/x86_64-linux-gnu/pulseaudio:$HOMEA/usr/lib/x86_64-linux-gnu/blas:$HOMEA/usr/lib/x86_64-linux-gnu/blis-serial"
STAR7="$HOMEA/usr/lib/x86_64-linux-gnu/blis-openmp:$HOMEA/usr/lib/x86_64-linux-gnu/atlas:$HOMEA/usr/lib/x86_64-linux-gnu/tracker-miners-2.0:$HOMEA/usr/lib/x86_64-linux-gnu/tracker-2.0:$HOMEA/usr/lib/x86_64-linux-gnu/lapack:$HOMEA/usr/lib/x86_64-linux-gnu/gedit:$HOMEA/usr/lib/x86_64-linux-gnu/xrdp"
STAR8="$HOMEA/usr/lib/*:$HOMEA/usr/share/*"


notify() {
clear
echo "$APTHinstalled"
echo "$Linstalled"
echo "$LDinstalled"
echo "$Pinstalled"
echo "System loaded [OK]"
echo "$Sinstalled"
echo "$Ginstalled"
}


APTHinstalled='Initialising environment -> APTH'
notify
echo '|==>...................|10%'
STARALL="$STAR0:$STAR1:$STAR2:$STAR3:$STAR4:$STAR5:$STAR6:$STAR7:$STAR8"
PATALL="$HOMEA/bin:$HOMEA/usr/bin:$HOMEA/sbin:$HOMEA/usr/sbin:$HOMEA/etc/init.d:$HOMEA/udocker:$PATH"

APTHinstalled="APTH already installed | skip [Info]"
notify
if ! [ -f $HOME/usr/bin/apth ];
then
mkdir -p $HOMEA/usr/bin/
curl -o $HOMEA/usr/bin/apth https://igriastranomier.ucoz.ru/apth.txt
chmod +x $HOMEA/usr/bin/apth
APTHinstalled="APTH Donwnloaded [OK]"
fi
Linstalled='Initialising environment -> LIBRARY'
notify
echo '|==========>...........|50%'

Linstalled="LIBRARY_PATH already modifed [info]"
notify
if ! [ -n "$LIBRARY_PATH" ];
then
export LIBRARY_PATH=$STARALL
Linstalled="LIBRARY_PATH is installed [OK]"
fi

LDinstalled='Initialising environment -> LD LIBRARY '
notify
echo '|============>.........|60%'
LDinstalled="LD_LIBRARY_PATH already modifed [Info]"
Pinstalled="PATH already modifed [Info]"
notify
if ! [ -n "$LD_LIBRARY_PATH" ];
then
export LD_LIBRARY_PATH=$STARALL
LDinstalled="LD_LIBRARY_PATH is installed [OK]"
notify

Pinstalled='Initialising environment -> PATH '
echo "|===============>......|75%"
notify
export PATH=$PATALL
Pinstalled="PATH env modifed [OK]"

notify
echo "Rebooting system bash"
echo "|\================/|"
clear
sh $HOME/1.sh
rm -r 1.sh
exit 1
fi
notify
echo "System loaded [OK]"
Sinstalled="Searching -> wget package"
echo "|===============>....|70%"
Sinstalled="Wget already installed skip it [Info]"
if ! [ -f $HOMEA/usr/bin/wget ];
then
notify

Sinstalled="Installing WGET"
notify
echo "|===============>|80%"
mkdir -p $HOMEA
apth install xz-utils wget zip proot rename python
Sinstalled="Wget is installed [OK]"
notify
fi
Ginstalled="Searching -> GoTTy package"
notify
echo "|===============>...|85%"
Ginstalled="Gotty already installed [Info]"
if ! [ -f $HOMEA/gotty ];
then
notify
Ginstalled="Installing GoTTy package"
echo "|===============>...|89%"
wget -O $HOMEA/1.tar.gz https://github.com/yudai/gotty/releases/download/v2.0.0-alpha.3/gotty_2.0.0-alpha.3_linux_amd64.tar.gz
cd $HOMEA && tar xvf 1.tar.gz
rm -r 1.tar.gz
chmod +x gotty
notify
Ginstalled="Gotty is installed [OK]"
fi
notify
echo "Searching -> Debian package"
echo "|===============>..|90%"
Winstalled="Linux package already installed [Info]"
if ! [ -f $HOMEA/proot ];
then
Winstalled="Linux package installed [OK]"
fi


notify
echo "Starting server"
echo "|\===============/|"
echo " "
echo " "

echo "clear">$HOME/DebStart.sh
echo "if ! [ -d $HOME/vt ];">>$HOME/DebStart.sh
echo "then">>$HOME/DebStart.sh
echo "mkdir $HOME/vt">>$HOME/DebStart.sh
echo "cd $HOME/vt && wget -O 1.tar.xz https://www.dropbox.com/s/oinwbrp41jfwrej/ubuntu-20.04.tar.xz">>$HOME/DebStart.sh
echo "cd $HOME/vt && tar xvf 1.tar.xz && rm 1.tar.xz">>$HOME/DebStart.sh
echo "fi">>$HOME/DebStart.sh
echo "cd $HOME/vt && proot -r . -S . /bin/bash">>$HOME/DebStart.sh
chmod $HOME/DebStart.sh

echo "--------------"
if [ -f $HOMEA/gotty ];
then
rm -r 1.sh
echo "**| Open url: $SERVER_IP:$SERVER_PORT |**"
echo "I have no name!@ID -> APTH 'name of package without quotes'"
echo "If you want to run your server or program at startup, use *|startcustom.sh|* file"
echo " "
echo "FOR INSTALL debian run -> sh DebStart.sh"
echo "--------------"

if ! [ -f $HOME/startcustom.sh ];
then
echo "startcustom.sh not found. Creating..."
echo "$HOMEA/gotty -p $SERVER_PORT -w bash &">$HOME/startcustom.sh
chmod +x $HOME/startcustom.sh
fi

if [ -f $HOME/startcustom.sh ];
then
cd $HOME
sh $HOME/startcustom.sh &
fi

fi
