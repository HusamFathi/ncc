import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RadioStreamData extends Equatable {
  final String streamUrl;
  final String name;
  final String subtitle;
  final String imageUrl;
  final String backgroundLessonImageUrl;
  final Color radioPrimaryColor;
  final String id;
  final String description;

  const RadioStreamData({
    required this.streamUrl,
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    required this.radioPrimaryColor,
    required this.id,
    required this.description,
    required this.backgroundLessonImageUrl,
  });

  const RadioStreamData.loading()
    : streamUrl = '',
      name = 'loading',
      subtitle = 'loading',
      imageUrl =
          'https://www.image2url.com/r2/default/files/1786260663047-bc72c8e9-a80b-4fac-97da-10e79a719d3b.jpg',
      radioPrimaryColor = Colors.transparent,
      id = '',
      description = '',
      backgroundLessonImageUrl = '';

  RadioStreamData copyWith({
    String? streamUrl,
    String? name,
    String? subtitle,
    String? imageUrl,
    String? backgroundLessonImageUrl,
    Color? radioPrimaryColor,
    String? id,
    String? description,
  }) {
    return RadioStreamData(
      streamUrl: streamUrl ?? this.streamUrl,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      imageUrl: imageUrl ?? this.imageUrl,
      radioPrimaryColor: radioPrimaryColor ?? this.radioPrimaryColor,
      id: id ?? this.id,
      description: description ?? this.description,
      backgroundLessonImageUrl:
          backgroundLessonImageUrl ?? this.backgroundLessonImageUrl,
    );
  }

  @override
  List<Object?> get props => [
    streamUrl,
    name,
    subtitle,
    imageUrl,
    radioPrimaryColor,
    id,
    backgroundLessonImageUrl,
    description,
  ];
}
