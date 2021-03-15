import 'package:bloc/bloc.dart';
import 'package:coconut_island_app/app/repositories/app_repository.dart';

class AppVersionCubit extends Cubit<String> {
  final AppRepository _appRepository;

  AppVersionCubit(this._appRepository) : super("-");

  Future<String> readAppVersion() async {
    var version = await this._appRepository.readAppVersion();
    emit(version);
    return version;
  }
}
