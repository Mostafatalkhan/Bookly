import 'package:book/Features/Search/data/repo/search_repo.dart';
import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/core/utils/api_service.dart';
import 'package:book/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  @override
  Future<Either<serverFailure, List<BookModel>>> searchbook(
      {required String bookname}) async {
    try {
      var data =
          await ApiService(Dio()).get(endpoint: '/volumes?q=${bookname}');
      List<BookModel> books = [];
      print(data['items']);
      for (int i = 0; i < data['items'].length; i++) {
        books.add(BookModel.fromJson(data['items'][i]));
      }
      return right(books);
    } on Exception catch (e) {
      return left(serverFailure(e.toString()));
    }
  }
}
