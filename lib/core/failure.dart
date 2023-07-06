// class for failure handling
// Created by kumaran on 15/01/2021.

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  @override
  String toString() => 'Failure(message: $message)';

  factory Failure.fromException(Exception exception) {
    return Failure(exception.toString());
  }

  factory Failure.fromError(Error error) {
    return Failure(error.toString());
  }

  factory Failure.fromMessage(String message) {
    return Failure(message);
  }
}
