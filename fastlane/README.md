fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

## Choose your installation method:

<table width="100%" >
<tr>
<th width="33%"><a href="http://brew.sh">Homebrew</a></td>
<th width="33%">Installer Script</td>
<th width="33%">Rubygems</td>
</tr>
<tr>
<td width="33%" align="center">macOS</td>
<td width="33%" align="center">macOS</td>
<td width="33%" align="center">macOS or Linux with Ruby 2.0.0 or above</td>
</tr>
<tr>
<td width="33%"><code>brew cask install fastlane</code></td>
<td width="33%"><a href="https://download.fastlane.tools">Download the zip file</a>. Then double click on the <code>install</code> script (or run it in a terminal window).</td>
<td width="33%"><code>sudo gem install fastlane -NV</code></td>
</tr>
</table>
# Available Actions
## iOS
### ios test
```
fastlane ios test
```
Run unit tests
### ios example
```
fastlane ios example
```
Build the example app
### ios lint
```
fastlane ios lint
```
Lint the source code and other linteable artifacts
### ios validation
```
fastlane ios validation
```
Validate changes according to a set of rules
### ios update_docs
```
fastlane ios update_docs
```
Update the framework documentation and publish it
### ios ci
```
fastlane ios ci
```
Continous integration

This action can be configured using the following environment variable (valid values are `YES` and `NO`):



- `LINT`:              Whether the sources and certain artifacts should be linted defaults to `YES`

- `RUN_TESTS`:         Whether unit tests should be run, defaults to `YES`

- `BUILD_EXAMPLE_APP`: Whether the example app should be built or not, defaults to `YES`
### ios pr
```
fastlane ios pr
```
Pull requests

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
