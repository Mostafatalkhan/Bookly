import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetcNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String categorey});
}
