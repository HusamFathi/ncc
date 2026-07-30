
import '../../../../core/utils/mapper.dart';
import '../../domain/entities/intro_data.dart';
import '../models/intro_data_model.dart';



class IntroDataMapper extends DataMapper<IntroData, IntroDataModel> {
  @override
  IntroData mapToEntity({required IntroDataModel model}) {
    return IntroData(
      id: model.id,
    );
  }

  @override
  IntroDataModel mapToModel({required IntroData entity}) {
    return IntroDataModel(
      id: entity.id,
    );
  }
}
