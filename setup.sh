#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
end=$'\e[0m'
rm environments
CN=localhost
P12PASS=changeit
TRUSTPASS=changeit
echo "Generating Key pair.."
openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout pki/private.key -out pki/cert.crt -subj "/CN=$CN" &> /dev/null
echo "Generating PKCS12.."
openssl pkcs12 -export -inkey pki/private.key -in pki/cert.crt -out pki/certificate.p12 -name "$CN" -password pass:$P12PASS
cat pki/cert.crt >> pki/ca.pem
echo "Generating environments.."
echo "KEYALIAS=$CN" >> environments
echo "TRUSTPASS=$TRUSTPASS" >> environments
echo "P12PASS=$P12PASS" >> environments
echo "PROFILE=prod" >> environments
echo "Verifying created configuration .."
if [[ -f pki/ca.pem && -f pki/certificate.p12 && -f pki/cert.crt && -f pki/private.key ]]; then
 echo "${grn}Verification successfull.${end}"
 echo "${grn}You can now run --- docker-compose up ---${end}"
else
 echo "${red}Verification unsuccessfull, please make sure that You have permission to create file in this location and OpenSSL package is avaliable${end}"
fi
