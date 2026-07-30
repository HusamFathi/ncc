import '../../../../../core/services/local_storage_service.dart';
import '../../models/intro_data_model.dart';

abstract class IntroDataLocalDataSource {
  Future<List<IntroDataModel>> listIntroDatas();
}

class IntroDataLocalDataSourceImpl implements IntroDataLocalDataSource {
  final LocalStorageService _localStorageService;
  static const String _storageKey = 'intro_data';

  IntroDataLocalDataSourceImpl({required this._localStorageService});

  @override
  Future<List<IntroDataModel>> listIntroDatas() async {
    return [];
  }
}
