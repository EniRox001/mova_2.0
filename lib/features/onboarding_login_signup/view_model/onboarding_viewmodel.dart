import 'package:flutter/material.dart';

toLastPage(PageController controller) {
  controller.jumpToPage(2);
}

toNextPage(PageController controller) {
  controller.nextPage(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}
