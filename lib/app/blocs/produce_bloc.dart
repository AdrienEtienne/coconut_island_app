import 'package:bloc/bloc.dart';
import 'package:coconut_island_app/app/blocs/produce_event.dart';
import 'package:coconut_island_app/app/blocs/produce_state.dart';
import 'package:coconut_island_app/app/repositories/repositories.dart';
import 'package:diacritic/diacritic.dart';

class ProduceBloc extends Bloc<ProduceEvent, ProduceState> {
  final ProduceRepository produceRepository;

  ProduceBloc(this.produceRepository)
      : assert(produceRepository != null),
        super(ProduceInitial());

  @override
  Stream<ProduceState> mapEventToState(ProduceEvent event) async* {
    if (event is ProducesRequested) {
      yield ProducesLoadInProgress();
      try {
        final produces =
            await produceRepository.listProduces(month: event.month);
        produces.sort((a, b) =>
            removeDiacritics(a.name).compareTo(removeDiacritics(b.name)));
        yield ProducesLoadSuccess(produces);
      } catch (_) {
        yield ProducesLoadFailure();
      }
    }
  }
}
