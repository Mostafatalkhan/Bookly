import 'package:book/Features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';
import 'package:book/Features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:book/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book/Features/home/presentation/views/widgets/featured_list_view_item.dart';
import 'package:book/Features/home/presentation/views/widgets/shimmer_best_seller.dart';
import 'package:book/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    int length;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomAppBar(),
                FeaturedListViewItem(size: size),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 24.0, left: 24, right: 24, bottom: 24),
                  child: Text('Best Seller', style: StyleText.textStyle18),
                ),
              ],
            ),
          ),
          BlocBuilder<NewestBookCubit, NewestBookState>(
            builder: (context, state) {
              if (state is NewestBookSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.books.length,
                    (context, index) {
                      return BestSellerItem(books: state.books[index]);
                    },
                  ),
                );
              } else if (state is NewestBookFailure) {
                print('===========${state.errormsg}');
                return const SliverToBoxAdapter(
                    child: Center(
                  child: Text('Error Happened Try Again Later!'),
                ));
              } else {
                return const SliverToBoxAdapter(
                  child: ShimmerBestSeller(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
