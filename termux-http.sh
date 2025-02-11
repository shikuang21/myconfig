#!/data/data/com.termux/files/usr/bin/sh
termux-change-repo
pkg update
echo '安装依赖'
pkg instal termux-services tsu python rustscan -y
apt install -y wget dpkg
pip install requests 
echo '下载Python文件'
wget https://mirror.ghproxy.com/https://github.com/ykxVK8yL5L/myconfig/raw/main/server.py -O server.py
wget https://mirror.ghproxy.com/https://github.com/ykxVK8yL5L/myconfig/raw/main/address.py -O address.py

echo '创建开机启动http服务'
mkdir -p $PREFIX/var/service/http/log 
ln -sf $PREFIX/share/termux-services/svlogger $PREFIX/var/service/http/log/run
echo '#!/data/data/com.termux/files/usr/bin/sh' > $PREFIX/var/service/http/run
echo 'exec 2>&1' >> $PREFIX/var/service/http/run
echo 'cd ~ && python server.py' >> $PREFIX/var/service/http/run
chmod a+x $PREFIX/var/service/http/run
sv-enable http 
sv up http 
echo '请重启termux'
