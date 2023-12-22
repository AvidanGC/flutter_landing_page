import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {

  PageController scrollController = PageController();
  final List<String> _pages = ["home", "about", "pricing", "contact", "location"];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));

  html.document.title = _pages[getPageIndex(routeName)];

    scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();
      if(pageIndex  != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[pageIndex]}');
        _currentIndex = pageIndex;
        html.document.title = _pages[_currentIndex];
      }
    });
  }

  int getPageIndex(String routeName) {
    return _pages.contains(routeName) ? _pages.indexOf(routeName) : 0;
  }

  String getPageName(int index) {
    return _pages[index];
  }

  goTo(int index) {
    // show page name to url
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');
    // redirect to page with animate when is scroll
    scrollController.animateToPage(
      index, duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut
    );
  }

}