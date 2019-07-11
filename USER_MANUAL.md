For internal usages:
1. Clone this repo into aionr directory:
```bash
  git clone -b blockade-mini https://github.com/MiaoShi09/image_builder.git
```
2. Copy JDK package into `image_builder/libs/jdk-11.0.1`. If your JDK package is not JDK 11, please update the JDK name and path in `Dockerfiles/Dockerfile_aionr_0.2`
3. Build Image

```bash
./scripts/buildImage.sh <PACKAGE_NAME>
```

4. Go to `blockade`, run `blockade up`

*Notes: install blockade by `pip install blockade`. If starting blockade hits something "PY34", please uninstall `six.py` and install the latest `six.py`*
