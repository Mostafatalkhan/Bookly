import 'package:bloc/bloc.dart';
import 'package:book/Features/Search/data/repo/search_repo_imp.dart';
import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit() : super(SearchBookInitial());

  Future<void> searchbook({required String bookname}) async {
    emit(SearchBookLoading());
    var result = await SearchRepoImp().searchbook(bookname: bookname);
    result.fold(
      (l) {
        emit(SearchBookFailure(errmsg: l.errormsg));
      },
      (r) {
        emit(SearchBookSuccess(books: r));
      },
    );
  }
}
