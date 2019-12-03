
# Mixeway Hub <img src="https://mixeway.github.io/img/logo_dashboard.png" height="60px">

### Disclaimer:
> The current version of Mixaway (0.9) is considered as beta. It contains several bugs and vulnerabilities. Every fix
is put on the board and proceed to make sure version 1.0 will be vulnerability and bug-free. 

<img src="https://mixeway.github.io/img/arch.png">

### About Mixeway:
Mixeway is an OpenSource software that is meant to simplify the process of security assurance of projects which are implemented using CICD procedures. **Mixawey is not another vulnerability scanning
software - it is security orchestration tool**.

With number of plugins for Vulnerability Scanners :
<img src="https://mixeway.github.io/img/nessus.png" height="50px">
<img src="https://mixeway.github.io/img/openvas.jpg" height="50px">
<img src="https://mixeway.github.io/img/acunetix.jpg" height="50px">
<img src="https://mixeway.github.io/img/fortify.jpg" height="50px">
<img src="https://mixeway.github.io/img/depcheck.png" height="50px">
<img src="https://mixeway.github.io/img/cis.png" height="50px">
<img src="https://mixeway.github.io/img/jenkins.jpg" height="50px">
<img src="https://mixeway.github.io/img/jira.jpg" height="50px">

With all this available, Mixeway provides functionalities to:
- Automatic service discovery (IaaS Plugin for assets and network scans for services)
- Automatic Vulnerability Scan Configuration (Based on most recent configuration) - hands-free!
- Automatic and on-demand Vulnerability scan execution (based on policy and executed via a REST API call)
- One Vulnerability Database for all type of sources - SAST, DAST, OpenSource and Infrastructure vulnerabilities in one place
- Customizable Security Quality Gateway - a reliable piece of information for CICD to decide if a job should pass or not.
- REST API enables integration with already used Vulnerability Management systems used within the organization.

Elements of a system:
- <a href="https://github.com/Mixeway/MixewayBackend">Backend - Spring Boot REST API</a>
- <a href="https://github.com/Mixeway/MixewayFrontend">Frontend - Angular 8 application </a>
- <a href="https://hub.docker.com/repository/docker/mixeway/db">DB - postgres database</a>
- <a href="https://hub.docker.com/repository/docker/mixeway/vault">Vault - password store</a>
- <a href="https://github.com/Mixeway/MixewayHub">MixewayHub - parent project which contain docker-compose and one click instalation </a>


###### Requirements:
- Docker-compose


###### Running Mixeway:
There are 2 requirements for Mixeway to be successfully deployed using prepared docker-compose.
- environments file to be properly configured:
```
TRUSTPASS=changeit
KEYALIAS=localhost
P12PASS=changeit
PROFILE=prod
```
Where TRUSTPASS is password for CACERT file (java keystore containing trusted root certificates), KEYALIAS alias for key stored within PKCS12 file and P12PASS - password for PKCS12 file containing both certificate and private key.
- Certificates are in the proper place. There should be `pki` directory in the folder where docker-compose.yml is located. It is important that the `pki` directory will contain files:
  - `ca.pem` which contains trusted root certificates (in pem format for nginx)
  - `cert.crt` which contains public key in pem format
  - `private.key` which contains private key in pem format
  - `certificate.p12` PKCS12 file of cert.crt and private.key
  - `trust.jks` which could be cacerts of JVM 
  
There is `setup` script prepared for `Unix` machines which generate certificates and prepare `environments`

Usage:
```
git clone https://github.com/Mixeway/MixewayHub
/bin/sh startup.sh
docker-compose pull
docker-compose up
```

You can either use `setup` script or prepare environment on Your own using the guide above.

Mixeway will be available at https://__Your_IP_goes_here
