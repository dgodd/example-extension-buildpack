### Example Extension Buildpack User Documentation

### Building the Buildpack
To use this buildpack, run the following command from the buildpack's directory:

1. Build the buildpack
```bash
./scripts/build.ps1
```

1. Use [cfwindowsstager](https://github.com/dgodd/cfwindowsstager/releases) to test the buildpack
```bash
.\scripts\build.ps1
.\cfwindowsstager.exe --app .\fixtures\simple\ --buildpack .\example_extension_buildpack-windows2016-v0.1.2.zip --buildpack https://github.com/dgodd/go-windows-buildpack/releases/download/v0.0.1/go_buildpack-windows2016-v0.0.1.zip
```

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
