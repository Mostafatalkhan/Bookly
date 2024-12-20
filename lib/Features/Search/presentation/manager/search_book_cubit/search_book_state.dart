part of 'search_book_cubit.dart';

sealed class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

final class SearchBookInitial extends SearchBookState {}

final class SearchBookLoading extends SearchBookState {}

final class SearchBookFailure extends SearchBookState {
  final String errmsg;

  SearchBookFailure({required this.errmsg});
}

final class SearchBookSuccess extends SearchBookState {
  final List<BookModel> books;

  SearchBookSuccess({required this.books});
}
