import 'package:equatable/equatable.dart';

class GoRouteUrlData extends Equatable {
  final String url;
  final dynamic extra;

  const GoRouteUrlData({required this.url, required this.extra});

  @override
  List<Object?> get props => [url, extra];
}
