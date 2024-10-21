part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errormsg;

  const SimilarBooksFailure(this.errormsg);
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  SimilarBooksSuccess(this.books);
}
