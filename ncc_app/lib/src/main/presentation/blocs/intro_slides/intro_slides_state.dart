part of 'intro_slides_bloc.dart';

sealed class IntroSlidesState extends Equatable {
  const IntroSlidesState();

  @override
  List<Object?> get props => [];
}

final class IntroSlidesInitial extends IntroSlidesState {}

final class IntroSlidesLoading extends IntroSlidesState {}

final class IntroSlidesLoaded extends IntroSlidesState {
  final List<IntroSlideData> slides;

  const IntroSlidesLoaded({required this.slides});

  @override
  List<Object> get props => [slides];
}

final class IntroSlidesError extends IntroSlidesState {
  final String message;
  final int? errorCode;
  final void Function()? onRetry;

  const IntroSlidesError({required this.message, this.errorCode, this.onRetry});

  @override
  List<Object?> get props => [message, errorCode, onRetry];
}
