import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppThemeData extends Equatable {
  final int code;
  final ThemeData theme;

  const AppThemeData({required this.code, required this.theme});

  @override
  List<Object?> get props => [theme, code];
}
