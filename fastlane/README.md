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
## iOS
### ios test
```
fastlane ios test
```
Run tests
### ios unit_tests
```
fastlane ios unit_tests
```
Run Unit Tests
### ios release
```
fastlane ios release
```
Deploy a new version
### ios screenshots
```
fastlane ios screenshots
```
Run UITests and get screenshots
### ios projet_version
```
fastlane ios projet_version
```
set target to get version number
### ios release_github
```
fastlane ios release_github
```
release new github version
### ios pod_spec_lint
```
fastlane ios pod_spec_lint
```
Cocoapods linter
### ios release_cocoapods
```
fastlane ios release_cocoapods
```
Do git push
### ios version_podspec
```
fastlane ios version_podspec
```
Increment or set the version in a podspec file
### ios pod_publish
```
fastlane ios pod_publish
```
Push podfile
### ios release_changelog
```
fastlane ios release_changelog
```
Create release changelog
### ios commit_and_push
```
fastlane ios commit_and_push
```
Commit and update files
### ios pod_install
```
fastlane ios pod_install
```
Install cocoapods dependencies
### ios lint
```
fastlane ios lint
```
Run swiftlint
### ios coverage
```
fastlane ios coverage
```
Get coverage percentage, remove framework's coverage
### ios increment_version_minor
```
fastlane ios increment_version_minor
```
Increment minor version
### ios increment_version_patch
```
fastlane ios increment_version_patch
```
Increment path version
### ios increment_version
```
fastlane ios increment_version
```
Increment version number
### ios increment_version_custom
```
fastlane ios increment_version_custom
```
Increment custom version
### ios increment_build
```
fastlane ios increment_build
```
Increment build

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
