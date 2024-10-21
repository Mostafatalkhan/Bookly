import 'package:book/Features/Search/data/repo/search_repo_imp.dart';
import 'package:book/Features/Search/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:book/Features/Splash/presentation/views/splash_view.dart';
import 'package:book/Features/home/data/repo/home_repo_imp.dart';
import 'package:book/Features/home/presentation/manager/Featured_books_cubit/featured_books_cubit.dart';
import 'package:book/Features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';
import 'package:book/constant.dart';
import 'package:book/core/utils/api_service.dart';

import 'package:book/core/utils/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // ApiService(Dio())
  // .get(endpoint: '/volumes?Filtering=free-ebooks&q=subject:programming');
  SearchRepoImp().searchbook(bookname: 'The Hobbit');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(HomeRepoImp(ApiService(Dio())))
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBookCubit(HomeRepoImp(ApiService(Dio())))
            ..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => SearchBookCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(Typography.whiteCupertino),
          ),
          home: const SplashView(),
          routes: AppRouter.router),
    );
  }
}
