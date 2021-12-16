## 1.5.0 (2021-12-16)
#### New Features
* New main dashboard
* New project dashboard

#### Bug Fixes
* Adjusted and fixed problems with Checkmarx scans

## 1.4.1 (2021-03-10)
#### New Features
* Possibility to configure global git credentials (url + username:password) for SAST plugins

#### Bug Fixes
* Fixed window with editing of source code repository values

## 1.4.0 (2021-01-18)
#### New Features
* Adding REST Endpoint which return result of Security Quaility Gateway for particular Code Repository
* Added Orange Poland Logo
* Knowlege base - possibility to create custom severity for vulnerabilities
* Openscap support for CIS Benchmark

#### Bug Fixes
* Fixing CI Script to fit newest version of MixewayBackend 

## 1.3.5 (2020-11-26)
#### Bug Fixes
* Fixing CI Script to fit newest version of MixewayBackend

<a name="1.3.4"></a>
## 1.3.4 (2020-09-02)

#### New Features
* New Methods for CICD integration with Mixeway Scanner

<a name="1.3.3"></a>
## 1.3.3 (2020-08-23)

#### New Features
* User Profile eidition (change password)
* Dark mode enabled (change in user profile)
* Update to Angular 10 and ngx-admin 6.0.0
* Intorduced role CICD and possibility to generate CICD Api Key for standard users
* Introduced new methods for interacting with CICD


#### Bug Fixes
* Fixed a bug with project name display during confirmation of deletion
* Fixed a bug with not reloading proxy and routing domain in admin zone. No refresh is now required.

<a name="1.3.2"></a>
## 1.3.2 (2020-07-23)

#### Bug Fixes
* Fixed Bug related with running scan on GVM (scope single, multiple asset)
* Fixed logging during running scans on GVM
* Fixed Bug related with problems in using Vuln Auditor


<a name="1.3.1"></a>
## 1.3.1 (2020-07-16)

#### New Features
* Configurable Security Quality Gateway (accessible from settings)
* AWS EC2 Integration in terms of assets information loading

<a name="1.3.0"></a>
## 1.3.0 (2020-05-31)

#### New Features

* Mixeway Vuln Auditor - DeepLearning microservice which use Neural Network to classify software vulnerabilities
* Vulnerability Description is displayed in more proper manner. Modal displaying details is allowing user to confirm or
deny vulnerability
* Possibility to create Application profile, on both project or asset level information gathered and put into profile
helps Vuln Auditor to better understand application context and then classify vulnerability

#### Bug Fixes
* Tables filtering set to proper level. Whenever possible select fields are possible to show.
* Vulnerabilities are no longer deleted before loading from scanner. ID of detected vulnerability is constant, vulnerability is deleted
only if it is not detected in next scan.

#### Removed Features
* Partitioning software vulnerabilities was removed, in this place single tab is displayed with colum which allows to filter

<a name="1.2.3"></a>
## 1.2.3 (2020-04-26)

#### Bug Fixes

* Fixed problem with saving users with permissions of Admin and Editor [#16](/../../issues/16)
* Fixed problem with saving properly CodeGroup with no dependant CodeProject [#15](/../../issues/15)


<a name="1.2.2"></a>
## 1.2.2 (2020-04-26)

#### New Features

* Possibility to set enable vuln manage option on project level. Setting this option to false will result
in hiding vulnerabilities and not returning them through Global API (but getting vulnerabilities per
specific project will still works) see also [#12](/../../issues/12)

#### Bug Fixes

* Fixed problem when search widget did not work as expected see also [#13](/../../issues/13)

<a name="1.2.1"></a>
## 1.2.1 (2020-04-05)

#### New Features

* Frontend updated to Angular 9
* Frontend updated to Ngx-Admin 5
* Global statistics for OpenSource Vulnerabilities
* Possibility to create Password Authentication for Web Application scans (based on username and password passed later to scanner)

<a name="1.2.0"></a>
## 1.2.0 (2020-04-03)

#### New Features

* Integration with Burp Enterprise Edition

#### BUG Fixes
* Routing Domain is no longer required while scanner creation
* Risk of project, codeProject, WebApp and asset is now created in offline. Fixed problem in long execution time. 
* Code of integration partially refactored


<a name="1.1.0"></a>
## 1.1.0 (2020-03-20)

#### New Features

* Bash script ready to integrate with CI tools (scripts/CIScript/mixeway-ci)
* New view for checking CI Job status and state

#### Bug Fixes
* Fixed problem with refreshing repository table after creating object
* Fixed problem with disappearing SAST and OpenSource integration fields once one of them was done

<a name="1.0.0"></a>
## 1.0.0 (2020-03-04)

#### New Features

* Hashicorp Vault integration is now optional

#### BUG Fixes
* Tutorial translation
* Sonar bugs fixes

<a name="0.9.2"></a>
## 0.9.2 (2020-02-08)

#### New Features

* REST API to get scanner types already integrated
* Checkmarx integration (scope: create project, configure scan, run sca, get vulnerabilities)
* Extended Fortify SSC integration - possibility to create and configure SSC projects via Mixeway

#### BUG Fixes
* Fixed bug related with deletion of scanners


# v0.9.1 (30.01.2020)

#### New Features
- Integration with OWASP Dependency track with scope of loading vulnerabilities
- Added scope to Security Quality Gateway with WebApp Vulns, Code Vulns and OpenSource vulns 
- Possibility to set scheduler settings (cron expression) from admin->settings panel. 
Scheduler can be configured for task related with scheduled scans.

#### BUG Fixes

- Fix long time of loading tables containing risk calculations
- Fixed problem with filtering and sorting of some columns in tables of Project Details
- Fixed problem with JIRA ticket creation
