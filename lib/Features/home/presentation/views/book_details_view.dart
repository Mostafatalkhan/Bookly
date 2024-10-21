import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/data/repo/home_repo_imp.dart';
import 'package:book/Features/home/presentation/manager/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:book/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:book/Features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:book/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({
    super.key,
    required this.books,
  });
  final BookModel books;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SimilarBooksCubit(HomeRepoImp(ApiService(Dio()))),
      child: Scaffold(
          body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 28, left: 28.0, top: 40, bottom: 12),
              child: Column(
                children: [
                  BooksDetailsSection(
                    size: size,
                    books: widget.books,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'You can also like',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: SimilarBooksListView(
              size: size,
              books: widget.books,
            ),
          )
        ],
      )),
    );
  }
}
