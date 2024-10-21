import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<serverFailure, List<BookModel>>> searchbook(
      {required String bookname});
}
