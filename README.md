### Example Extension Buildpack User Documentation

### Building the Buildpack
To use this buildpack, run the following command from the buildpack's directory:

1. Build the buildpack
```bash
./scripts/build.ps1
```

1. Use [cfwindowsstager](https://github.com/dgodd/cfwindowsstager/releases) to test the buildpack

Having cloned the [hwc-buildpack](https://github.com/cloudfoundry/hwc-buildpack)

```powershell
.\scripts\build.ps1
.\cfwindowsstager.exe --app ..\hwc-buildpack\fixtures\windows_app --buildpack .\example_extension_buildpack-windows2016-v0.1.2.zip --buildpack https://github.com/cloudfoundry/hwc-buildpack/releases/download/v3.1.4/hwc-buildpack-windows2016-v3.1.4.zip
```

Then having run the docker container:
```powershell
(iwr http://127.0.0.1:8080/env -UseBasicParsing).Content | ConvertFrom-Json | ConvertTo-Json
```
will show the environment variable set in `bin/supply.ps1` (`MyTestVariable`)

For an example showing files placed in the `bin` directory being on the path, you can use the [go-windows-buildpack](https://github.com/dgodd/go-windows-buildpack):

```powershell
.\scripts\build.ps1
.\cfwindowsstager.exe --app .\fixtures\simple\ --buildpack .\example_extension_buildpack-windows2016-v0.1.2.zip --buildpack https://github.com/dgodd/go-windows-buildpack/releases/download/v0.0.2/go_buildpack-windows2016-v0.0.2.zip
```

Then having run the docker container, using `(iwr http://127.0.0.1:8080/ -UseBasicParsing).Content` should show the supplied batch file running, and `(iwr http://127.0.0.1:8080/env -UseBasicParsing).Content` should include the supplied `MyTestVariable` environment variable.

1. Use in Cloud Foundry
Upload the buildpack to your Cloud Foundry and optionally specify it by name

```bash
cf create-buildpack [BUILDPACK_NAME] [BUILDPACK_ZIP_FILE_PATH] 1
cf push my_app [-b BUILDPACK_NAME]
```

### Reporting Issues
Open an issue on this project

## Disclaimer
This buildpack is intended purely for educational use and is not intended for production use.
