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
  - State --> ConsumerState
