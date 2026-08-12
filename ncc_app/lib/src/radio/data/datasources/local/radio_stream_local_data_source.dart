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
      // {
      //   'id': '0',
      //   'name': 'notionRadioForHeritage',
      //   'stream_url': 'https://ncc1.radioca.st/stream',
      //   'subtitle': 'notionRadioForHeritageSlogan',
      //   'image_url':
      //       'https://www.image2url.com/r2/default/images/1786276321784-cc8497bb-837b-464f-8009-96674a5704dc.png',
      //   'background_lesson_image_url':
      //       'assets/images/heritage-radio-background-less.png',
      //   'description': 'notionRadioForHeritageInfo',
      //   'radio_primary_color': '#fffbaf3f',
      // },
      {
        'id': '1',
        'name': 'notionRadio',
        'stream_url': 'https://gaber.radioca.st/stream',
        'subtitle': 'notionRadioSlogan',
        'image_url':
            'https://www.image2url.com/r2/default/images/1786276368106-901e00ee-c0c6-47e3-b36e-dae9f478c0ef.png',
        'background_lesson_image_url':
            'assets/images/notion-radio-background-less.png',
        'description': 'notionRadioInfo',
        'radio_primary_color': '#ff59456e',
      },
    ];
    final List<RadioStreamDataModel> radios = data
        .map((json) => RadioStreamDataModel.fromJson(json))
        .toList();

    return Future.value(radios);
  }
}
