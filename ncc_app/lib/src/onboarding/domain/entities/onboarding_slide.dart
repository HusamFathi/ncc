import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OnboardingSlide extends Equatable {
  final Color color;
  final String title;
  final String description;
  final String image;

  const OnboardingSlide({
    required this.color,
    required this.title,
    required this.description,
    required this.image,
  });
  @override
  List<Object?> get props => [color, description, image, title];
}
