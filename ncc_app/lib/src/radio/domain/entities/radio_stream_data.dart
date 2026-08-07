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
