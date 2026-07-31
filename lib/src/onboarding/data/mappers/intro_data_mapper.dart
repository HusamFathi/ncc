import '../../../../core/utils/mapper.dart';
import '../../domain/entities/intro_data.dart';
import '../models/intro_data_model.dart';

class IntroDataMapper extends DataMapper<IntroData, IntroDataModel> {
  @override
  IntroData mapToEntity({required IntroDataModel model}) {
    return IntroData(id: model.id, slides: model.slides, isSeen: model.isSeen);
  }

  @override
  IntroDataModel mapToModel({required IntroData entity}) {
    return IntroDataModel(
      id: entity.id,
      slides: entity.slides,
      isSeen: entity.isSeen,
    );
  }
}
