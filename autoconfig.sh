#!/bin/bash
#######################################################
# autoconf v0.1b                                      #
# Copyright (c) P7COMunications LLC 2021 - PANCHO7532 #
#######################################################
# If you're viewing this, it means that somehow you managed to decompile it :D
# Congrats, but if you found this script so useful at the point to break into the source code...
# ...then consider donating me a few dollars so i can code more useful stuff without having to compile it for begin with.
# PayPal: https://paypal.me/pancho7532ar
# BTC: 1MMzQFyQarrWK5GtTDgxBAwMDPRW1u9FNa
# DogeCoin: DDJWJJJQCkjZN7ugZHfmb49WTNAkrQv7jz
#
# Now, enjoy the shittiest bash script that you've ever saw in your life :v
if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] You need to run this script as root"
    exit
fi
if [ ! -z "$SUDO_UID" ]; then
    echo "[ERROR] You need to run this script as root (do not use 'sudo')"
    exit
fi
if [ ! -z "$SUDO_COMMAND" ]; then
    echo "[ERROR] You need to run this script as root (do not use 'sudo')"
    exit
fi
apt install socat wget curl -y
IPVPS4=$(wget -qO- https://ipv4.icanhazip.com/)
IPVPS6=$(wget -qO- https://ipv6.icanhazip.com/)
clear
echo "/=======================================================\\"
echo "| autoconf v0.1b                                        |"
echo "| Copyright (c) P7COMunications LLC 2021 - PANCHO7532   |"
echo "|=======================================================/"
echo "|-> Select operation mode:"
echo "| 1) Trusted fresh install (with CloudFront support)"
echo "| 2) Untrusted fresh install (no CloudFront support)"
echo "| 3) Uninstall"
echo "| 4) Exit"
echo "| - Ensure that your terminal has enough space for an better experience!"
echo "| - Script tested on Ubuntu 18.04 and 20.04, inferior versions may have bugs."
echo "---------------------------------------------------------"
read -p "Choose an option: " CHOICE1
if [ "$CHOICE1" == "1" ]; then
    clear
    echo "/=======================================================\\"
    echo "| autoconf v0.1b                                        |"
    echo "| Copyright (c) P7COMunications LLC 2021 - PANCHO7532   |"
    echo "|=======================================================/"
    echo "|-> Pre-Install Instructions"
    echo "| - This option requires an registered domain!"
    echo "| - Get one for free at https://freenom.com or buy one"
    echo "|   from somewhere"
    echo "| - Add an top-domain or sub-domain record on your panel"
    echo "|   with the IP of this machine."
    echo "| - This domain/record will be used for generate your"
    echo "|   new trusted certificate and can't be mistyped!"
    echo "| - PORT 80 MUST BE FREE WITHOUT ANY PROGRAM RUNNING/USING IT!"
    echo "| - YOUR MACHINE MUST HAVE AN x64 PROCESSOR ARCHITECTURE!"
    echo "| - Enter down below the domain you choosed, if you"
    echo "|   associated your IP to the record (for example) 'vps.example.com'"
    echo "|   then you need to write here 'vps.example.com'"
    echo "---------------------------------------------------------"
    echo "[>] IPv4 address: $IPVPS4"
    echo "[>] IPv6 address: $IPVPS6"
    echo "---------------------------------------------------------"
    read -p "Type your domain: " CDOMAIN1
    if [ "$CDOMAIN1" == "" ]; then
        echo "[ERROR] Your domain can't be empty."
        exit
    fi
    clear
    echo "/=======================================================\\"
    echo "| autoconf v0.1b                                        |"
    echo "| Copyright (c) P7COMunications LLC 2021 - PANCHO7532   |"
    echo "|=======================================================/"
    echo "|-> Using domain: $CDOMAIN1"
    echo "| Do you want to start?"
    echo "---------------------------------------------------------"
    read -p "Press anything to start or 1 to cancel: " CHOICE2
    if [ "$CHOICE2" == "1" ]; then
        exit
    fi
    apt update
    apt upgrade -y
    apt install dropbear stunnel gcc cmake make build-essential unzip zip openssl net-tools -y
    chmod 0777 /etc/default/dropbear
    echo "IyBkaXNhYmxlZCBiZWNhdXNlIE9wZW5TU0ggaXMgaW5zdGFsbGVkCiMgY2hhbmdlIHRvIE5PX1NUQVJUPTAgdG8gZW5hYmxlIERyb3BiZWFyCk5PX1NUQVJUPTAKIyB0aGUgVENQIHBvcnQgdGhhdCBEcm9wYmVhciBsaXN0ZW5zIG9uCkRST1BCRUFSX1BPUlQ9NDAwMDAKCiMgYW55IGFkZGl0aW9uYWwgYXJndW1lbnRzIGZvciBEcm9wYmVhcgpEUk9QQkVBUl9FWFRSQV9BUkdTPSIiCgojIHNwZWNpZnkgYW4gb3B0aW9uYWwgYmFubmVyIGZpbGUgY29udGFpbmluZyBhIG1lc3NhZ2UgdG8gYmUKIyBzZW50IHRvIGNsaWVudHMgYmVmb3JlIHRoZXkgY29ubmVjdCwgc3VjaCBhcyAiL2V0Yy9pc3N1ZS5uZXQiCkRST1BCRUFSX0JBTk5FUj0iIgoKIyBSU0EgaG9zdGtleSBmaWxlIChkZWZhdWx0OiAvZXRjL2Ryb3BiZWFyL2Ryb3BiZWFyX3JzYV9ob3N0X2tleSkKI0RST1BCRUFSX1JTQUtFWT0iL2V0Yy9kcm9wYmVhci9kcm9wYmVhcl9yc2FfaG9zdF9rZXkiCgojIERTUyBob3N0a2V5IGZpbGUgKGRlZmF1bHQ6IC9ldGMvZHJvcGJlYXIvZHJvcGJlYXJfZHNzX2hvc3Rfa2V5KQojRFJPUEJFQVJfRFNTS0VZPSIvZXRjL2Ryb3BiZWFyL2Ryb3BiZWFyX2Rzc19ob3N0X2tleSIKCiMgRUNEU0EgaG9zdGtleSBmaWxlIChkZWZhdWx0OiAvZXRjL2Ryb3BiZWFyL2Ryb3BiZWFyX2VjZHNhX2hvc3Rfa2V5KQojRFJPUEJFQVJfRUNEU0FLRVk9Ii9ldGMvZHJvcGJlYXIvZHJvcGJlYXJfZWNkc2FfaG9zdF9rZXkiCgojIFJlY2VpdmUgd2luZG93IHNpemUgLSB0aGlzIGlzIGEgdHJhZGVvZmYgYmV0d2VlbiBtZW1vcnkgYW5kCiMgbmV0d29yayBwZXJmb3JtYW5jZQpEUk9QQkVBUl9SRUNFSVZFX1dJTkRPVz02NTUzNgo=" | base64 --decode > /etc/default/dropbear
    chmod 0644 /etc/default/dropbear
    chmod 0777 /etc/shells
    echo -e "/bin/false\r\n/usr/sbin/nologin" >> /etc/shells
    chmod 0644 /etc/shells
    sed -i "s/enforce_for_root //g" /etc/pam.d/common-password
    sed -i "s/enforce_for_root//g" /etc/pam.d/common-password
    wget -O node.tar.xz https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz
    tar xf node.tar.xz
    mv node-v16.13.0-linux-x64 /opt/node
    ln -s /opt/node/bin/node /usr/bin/node
    ln -s /opt/node/bin/npm /usr/bin/npm
    ln -s /opt/node/bin/npx /usr/bin/npx
    rm node.tar.xz
    mkdir /etc/p7common
    wget https://github.com/ambrop72/badvpn/archive/master.zip -P /tmp
    wget https://gitlab.com/PANCHO7532/scripts-and-random-code/-/raw/master/nfree/proxy3.js -P /etc/p7common
    wget https://gitlab.com/PANCHO7532/scripts-and-random-code/-/raw/master/nfree/badvpn.service -P /etc/systemd/system
    wget https://gitlab.com/PANCHO7532/scripts-and-random-code/-/raw/master/nfree/nodews1.service -P /etc/systemd/system
    wget https://gitlab.com/PANCHO7532/scripts-and-random-code/-/raw/master/nfree/stunnel.conf -P /etc/stunnel
    unzip /tmp/master.zip -d /tmp
    cd /tmp/badvpn-master && mkdir build && cd build
    cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
    make install
    cd /etc/stunnel
    curl https://get.acme.sh | sh
    $HOME/.acme.sh/acme.sh --set-default-ca --server letsencrypt
    $HOME/.acme.sh/acme.sh --issue -d $CDOMAIN1 --standalone
    cat $HOME/.acme.sh/$CDOMAIN1/$CDOMAIN1.key $HOME/.acme.sh/$CDOMAIN1/$CDOMAIN1.cer $HOME/.acme.sh/$CDOMAIN1/ca.cer > /etc/stunnel/stunnel.pem
    systemctl enable badvpn
    systemctl start badvpn
    systemctl enable nodews1
    systemctl start nodews1
    systemctl enable stunnel4
    systemctl restart stunnel4
    echo "IyEvYmluL2Jhc2gKU1VETz0iIgppZiBbIC16ICQxIF07IHRoZW4KICAgIGVjaG8gIltFUlJPUl0gWW91IG5lZWQgdG8gc3BlY2lmeSBhbiBuYW1lIGZvciB0aGUgbmV3IHVzZXIiCiAgICBleGl0CmZpCmlmIFsgLWYgIi91c3IvYmluL3N1ZG8iIF07IHRoZW4KICAgIFNVRE89InN1ZG8iCmZpCiRTVURPIHVzZXJhZGQgLU0gJDEgLXMgL2Jpbi9mYWxzZQpleGl0" | base64 --decode > /usr/bin/ucreate
    echo "IyEvYmluL2Jhc2gKU1VETz0iIgppZiBbIC16ICQxIF07IHRoZW4KICAgIGVjaG8gIltFUlJPUl0gWW91IG5lZWQgdG8gc3BlY2lmeSBhbiBuYW1lIGZvciB0aGUgbmV3IHVzZXIiCiAgICBleGl0CmZpCmlmIFsgLWYgIi91c3IvYmluL3N1ZG8iIF07IHRoZW4KICAgIFNVRE89InN1ZG8iCmZpCiRTVURPIHVzZXJkZWwgLXIgLWYgJDEKZXhpdA==" | base64 --decode > /usr/bin/udelete
    chmod +x /usr/bin/ucreate
    chmod +x /usr/bin/udelete
    clear
    echo "/=======================================================\\"
    echo "| autoconf v0.1b                                        |"
    echo "| Copyright (c) P7COMunications LLC 2021 - PANCHO7532   |"
    echo "|=======================================================/"
    echo "|-> Done!"
    echo "| You can now create users by typing 'ucreate' + username"
    echo "| And delete them by typing 'udelete' + username"
    echo "| Write down this information NOW, it wont be shown again!"
    shutdown -r 1
    sleep 55
    exit
elif [ "$CHOICE1" == "2" ]; then
    clear
    echo "/=======================================================\\"
    echo "| autoconf v0.1b                                        |"
    echo "| Copyright (c) P7COMunications LLC 2021 - PANCHO7532   |"
    echo "|=======================================================/"
    echo "|-> Pre-Install Instructions"
    echo "| - PORT 80 AND 443 MUST BE FREE WITHOUT ANY PROGRAM RUNNING/USING IT!"
    echo "| - YOUR MACHINE MUST HAVE AN x64 PROCESSOR ARCHITECTURE!"
    echo "| Do you want to start?"
    read -p "Press anything to start or 1 to cancel: " CHOICE2
    if [ "$CHOICE2" == "1" ]; then
        exit
    fi
    apt update
    apt upgrade -y
    apt install dropbear stunnel gcc cmake make build-essential unzip zip openssl net-tools -y
    chmod 0777 /etc/default/dropbear
    echo "IyBkaXNhYmxlZCBiZWNhdXNlIE9wZW5TU0ggaXMgaW5zdGFsbGVkCiMgY2hhbmdlIHRvIE5PX1NUQVJUPTAgdG8gZW5hYmxlIERyb3BiZWFyCk5PX1NUQVJUPTAKIyB0aGUgVENQIHBvcnQgdGhhdCBEcm9wYmVhciBsaXN0ZW5zIG9uCkRST1BCRUFSX1BPUlQ9NDAwMDAKCiMgYW55IGFkZGl0aW9uYWwgYXJndW1lbnRzIGZvciBEcm9wYmVhcgpEUk9QQkVBUl9FWFRSQV9BUkdTPSIiCgojIHNwZWNpZnkgYW4gb3B0aW9uYWwgYmFubmVyIGZpbGUgY29udGFpbmluZyBhIG1lc3NhZ2UgdG8gYmUKIyBzZW50IHRvIGNsaWVudHMgYmVmb3JlIHRoZXkgY29ubmVjdCwgc3VjaCBhcyAiL2V0Yy9pc3N1ZS5uZXQiCkRST1BCRUFSX0JBTk5FUj0iIgoKIyBSU0EgaG9zdGtleSBmaWxlIChkZWZhdWx0OiAvZXRjL2Ryb3BiZWFyL2Ryb3BiZWFyX3JzYV9ob3N0X2tleSkKI0RST1BCRUFSX1JTQUtFWT0iL2V0Yy9kcm9wYmVhci9kcm9wYmVhcl9yc2FfaG9zdF9rZXkiCgojIERTUyBob3N0a2V5IGZpbGUgKGRlZmF1bHQ6IC9ldGMvZHJvcGJlYXIvZHJvcGJlYXJfZHNzX2hvc3Rfa2V5KQojRFJPUEJFQVJfRFNTS0VZPSIvZXRjL2Ryb3BiZWFyL2Ryb3BiZWFyX2Rzc19ob3N0X2tleSIKCiMgRUNEU0EgaG9zdGtleSBmaWxlIChkZWZhdWx0OiAvZXRjL2Ryb3BiZWFyL2Ryb3BiZWFyX2VjZHNhX2hvc3Rfa2V5KQojRFJPUEJFQVJfRUNEU0FLRVk9Ii9ldGMvZHJvcGJlYXIvZHJvcGJlYXJfZWNkc2FfaG9zdF9rZXkiCgojIFJlY2VpdmUgd2luZG93IHNpemUgLSB0aGlzIGlzIGEgdHJhZGVvZmYgYmV0d2VlbiBtZW1vcnkgYW5kCiMgbmV0d29yayBwZXJmb3JtYW5jZQpEUk9QQkVBUl9SRUNFSVZFX1dJTkRPVz02NTUzNgo=" | base64 --decode > /etc/default/dropbear
    chmod 0644 /etc/default/dropbear
    chmod 0777 /etc/shells
    echo -e "/bin/false\r\n/usr/sbin/nologin" >> /etc/shells
    chmod 0644 /etc/shells
    sed -i "s/enforce_for_root //g" /etc/pam.d/common-password
    sed -i "s/enforce_for_root//g" /etc/pam.d/common-password
    wget -O node.tar.xz https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz
    tar xf node.tar.xz
    mv node-v16.13.0-linux-x64 /opt/node
    ln -s /opt/node/bin/node /usr/bin/node
    ln -s /opt/node/bin/npm /usr/bin/npm
    ln -s /opt/node/bin/npx /usr/bin/npx
    rm node.tar.xz
    mkdir /etc/p7common
    wget https://github.com/ambrop72/badvpn/archive/master.zip -P /tmp
    wget https://gitlab.com/PANCHO7532/scripts-and-random-code/-/raw/master/nfree/proxy3.js -P /etc/p7common
    wget https://gitlab.com/PANCHO7532/scripts-and-random-code/-/raw/master/nfree/badvpn.service -P /etc/systemd/system
    wget https://gitlab.com/PANCHO7532/scripts-and-random-code/-/raw/master/nfree/nodews1.service -P /etc/systemd/system
    wget https://gitlab.com/PANCHO7532/scripts-and-random-code/-/raw/master/nfree/stunnel.conf -P /etc/stunnel
    unzip /tmp/master.zip -d /tmp
    cd /tmp/badvpn-master && mkdir build && cd build
    cmake .. -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
    make install
    cd /etc/stunnel
    openssl genrsa -out key.pem 2048
    openssl req -new -x509 -key key.pem -out cert.pem -subj "/C=US/ST=California/L=California/O=Common/OU=Common/CN=*/emailAddress=abuse@common.com" -days 1095
    cat key.pem cert.pem > stunnel.pem
    systemctl enable badvpn
    systemctl start badvpn
    systemctl enable nodews1
    systemctl start nodews1
    systemctl enable stunnel4
    systemctl restart stunnel4
    echo "IyEvYmluL2Jhc2gKU1VETz0iIgppZiBbIC16ICQxIF07IHRoZW4KICAgIGVjaG8gIltFUlJPUl0gWW91IG5lZWQgdG8gc3BlY2lmeSBhbiBuYW1lIGZvciB0aGUgbmV3IHVzZXIiCiAgICBleGl0CmZpCmlmIFsgLWYgIi91c3IvYmluL3N1ZG8iIF07IHRoZW4KICAgIFNVRE89InN1ZG8iCmZpCiRTVURPIHVzZXJhZGQgLU0gJDEgLXMgL2Jpbi9mYWxzZQpleGl0" | base64 --decode > /usr/bin/ucreate
    echo "IyEvYmluL2Jhc2gKU1VETz0iIgppZiBbIC16ICQxIF07IHRoZW4KICAgIGVjaG8gIltFUlJPUl0gWW91IG5lZWQgdG8gc3BlY2lmeSBhbiBuYW1lIGZvciB0aGUgbmV3IHVzZXIiCiAgICBleGl0CmZpCmlmIFsgLWYgIi91c3IvYmluL3N1ZG8iIF07IHRoZW4KICAgIFNVRE89InN1ZG8iCmZpCiRTVURPIHVzZXJkZWwgLXIgLWYgJDEKZXhpdA==" | base64 --decode > /usr/bin/udelete
    chmod +x /usr/bin/ucreate
    chmod +x /usr/bin/udelete
    clear
    echo "/=======================================================\\"
    echo "| autoconf v0.1b                                        |"
    echo "| Copyright (c) P7COMunications LLC 2021 - PANCHO7532   |"
    echo "|=======================================================/"
    echo "|-> Done!"
    echo "| You can now create users by typing 'ucreate' + username"
    echo "| And delete them by typing 'udelete' + username"
    echo "| Write down this information NOW, it wont be shown again!"
    shutdown -r 1
    sleep 55
    exit
elif [ "$CHOICE1" == "3" ]; then
    # Uninstall
    clear
    echo "/=======================================================\\"
    echo "| autoconf v0.1b                                        |"
    echo "| Copyright (c) P7COMunications LLC 2021 - PANCHO7532   |"
    echo "|=======================================================/"
    echo "|-> Uninstall"
    echo "| Do you want to start?"
    read -p "Press anything to start or 1 to cancel: " CHOICE2
    if [ "$CHOICE2" == "1" ]; then
        exit
    fi
    systemctl disable badvpn
    systemctl stop badvpn
    systemctl disable nodews1
    systemctl stop nodews1
    systemctl disable stunnel4
    systemctl stop stunnel4
    systemctl daemon-reload
    rm /etc/systemd/system/badvpn.service
    rm /etc/systemd/system/nodews1.service
    apt purge dropbear stunnel -y
    rm -rf /opt/node
    rm /usr/bin/node
    rm /usr/bin/npm
    rm /usr/bin/npx
    rm -rf /etc/p7common
    rm -rf /etc/dropbear
    rm -rf /etc/stunnel
    $HOME/.acme.sh/acme.sh --uninstall
    rm -rf $HOME/.acme.sh
    rm /usr/bin/ucreate
    rm /usr/bin/udelete
    clear
    echo "/=======================================================\\"
    echo "| autoconf v0.1b                                        |"
    echo "| Copyright (c) P7COMunications LLC 2021 - PANCHO7532   |"
    echo "|=======================================================/"
    echo "|-> Done!"
    echo "| Your system will be rebooted in one minute for finish the uninstall."
    shutdown -r 1
    exit
fi
exit