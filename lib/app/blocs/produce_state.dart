import 'package:coconut_island_app/app/models/Produce.dart';
import 'package:equatable/equatable.dart';

abstract class ProduceState extends Equatable {
  const ProduceState();

  @override
  List<Object> get props => [];
}

class ProduceInitial extends ProduceState {}

class ProducesLoadInProgress extends ProduceState {}

class ProducesLoadSuccess extends ProduceState {
  final List<Produce> produces;

  const ProducesLoadSuccess(this.produces) : assert(produces != null);

  @override
  List<Object> get props => produces;
}

class ProducesLoadFailure extends ProduceState {}
