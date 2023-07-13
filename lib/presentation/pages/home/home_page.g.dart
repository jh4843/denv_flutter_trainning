// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$helloWorldHash() => r'8bbe6cff2b7b1f4e1f7be3d1820da793259f7bfc';

/// See also [helloWorld].
@ProviderFor(helloWorld)
final helloWorldProvider = AutoDisposeProvider<String>.internal(
  helloWorld,
  name: r'helloWorldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$helloWorldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HelloWorldRef = AutoDisposeProviderRef<String>;
String _$classCounterHash() => r'29d2350a8fb1312b6cb924ff882e7c0951e366d2';

/// See also [ClassCounter].
@ProviderFor(ClassCounter)
final classCounterProvider =
    AutoDisposeNotifierProvider<ClassCounter, int>.internal(
  ClassCounter.new,
  name: r'classCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$classCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ClassCounter = AutoDisposeNotifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
