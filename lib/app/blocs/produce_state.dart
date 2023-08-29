import 'package:coconut_island_app/app/models/Produce.dart';
import 'package:equatable/equatable.dart';

abstract class ProduceState extends Equatable {
  final List<Produce> produces;

  const ProduceState({this.produces});

  @override
  List<Object> get props => [];
}

class ProduceInitial extends ProduceState {}

class ProduceLoadInProgress extends ProduceState {}

class ProduceLoadFailure extends ProduceState {}

class ProducesLoadSuccess extends ProduceState {
  final List<Produce> produces;

  const ProducesLoadSuccess(this.produces) : assert(produces != null);

  @override
  List<Object> get props => produces;
}

class ProduceLoadSuccess extends ProduceState {
  final Produce produce;

  const ProduceLoadSuccess(this.produce) : assert(produce != null);

  @override
  List<Object> get props => [produce];
}
