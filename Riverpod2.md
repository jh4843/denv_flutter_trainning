# Riverpod 2.0

## Provider

simple sample

```dart
final helloWorldProvider = Provider<String>((ref) {
  return 'Hello world';
});
```

## Reading (Consumer)

extending

- Stateless

  - StatelessWidget --> ConsumerWidget

- Stateful
  - StatefulWidget --> CosumerStatefulWidget (StatefulHookConsumerWidget )
  - State -->

## Code generation

import

```dart
// in home_page.dart
part 'home_page.g.dart';
```

build_runner

```console
flutter pub run build_runner watch -d
```
