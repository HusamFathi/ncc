import '../../../../../core/services/local_storage_service.dart';
import '../../models/intro_data_model.dart';

abstract class IntroDataLocalDataSource {
  Future<IntroDataModel> listIntroData();
}

class IntroDataLocalDataSourceImpl implements IntroDataLocalDataSource {
  final LocalStorageService _localStorageService;
  static const String _storageKey = 'intro_data';

  IntroDataLocalDataSourceImpl({required this._localStorageService});

  @override
  Future<IntroDataModel> listIntroData() async {
    return IntroDataModel(id: '', slides: []);
  }
}
