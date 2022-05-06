#!/bin/sh

cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
adduser -D $FTP_USR
echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd 
chown -R ${FTP_USER}:${FTP_USR} /home/yait-bam
chmod 777 -R /home/yait-bam
echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf