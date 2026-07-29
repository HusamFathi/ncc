import '../../../../../core/route/routes_config.dart';
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
        'url': 'https://ncc.com.ly/',
        'type': 'external',
      },
      {
        'image': 'assets/images/slides/2.png',
        'url': 'https://www.facebook.com/profile.php?id=61576664882231',
        'type': 'external',
      },
      {
        'image': 'assets/images/slides/3.png',
        'url': RoutesService.mainRoute,
        'type': 'internal',
      },
    ];

    return slidesJson
        .map((json) => IntroSlideDataModel.fromJson(json))
        .toList();
  }
}
