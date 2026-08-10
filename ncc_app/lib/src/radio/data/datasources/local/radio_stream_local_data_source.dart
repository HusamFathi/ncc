import 'dart:developer';

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

    final List<Map<String, dynamic>> data = [
      {
        'id': '0',
        'name': Tr.current.notionRadioForHeritage.toTitle(),
        'stream_url': 'https://ncc1.radioca.st/stream',
        'subtitle': Tr.current.notionRadioForHeritageSlogan
            .capitalizeFirstLetter(),
        "image_url":
            "https://www.image2url.com/r2/default/images/1786276321784-cc8497bb-837b-464f-8009-96674a5704dc.png",
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
        'subtitle': Tr.current.notionRadioSlogan.capitalizeFirstLetter(),
        "image_url":
            "https://www.image2url.com/r2/default/images/1786276368106-901e00ee-c0c6-47e3-b36e-dae9f478c0ef.png",
        "background_lesson_image_url":
            "assets/images/notion-radio-background-less.png",
        "description": Tr.current.notionRadioInfo.capitalizeFirstLetter(),
        "radio_primary_color": '#59456e', // Default color if not provided
      },
    ];
    List<RadioStreamDataModel> radios = data
        .map((e) => RadioStreamDataModel.fromJson(e))
        .toList();

    return Future.value(radios);
  }
}
