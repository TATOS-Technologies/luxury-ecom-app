# sololuxury-flutter

Flutter application for Sololuxury

# env data

Please store all secrets, API keys and other sensitive data in the environent file.  
This file should be named _*env*_ and should be in the same location as [[pubspec.yaml]].

Once you add the secrets to this file, go to [env_configs.dart](./lib/app/core/config/env_configs.dart) and load the secret from the env data.
Define the key that is given to the secret in the [key_value_constants.dart](./lib/app/core/const/key_value_constants.dart) file.

# Code conventions

Go through the following points and adhere to them.

## Conventions for naming and managing constants

Guidelines for constants

1.  Store related or similar constants in common file.
    Eg. Put all constants for key values in the file key_value_constant.dart
    Keep all constants for image asset name in a single file etc..

2.  Naming convention for constants: follow the format "k<feature><constantName>"
    Eg. for the country code key in the local store [kLocalStoreCountryCodeKey] is used.
    for notification channel id constant [knotificationChannelId].
    This gives us a solid naming convention for constants, makes the names understandable and helps with autocomplete.

# Running the app

To run with production keystore in release mode

```
flutter run --release --flavor prod -t lib/app/main/main.prod.dart --bundle-sksl-path flutter_01.sksl.json
```

# To update SkSL shader cache

```
flutter run --flavor prod -t lib/app/main/main.prod.dart --profile --cache-sksl
```

then press _shift+m_ to save the sksl cache as a file.
Include this file while building and running the app to reduce jank due to shader compilation

# Build Instructions

Follow these while building for android

To build a production version

```

flutter build apk --flavor prod -t lib/app/main/main.prod.dart --bundle-sksl-path flutter_01.sksl.json

```

For CI environments, use

```

flutter build apk --flavor ci -t lib/app/main/main.ci.dart --bundle-sksl-path flutter_01.sksl.json

```

# JSON parsing

To generate the model class Json parsing for the API response

Guidelines for generating Json parsing

1. Create the model class with Json annotation
2. Add factory method for fromJson() and toJson() with the same model name
3. Add below line to generate the model class parsing

```

part {model class name}.g.dart;

```

4. To generate json parsing class

```
flutter pub run build_runner build --delete-conflicting-outputs
```

# Deep links

Support for deeplinks have been enabled for app.
Currently enabled for the following pages:

- productDetails

Format:
For opening product details page :
deeplink should be `/productDetails/<sku>`
eg: `/productDetails/M0016256001-Black`

eg. firebase dynamic link https://sololuxury.page.link/bAmq
