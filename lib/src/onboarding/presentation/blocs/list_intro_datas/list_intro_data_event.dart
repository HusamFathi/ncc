part of 'list_intro_data_bloc.dart';

sealed class ListIntroDataEvent extends Equatable {
  const ListIntroDataEvent();
}

// Initial load event
final class ListIntroDataStarted extends ListIntroDataEvent {
  final Map<String, dynamic> pathParams;

  const ListIntroDataStarted({required this.pathParams});

  @override
  List<Object?> get props => [pathParams];
}

// Load next page event
final class ListIntroDataLoadNextPage extends ListIntroDataEvent {
  final int page;

  const ListIntroDataLoadNextPage({required this.page});

  @override
  List<Object?> get props => [page];
}
