import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Produce extends Equatable {
  final int id;
  final String name;

  const Produce({
    @required this.id,
    @required this.name,
  });

  @override
  List<Object> get props => [this.id];

  static Produce fromJson(dynamic json) {
    return Produce(
      id: int.parse(json['id'] as String),
      name: json['name'] as String,
    );
  }
}
