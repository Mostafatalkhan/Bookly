// import 'package:book/Features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';
// import 'package:book/Features/home/presentation/views/widgets/best_seller_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BestSellerListView extends StatelessWidget {
//   const BestSellerListView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewestBookCubit, NewestBookState>(
//       builder: (context, state) {
//         if (state is NewestBookSuccess) {
//           return ListView.builder(
//               itemCount: 6,
//               padding: EdgeInsets.zero,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return BestSellerItem(
//                   books: state.Books[index],
//                 );
//               });
//         } else if (state is NewestBookFailure) {
//           return Text(state.errormsg);
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
