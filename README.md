# ob1-bazel
Bazel rules maintained by OffByOne Studios

[![TestLinux](https://github.com/OffByOneStudios/ob1-bazel/actions/workflows/test_linux.yml/badge.svg)](https://github.com/OffByOneStudios/ob1-bazel/actions/workflows/test_linux.yml)


## Testing in Docker

### Build The Container
```sh 
docker build -t github.com/offbyonestudios/bazel-deps .
```

### Running The Tests
```sh
docker run -it github.com/offbyonestudios/bazel-deps bazel test
```
### Running The Tests
```sh
docker run -it -v $(pwd):/usr/local/src/bazel-ob1 github.com/offbyonestudios/bazel-deps /bin/bash
```