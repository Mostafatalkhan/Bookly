import 'package:book/Features/home/presentation/manager/Featured_books_cubit/featured_books_cubit.dart';
import 'package:book/Features/home/presentation/views/book_details_view.dart';
import 'package:book/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:book/Features/home/presentation/views/widgets/shimmer_featured.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: size.height * 0.25,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 12),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BookDetails(books: state.books[index]);
                          },
                        ));
                      },
                      child: CustomBookItem(
                        imageurl: state
                            .books[index].volumeInfo!.imageLinks!.thumbnail!,
                        size: size,
                        radius: 16,
                      ),
                    ));
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          print(state.errormsg);
          return Text(state.errormsg);
        } else {
          // isLoading = true;
          {
            // Use Skeletonizer when loading
            return ShimmerFeatured(size: size);
          }
        }
      },
    );
  }
}
