# denv_flutter_training

A new Flutter project.

## reference projects

- architecture
  - https://github.com/devmuaz/flutter_clean_architecture/tree/master
  - https://github.com/Ahmedabdelalem61/flutter-mvvm-arch/tree/main
  - https://github.com/Uuttssaavv/flutter-clean-architecture-riverpod/tree/master

## firebase configuration

install firebase cli

```console
$ npm install -g firebase-tools
```

login firebase

```console
$ firebase login
```

Add dependency

```console
$ flutter pub add firebase_core
```

Configuration

```console
$ flutterfire configure
```

## go_router

ref

- https://pub.dev/packages/go_router

install

```console
flutter pub add go_router
```

import

```dart
import 'package:go_router/go_router.dart';
```

## file path provider
Finding commonly used locations on filesystem.

install
```console
flutter pub add path_provider
```

import

```dart
import 'package:path_provider/path_provider.dart';
```