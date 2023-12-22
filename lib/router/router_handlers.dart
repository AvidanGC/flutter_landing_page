import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landig_page/ui/pages/home_page.dart';

import '../providers/page_provider.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {
    final page = params['page']!.first;
    final pageProvider = context!.read<PageProvider>();
    pageProvider.createScrollController(page);
    return const HomePage();

});