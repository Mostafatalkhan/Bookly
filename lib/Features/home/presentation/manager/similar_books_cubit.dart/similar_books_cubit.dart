import 'package:bloc/bloc.dart';
import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks(String cat) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(categorey: cat);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure.toString()));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
