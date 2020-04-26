
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
