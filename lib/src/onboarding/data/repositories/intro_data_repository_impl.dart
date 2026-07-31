import 'package:flutter/material.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/intro_data.dart';
import '../../domain/repositories/intro_data_repository.dart';
import '../datasources/local/intro_data_local_data_source.dart';

class IntroDataRepositoryImpl implements IntroDataRepository {
  final NetworkInfo _networkInfo;
  final IntroDataLocalDataSourceImpl _localDataSource;

  IntroDataRepositoryImpl({
    required this._networkInfo,
    required this._localDataSource,
  });

  @override
  Future<IntroData> listIntroData({required BuildContext context}) async {
    try {
      return await _localDataSource.listIntroData(context: context);
    } catch (e) {
      throw NoInternetConnectionException();
    }
  }
}
