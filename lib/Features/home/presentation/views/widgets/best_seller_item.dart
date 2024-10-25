import 'package:book/Features/home/data/models/book_model/book_model.dart';
import 'package:book/Features/home/presentation/views/book_details_view.dart';
import 'package:book/Features/home/presentation/views/widgets/book_rate.dart';
import 'package:book/core/utils/style.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.books,
  });
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return BookDetails(books: books);
        },
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SizedBox(
          height: 140,
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(books
                                    .volumeInfo!.imageLinks?.thumbnail ??
                                'https://books.google.com/books/content?id=40aTzgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api')),
                        borderRadius: BorderRadius.circular(6)),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        books.volumeInfo!.title!,
                        style: StyleText.textStyle18,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                          (books.volumeInfo?.authors != null &&
                                  books.volumeInfo!.authors!.isNotEmpty)
                              ? books.volumeInfo!.authors![0]
                              : 'UnKnown',
                          style: const TextStyle(color: Colors.grey)),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Free',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          BookRate(
                            book: books,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
