<a href="https://github.com/Mixeway/MixewayHub/blob/master/releasenote:wq:.md"><img src="https://img.shields.io/badge/version-1.0.0-blue" alt="https://img.shields.io/badge/-changelog-blue.svg" data-canonical-src="https://img.shields.io/badge/-changelog-blue.svg" style="max-width:100%;"></a>
<a href="hub.docker.comd"><img src="https://img.shields.io/docker/pulls/mixeway/backend?logo=Mixeway&style=plastic" alt="https://img.shields.io/badge/-changelog-blue.svg" data-canonical-src="https://img.shields.io/badge/-changelog-blue.svg" style="max-width:100%;"></a>
[![Build Status](https://travis-ci.org/Mixeway/MixewayBackend.svg?branch=master)](https://travis-ci.org/Mixeway/MixewayBackend)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=Mixeway_MixewayBackend&metric=alert_status)](https://sonarcloud.io/dashboard?id=Mixeway_MixewayBackend)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=Mixeway_MixewayBackend&metric=security_rating)](https://sonarcloud.io/dashboard?id=Mixeway_MixewayBackend)

<img src="https://mixeway.io/img/mixewaybadge.png">

# Mixeway Hub <img src="https://mixeway.github.io/img/logo_dashboard.png" height="60px">


<img src="https://mixeway.github.io/img/arch.png">

### About Mixeway:
Mixeway is an OpenSource software that is meant to simplify the process of security assurance of projects which are implemented using CICD procedures. **Mixawey is not another vulnerability scanning
software - it is security orchestration tool**.

<img src="https://mixeway.io/img/createproject.gif">

With number of plugins for Vulnerability Scanners :
<img src="https://mixeway.github.io/img/nessus.png" height="50px">
<img src="https://mixeway.github.io/img/openvas.jpg" height="50px">
<img src="https://mixeway.github.io/img/acunetix.jpg" height="50px">
<img src="https://mixeway.github.io/img/fortify.jpg" height="50px">
<img src="https://mixeway.github.io/img/deptrack.png" height="50px">
<img src="https://mixeway.github.io/img/cis.png" height="50px">
<img src="https://mixeway.github.io/img/jenkins.jpg" height="50px">
<img src="https://mixeway.github.io/img/jira.jpg" height="50px">
<img src="https://www.checkmarx.com/wp-content/uploads/2019/10/Checkmarx-logo-2019-horizontal-4.png" height="50px">

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
- <a href="https://hub.docker.com/_/postgres">DB - postgres database</a>
- <a href="https://www.vaultproject.io/">Vault - password store</a>
- <a href="https://github.com/Mixeway/MixewayHub">MixewayHub - parent project which contain docker-compose and one click instalation </a>


###### Requirements:
- Docker-compose

###### Hashicorp Vault integration:
Mixeway has to be able to reuse given passwords and api keys in order to use them with Vulnerability Scanning interactions.

**Vault integration is optional but it is strongly recommended to be included - otherwise password for vulnerability scanners will
be stored in plaintext.**


###### Running Mixeway:
There are 2 requirements for Mixeway to be successfully deployed using prepared docker-compose.
- minimal environments file to be properly configured:
```
TRUSTPASS=changeit
KEYALIAS=localhost
P12PASS=changeit
PROFILE=prod
```
- Recomended (with vault integration) environments file to be properly configured:
```
VAULT_HOST=127.0.0.1
VAULT_PORT=8200
VAULT_SCHEME=http
VAULT_APP_NAME=mixeway
VAULT_TOKEN=ffffffff-ffff-ffff-ffff-fffffffffff
KEYALIAS=localhost
TRUSTPASS=changeit
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
