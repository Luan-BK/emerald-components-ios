fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
### run_tests_pipeline
```
fastlane run_tests_pipeline
```
Run tests
### pod_install
```
fastlane pod_install
```
Install cocoapods dependencies
### pod_install_framework
```
fastlane pod_install_framework
```
Install cocoapods dependencies to framework
### pod_install_demo_app
```
fastlane pod_install_demo_app
```
Install cocoapods dependencies to demo app
### lint
```
fastlane lint
```
Run swiftlint
### unit_tests
```
fastlane unit_tests
```
Run Unit Tests
### coverage
```
fastlane coverage
```
Get coverage percentage, remove framework's coverage
### sonnar_coverage
```
fastlane sonnar_coverage
```
Convert xccov to xml
### sonar_scanner
```
fastlane sonar_scanner
```
Run SonarQube analysis
### screenshots
```
fastlane screenshots
```
Run UITests and get screenshots
### run_deploy_pipeline
```
fastlane run_deploy_pipeline
```
Deploy a new version
### pod_spec_lint
```
fastlane pod_spec_lint
```
Cocoapods linter
### release_changelog
```
fastlane release_changelog
```
Create release changelog
### release_github
```
fastlane release_github
```
release new github version
### version_podspec
```
fastlane version_podspec
```
Increment or set the version in a podspec file
### increment_version
```
fastlane increment_version
```
Increment version number
### pod_publish
```
fastlane pod_publish
```
Push podfile
### commit_changes
```
fastlane commit_changes
```
Commit files
### push_to_origin
```
fastlane push_to_origin
```
Push files to origin
### projet_version
```
fastlane projet_version
```
set target to get version number

----

## iOS
### ios test
```
fastlane ios test
```
Run tests
### ios release
```
fastlane ios release
```
Deploy a new version
### ios slack_start_build
```
fastlane ios slack_start_build
```
Send message to slack that indicates the process has been started

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
