import 'package:book/Features/Search/presentation/view/search_view.dart';
import 'package:book/Features/home/presentation/views/home_view.dart';

class AppRouter {
  static const homeView = 'Home';
  static const bookDetailsView = 'BookDetails';
  static const searchView = 'SearchView';

  static var router = {
    homeView: (context) => const Home(),
    // bookDetailsView: (context) => const BookDetails(
    //     ),
    searchView: (context) => const SearchView(),
  };
}
