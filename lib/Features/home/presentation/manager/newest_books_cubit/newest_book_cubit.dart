import 'package:bloc/bloc.dart';
import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());
    var result = await homeRepo.fetcNewestBooks();
    result.fold(
      (failure) {
        emit(NewestBookFailure(failure.errormsg));
      },
      (books) {
        emit(NewestBookSuccess(books));
      },
    );
  }
}
