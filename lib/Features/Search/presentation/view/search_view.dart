import 'package:book/Features/Search/presentation/manager/search_book_cubit/search_book_cubit.dart';
import 'package:book/Features/Search/presentation/view/widgets/search_result.dart';
import 'package:book/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: TextField(
                  onSubmitted: (value) {
                    BlocProvider.of<SearchBookCubit>(context)
                        .searchbook(bookname: value);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      hintText: 'Search',
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white60),
                          borderRadius: BorderRadius.circular(6)),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white60),
                          borderRadius: BorderRadius.circular(6)),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white60),
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Search Result',
                  style: StyleText.textStyle18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<SearchBookCubit, SearchBookState>(
                builder: (context, state) {
                  if (state is SearchBookSuccess) {
                    print(state.books.length);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.books.length,
                        itemBuilder: (context, index) {
                          if (index >= state.books.length) {
                            return const SizedBox(); // avoid RangeError
                          }
                          return SearchedItem(
                            books: state.books[index],
                          );
                        },
                      ),
                    );
                  } else if (state is SearchBookFailure) {
                    print('=====================${state.errmsg}');
                    return const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Error',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  } else if (state is SearchBookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchBookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(left: size.width * 0.37),
                      child: const Text('No Result Yet'),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
