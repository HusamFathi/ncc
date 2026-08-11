import '../../../../../core/route/routes_config.dart';
import '../../../../../core/utils/constants.dart';
import '../../models/intro_slide_data_model.dart';

abstract class MainLocalDataSource {
  // get intro slides
  Future<List<IntroSlideDataModel>> getIntroSlides();
}

//implement the data source
class MainLocalDataSourceImpl implements MainLocalDataSource {
  @override
  Future<List<IntroSlideDataModel>> getIntroSlides() async {
    // Simulating a local data source with a list of JSON maps
    final List<Map<String, dynamic>> slidesJson = [
      {
        'image': 'assets/images/slides/1.png',
        'url': RoutesService.mainRoute,
        'type': 'internal',
      },
      {
        'image': 'assets/images/slides/2.png',
        'url': RoutesService.mainRoute,

        'type': 'internal',
      },
      {
        'image': 'assets/images/slides/3.png',
        'url': RoutesService.mainRoute,
        'type': 'internal',
      },
      {
        'image': 'assets/images/slides/4.png',
        'url': RoutesService.mainRoute,
        'type': 'internal',
      },
      {
        'image': 'assets/images/slides/5.png',
        'url': kFacebookPageLink,
        'type': 'external',
      },
    ];

    return slidesJson
        .map((json) => IntroSlideDataModel.fromJson(json))
        .toList();
  }
}
