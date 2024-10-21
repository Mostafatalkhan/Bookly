import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/data/repo/home_repo.dart';
import 'package:book/core/utils/api_service.dart';
import 'package:book/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetcNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              '/volumes?Filtering=free-ebook&newest&q=subject:programming');
      // print('==============$data');
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
      // for (int i = 0; i < data['items'].length; i++) {
      //   books.add(BookModel.fromJson(data[i]));}
    } on Exception catch (e) {
      // print('=======================$e');
      return left(serverFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    // try {
    var data = await apiService.get(
        endpoint: '/volumes?Filtering=free-ebooks&q=subject:games');
    // print(data['items'].length);
    List<BookModel> books = [];

    // for (var item in data['items']) {
    //   books.add(BookModel.fromJson(item));
    // }
    for (int i = 0; i < data['items'].length; i++) {
      books.add(BookModel.fromJson(data['items'][i]));
    }
    return Right(books);
    // } on Exception catch (e) {
    //   print('==============${e}');

    //   return left(serverFailure(e.toString()));
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String categorey}) async {
    try {
      var data = await apiService.get(
          endpoint:
              '/volumes?Filtering=free-ebook&Sorting=relevance&q=subject:programming');
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } on Exception catch (e) {
      return left(serverFailure(e.toString()));
    }
  }
}
// }
