# Mixeway Script for CI integrations

mixeway-ci is script which does:
1. Running SAST scan via Mixeway REST API
2. Run OpenSource Vulnerability scanning (Only OWASP Dependency Track integrated at this moment)
3. Verify Vulnerabilities for project
    - Return success when no vulnerabilities were reported during scan
    - Return failure when there are Critical vulnerabilities reported

Usage:
```
mixeway-ci --appname=projectName \
    --groupname=groupName \
    --mixewayurl=http://mixeway.io \
    --mixewayapikey=123 \
    --mixewayprojectid=1 \
    --skipsast \
    --skipopensource

Required:
    --appname - Subject application name
    --groupname - Fortify SCA build name
    --mixewayurl - URL for Mixeway API
    --mixewayapikey - API key generated on Mixeway to authenticate call
    --mixewayprojectid - ID of project on Mixeway
Optional:
    --skipsast - setup when You dont want run SAST test
    --skipopensource - setup when You dont want run OpenSource test
```

Please note that enabling both `--skipsast` and `--skipopensource` will only verify state of security.

Timeout for script is 5min. If timeout is exceeded script return success.