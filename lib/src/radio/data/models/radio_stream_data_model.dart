import 'package:flutter/material.dart';

import '../../domain/entities/radio_stream_data.dart';

class RadioStreamDataModel extends RadioStreamData {
  const RadioStreamDataModel({
    required super.streamUrl,
    required super.name,
    required super.subtitle,
    required super.imageUrl,
    required super.radioPrimaryColor,
    required super.backgroundLessonImageUrl,
    required super.description,
    required super.id,
  });

  factory RadioStreamDataModel.fromJson(Map<String, dynamic> json) {
    return RadioStreamDataModel(
      streamUrl: json['stream_url'],
      id: json['id'], // Default to empty string if not provided
      name: json['name'],
      subtitle: json['subtitle'],
      imageUrl: json['image_url'],
      description:
          json['description'], // Default to empty string if not provided
      backgroundLessonImageUrl: json['background_lesson_image_url'],
      radioPrimaryColor: colorFromHex(
        json['radio_primary_color'],
      ), // Default color if not provided
    );
  }

  /// Converts a hex color string (e.g., "#FFAA00" or "FFAA00") to a [Color] object.
  static Color colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.startsWith('#')) hexString = hexString.substring(1);
    if (hexString.length == 6) buffer.write('ff');
    buffer.write(hexString);
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Map<String, dynamic> toJson() {
    return {
      'streamUrl': streamUrl,
      'name': name,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
    };
  }
}
