# Mixeway Fortify Script for CI integrations

mxs-fortify-ci is using `CloudScan` to perform scan phace of Fortify SCA, next it put obtained cloud scan job id to Mixeway,
where result is being loaded. Next it verify if scan has ended and if so it check how Security Quality gateway will respond.
Possible outcome is `Ok` or `Not Ok` which stands for proceed with build or interrupt.

Usage:
```
mxw-fortify-ci --sscurl=https://ssc.com/ssc  \
    --versionid=1 \
    --appname=projectName \
    --groupname=groupName \
    --tech=mvn \
    --dtracktoken=123 \
    --mixewayurl=http://mixeway.io \
    --mixewayapikey=123 \
    --mixewayprojectid=1 \
    --ssctoken=123 \
    --dtrackurl=http://dtrack.pl \
    --dtrackproject=123"

Required:
    --sscurl - is URL of Fortify SSC
    --versionid - is ID of Fortify SSC project
    --ssctoken - Token to authetnicated to Fortify SSC, it has to be type of CloudCtrlToken
    --appname - Subject application name
    --groupname - Fortify SCA build name
    --mixewayurl - URL for Mixeway API
    --mixewayapikey - API key generated on Mixeway to authenticate call
    --mixewayprojectid - ID of project on Mixeway
Optional:
    --tech - Technology, possible options: MVN, NPM, PIP
    --dtracktoken - token for Authentication in DTrack
    --dtrackurl - URL for dependency track API
    --dtrackproject - project ID on Dependency Track
```