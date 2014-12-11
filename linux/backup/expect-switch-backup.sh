#!/usr/bin/expect
set timeout 15

set ftp_name "FTP_NAME"
set ftp_pass "FTP_PASS"
set ftp_ip "SW_IP"
set sw_name "SW_NAME"
set sw_pass "SW_PASS"
set sw_ip "SW_IP"
set sw_user "SW_USERNAME"
set sw_port "SW_SSH_PORT
set fname vrpcfg-sw0-[exec date +%Y-%m-%d].zip

spawn ssh $sw_user@$sw_ip -p$sw_port

expect "password:"
send "$sw_pass\r"

expect "<SW0>"
send "ftp $ftp_ip\r"

expect "none)):"
send "$ftp_name\r"

expect "Enter password:"
send "$ftp_pass\r"

send "binary\r"
send "cd $sw_name\r"

send "put vrpcfg-$sw_name.zip $fname\r"
send "quit\r"	
send "quit\r"

expect eof
