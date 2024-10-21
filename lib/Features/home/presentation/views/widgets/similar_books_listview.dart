import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/presentation/manager/similar_books_cubit.dart/similar_books_cubit.dart';
import 'package:book/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({
    super.key,
    required this.size,
    required this.books,
  });
  final BookModel books;
  final Size size;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(widget.books.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 28.0, bottom: 26),
            child: SizedBox(
              height: widget.size.height * 0.15,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: CustomBookItem(
                        imageurl: state
                            .books[index].volumeInfo!.imageLinks!.thumbnail!,
                        size: widget.size,
                        radius: 6,
                      ),
                    );
                  }),
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.errormsg);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
