# PMD Salesforce APEX code analyzer

- PMD static code analyzer for Apex
- Image is hosted at Docker Hub
  - https://hub.docker.com/repository/docker/jokinlex/pmd
- Latest version uses PMD 7.0.0-rc4 and it supports linux/amd64, linux/arm64 and linux/arm/v7

# Examples for usage

- Following examples assume that
  - Your Salesforce project uses SFDX project folder structure `./force-app/main/default/`
  - You want to perform PMD analysis by using latest version 7.0.0-rc4
- Analyze single APEX class called AccountTriggerHandler using default ruleset
  - `docker run -v $PWD:/src jokinlex/pmd:7.0.0-rc4 pmd check --rulesets rulesets/apex/quickstart.xml --dir ./force-app/main/default/classes/AccountTriggerHandler.cls`
- Analyze single APEX class called AccountTriggerHandler using your own ruleset `./pmd-rules.xml`
  - `docker run -v $PWD:/src jokinlex/pmd:7.0.0-rc4 pmd check --rulesets ./pmd-rules.xml --dir ./force-app/main/default/classes/AccountTriggerHandler.cls`
- Analyze all APEX classes using your own ruleset `./pmd-rules.xml`
  - `docker run -v $PWD:/src jokinlex/pmd:7.0.0-rc4 pmd check --rulesets ./pmd-rules.xml --dir ./force-app/main/default`
- Analyze all APEX classes which have been touched in last 20 GIT commits using your own ruleset `./pmd-rules.xml`
  - `git diff --name-only HEAD HEAD~20 | grep ".cls" | grep -v 'meta.xml' > pmd-checklist.txt`
  - `docker run -v $PWD:/src jokinlex/pmd:7.0.0-rc4 pmd check --rulesets ./pmd-rules.xml --file-list pmd-checklist.txt`