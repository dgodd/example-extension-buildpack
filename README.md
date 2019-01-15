### Buildpack User Documentation

### Building the Buildpack
To build this buildpack, run the following command from the buildpack's directory:

1. Install buildpack-packager
```bash
go install github.com/cloudfoundry/libbuildpack/packager/buildpack-packager
```

1. Build the buildpack
```bash
buildpack-packager build -any-stack
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
This buildpack is experimental and not yet intended for production use.
