#!/bin/bash
red=$'\e[1;31m'
grn=$'\e[1;32m'
end=$'\e[0m'
rm environments
mkdir -p pki
CN=localhost
P12PASS=changeit
TRUSTPASS=changeit
generate_files() {
  echo "Generating Key pair.."
  openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout pki/private.key -out pki/cert.crt -subj "/CN=$CN" &> /dev/null
  echo "Generating PKCS12.."
  openssl pkcs12 -export -inkey pki/private.key -in pki/cert.crt -out pki/certificate.p12 -name "$CN" -password pass:$P12PASS
  cat pki/cert.crt >> pki/ca.pem
  echo "Generating environments.."
  echo "FRONTEND_URL=https://localhost" >> environments
  echo "KEYALIAS=$CN" >> environments
  echo "TRUSTPASS=$TRUSTPASS" >> environments
  echo "P12PASS=$P12PASS" >> environments
  echo "PROFILE=prod" >> environments
  echo "CERTIFICATE=/pki/cert.crt" >> environments
  echo "PRIVATEKEY=/pki/private.key" >> environments
  echo "Verifying created configuration .."
  if [[ -f pki/ca.pem && -f pki/certificate.p12 && -f pki/cert.crt && -f pki/private.key ]]; then
    echo "${grn}Verification successfull.${end}"
    echo "${grn}You can now run --- docker-compose up ---${end}"
  else
    echo "${red}Verification unsuccessfull, please make sure that You have permission to create file in this location and OpenSSL package is avaliable${end}"
  fi
}
process_vault() {
  read -p "Enter Vault host [127.0.0.1]: " VAULT_HOST
  VAULT_HOST=${VAULT_HOST:-127.0.0.1}
  read -p "Enter Vault port [8200]: " VAULT_PORT
  VAULT_PORT=${VAULT_PORT:-8200}
  read -p "Enter Vault http scheme http/https [http]: " VAULT_SCHEME
  VAULT_SCHEME=${VAULT_SCHEME:-http}
  read -p "Enter Vault Application name [mixeway]: " VAULT_APP_NAME
  VAULT_APP_NAME=${VAULT_APP_NAME:-mixeway}
  read -p "Enter Vault token: " VAULT_TOKEN
  echo "VAULT_HOST=$VAULT_HOST" >> environments
  echo "VAULT_PORT=$VAULT_PORT" >> environments
  echo "VAULT_SCHEME=$VAULT_SCHEME" >> environments
  echo "VAULT_APP_NAME=$VAULT_APP_NAME" >> environments
  echo "VAULT_TOKEN=$VAULT_TOKEN" >> environments
}
read -p "Enable integration with Hashicorp Vault? (without it passwords to Vulnerability Scanners will be stored in clear text) [Y/N] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    process_vault
    generate_files
else
    generate_files
    echo "VAULT_ENABLED=false" >> environments
fi


