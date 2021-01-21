# Mixeway Script for CI integrations

mixeway-ci is script which does:
1. Running SAST scan via Mixeway REST API
2. Run OpenSource Vulnerability scanning (Only OWASP Dependency Track integrated at this moment)
3. Verify Vulnerabilities for project
    - Return success when no vulnerabilities were reported during scan
    - Return failure when there are Critical vulnerabilities reported
    
Supported dependency management plugins:
* JAVA MVN (java_mvn keyword)
* JAVA Gradle (not yet ready) (java_gradle keyword)
* PHP Composer (php_composer keyword)
* NPM (javascript_npm keyword)
* PIP (python_pip keyword)

Usage:
```
mixeway-ci --branch=master \
    --tech=java_mvn
    --skipsast \
    --skipopensource

Required:
    --branch - branch name
    --tech - project technology, possible options: java_mvn, java_gradle, php_composer, javascript_npm, python_pip
    --mixewayprojectid - project ID taken from Mixeway GUI
    --appname - name of the application

Optional:
    --mixewayurl - URL for mixeway, by default environment variable MIXEWAY_URL is taken
    --mixewayapikey - Master API get which can be generated in admin zone, be default environment variable MIXEWAY_API_KEY is taken
    --skipsast - to skip SAST scan
    --skipopensource - to skip OpenSource Vulnerability scan
```

Please note that enabling both `--skipsast` and `--skipopensource` will only verify state of security.

Timeout for script is 5min. If timeout is exceeded script return success.