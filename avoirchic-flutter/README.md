# avoirchic

A new Flutter project.

# env data

Please store all secrets, API keys and other sensitive data in the environent file.  
This file should be named _*env*_ and should be in the same location as [[pubspec.yaml]].

Once you add the secrets to this file, go to [env_configs.dart](lib/app/core/config/env_configs.dart) and load the secret from the env data.
Define the key that is given to the secret in the [key_value_constants.dart](./lib/core/const/key_value_constants.dart) file.

Format for env file below

```
GLOBAL_TOKEN=<token>
ADMIN_TOKEN=<token>
SENTRY_DSN=<token>
DEFAULT_TOKEN=<token>
DEFAULT_TOKEN_ONE=<token>
```

For the CI environment in github action, create a github actions secret with the key AVOIRCHIC_ENV_STAGE and add the contents of the env file as plain text into this. The secrets will be fetched and used by the action when triggered

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
5. To add/update assets gen or If you are adding new assets Please run
...
 brew install FlutterGen/tap/fluttergen (For the first time only)
 dart pub global activate flutter_gen (For the first time only)
//to update asset gen file
 flutter packages pub run build_runner build
...
