import '../../../../../core/extensions/string.dart';
import '../../../../../core/locale/app_localizations_helper.dart';
import '../../../../../core/utils/constants.dart';
import '../../models/radio_stream_data_model.dart';

abstract class RadioStreamLocalDataSource {
  /// Retrieves a list of radio stream data.
  ///
  /// Returns a [Future] that completes with a [List] of [RadioStreamDataModel]
  /// objects representing the available radio streams.
  ///
  Future<List<RadioStreamDataModel>> getRadioStreams();
}

class RadioStreamLocalDataSourceImpl implements RadioStreamLocalDataSource {
  @override
  Future<List<RadioStreamDataModel>> getRadioStreams() {
    final List<Map<String, dynamic>> mockData = [
      {
        'id': '0',
        'name': Tr.current.notionRadioForHeritage.toTitle(),
        'stream_url': 'https://ncc1.radioca.st/stream',
        'subtitle': Tr.current.notionRadioForHeritageSlogan
            .capitalizeFirstLetter(),
        "image_url": "assets/images/heritage-radio.jpg",
        "background_lesson_image_url":
            "assets/images/heritage-radio-background-less.png",
        "description": Tr.current.notionRadioForHeritageInfo
            .capitalizeFirstLetter(),
        "radio_primary_color":
            '#${kHeritageRadioColorPrimary.toARGB32().toRadixString(16).padLeft(8, '0')}', // Default color if not provided
      },
      {
        'id': '1',
        'name': Tr.current.notionRadio.toTitle(),
        'stream_url': 'https://gaber.radioca.st/stream',
        'subtitle': Tr.current.notionRadioSlogaan.capitalizeFirstLetter(),
        "image_url": "assets/images/notion-radio.png",
        "background_lesson_image_url":
            "assets/images/notion-radio-background-less.png",
        "description": Tr.current.notionRadioInfo.capitalizeFirstLetter(),
        "radio_primary_color": '#59456e', // Default color if not provided
      },
    ];

    return Future.value(
      mockData.map((e) => RadioStreamDataModel.fromJson(e)).toList(),
    );
  }
}
