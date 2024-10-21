import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/presentation/views/widgets/book_rate.dart';
import 'package:book/Features/home/presentation/views/widgets/buttons_actions.dart';
import 'package:book/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:book/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:book/core/utils/style.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({
    super.key,
    required this.size,
    required this.books,
  });

  final Size size;
  final BookModel books;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustonBookDetailsAppBar(),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.21,
          ),
          child: CustomBookItem(
            imageurl: books.volumeInfo!.imageLinks?.thumbnail ??
                'https://img.freepik.com/free-vector/text-books-library-isolated-icon_24877-83372.jpg',
            size: size,
            radius: 16,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          books.volumeInfo?.title ?? '',
          textAlign: TextAlign.center,
          style: StyleText.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          books.volumeInfo?.authors?[0] ?? '',
          style: StyleText.textStyle18.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * .32),
          child: BookRate(
            book: books,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ButtonsActions(
          books: books,
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
