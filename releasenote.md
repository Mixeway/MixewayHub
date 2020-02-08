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
