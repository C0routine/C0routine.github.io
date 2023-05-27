import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blog/blog_app.dart';
import 'package:blog/viewmodel/provider/theme_vm.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeVM()),
      ],
      child: const BlogApp(),
    ),
  );
}
