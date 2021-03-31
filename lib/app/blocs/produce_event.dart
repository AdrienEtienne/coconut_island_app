import 'package:equatable/equatable.dart';

abstract class ProduceEvent extends Equatable {
  const ProduceEvent();
}

class ProducesRequested extends ProduceEvent {
  final int month;

  const ProducesRequested({this.month});

  @override
  List<Object> get props => [this.month];
}
