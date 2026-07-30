part of 'list_intro_datas_bloc.dart';

sealed class ListIntroDatasEvent extends Equatable {
  const ListIntroDatasEvent();
}

// Initial load event
final class ListIntroDatasStarted extends ListIntroDatasEvent {
  final Map<String, dynamic> pathParams;

  const ListIntroDatasStarted({required this.pathParams});

  @override
  List<Object?> get props => [pathParams];
}

// Load next page event
final class ListIntroDatasLoadNextPage extends ListIntroDatasEvent {
  final int page;

  const ListIntroDatasLoadNextPage({required this.page});

  @override
  List<Object?> get props => [page];
}
