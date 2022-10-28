import 'package:flutter/material.dart';

navigateToPage(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

navigateBack(context) {
  Navigator.pop(context);
}
