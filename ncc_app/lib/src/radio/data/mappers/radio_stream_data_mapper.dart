import '../../../../core/utils/mapper.dart';
import '../../domain/entities/radio_stream_data.dart';
import '../models/radio_stream_data_model.dart';

class RadioStreamDataMapper
    extends DataMapper<RadioStreamData, RadioStreamDataModel> {
  @override
  RadioStreamData mapToEntity({required RadioStreamDataModel model}) {
    return RadioStreamData(
      streamUrl: model.streamUrl,
      name: model.name,
      subtitle: model.subtitle,
      imageUrl: model.imageUrl,
      radioPrimaryColor: model.radioPrimaryColor,
      id: model.id,
      description: model.description,
      backgroundLessonImageUrl: model.backgroundLessonImageUrl,
    );
  }

  @override
  RadioStreamDataModel mapToModel({required RadioStreamData entity}) {
    return RadioStreamDataModel(
      streamUrl: entity.streamUrl,
      name: entity.name,
      subtitle: entity.subtitle,
      imageUrl: entity.imageUrl,
      radioPrimaryColor: entity.radioPrimaryColor,
      id: entity.id,
      backgroundLessonImageUrl: entity.backgroundLessonImageUrl,
      description: entity.description,
    );
  }
}
