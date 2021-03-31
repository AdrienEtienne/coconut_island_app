import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Seasonality extends Equatable {
  final List<int> months;
  final bool isAllYear;

  const Seasonality({
    @required this.months,
    @required this.isAllYear,
  });

  @override
  List<Object> get props => [this.months, this.isAllYear];

  static Seasonality fromJson(dynamic json) {
    if (json == null) {
      return Seasonality(months: [], isAllYear: true);
    }
    return Seasonality(
      months: (json['months'] as List<Object>).map((e) => e as int).toList(),
      isAllYear: json['isAllYear'] as bool,
    );
  }
}

class Produce extends Equatable {
  final int id;
  final String name;
  final Seasonality seasonality;

  const Produce({
    @required this.id,
    @required this.name,
    @required this.seasonality,
  });

  @override
  List<Object> get props => [this.id];

  static Produce fromJson(dynamic json) {
    return Produce(
      id: int.parse(json['id'] as String),
      name: json['name'] as String,
      seasonality: Seasonality.fromJson(json['seasonality']),
    );
  }
}
