import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRate extends StatelessWidget {
  const BookRate({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          size: 14,
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
            book.volumeInfo!.averageRating == null
                ? '0'
                : book.volumeInfo!.averageRating.toString(),
            style: const TextStyle(fontSize: 16)),
        const SizedBox(
          width: 6,
        ),
        Text(
            book.volumeInfo!.ratingsCount == null
                ? '(0)'
                : '(${book.volumeInfo!.ratingsCount.toString()})',
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.grey)),
      ],
    );
  }
}
