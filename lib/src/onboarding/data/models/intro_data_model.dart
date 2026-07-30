import '../../domain/entities/intro_data.dart';

class IntroDataModel extends IntroData {
  const IntroDataModel({
    required super.id,
  });

  //to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  //from json
  factory IntroDataModel.fromJson(Map<String, dynamic> json) {
    return IntroDataModel(
      id: json['id'],
    );
  }
  
}
