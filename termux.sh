#!/data/data/com.termux/files/usr/bin/sh
pkg update
#termux-change-repo
pkg instal termux-services tsu -y
apt install -y wget dpkg
wget https://mirror.ghproxy.com/https://github.com/ykxVK8yL5L/alist/releases/latest/download/alist_termux_aarch64.deb -O alist.deb
dpkg -i alist.deb
alist admin set admin
sed -i 's/5244/10002/g' data/config.json
mkdir -p $PREFIX/var/service/alist/log 
ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/alist/log/run
echo '#!/data/data/com.termux/files/usr/bin/sh' > $PREFIX/var/service/alist/run
echo 'exec 2>&1' >> $PREFIX/var/service/alist/run
echo 'cd ~ && alist server' >> $PREFIX/var/service/alist/run
chmod a+x $PREFIX/var/service/alist/run
sv-enable alist 
sv up alist 
