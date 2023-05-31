import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blog/utils/router.dart';
import 'package:blog/utils/app_theme.dart';
import 'package:blog/viewmodel/provider/responsive_vm.dart';

class BlogApp extends StatefulWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  State<BlogApp> createState() => _BlogApp();
}

class _BlogApp extends State<BlogApp> {
  @override
  Widget build(BuildContext context) {
    final responsiveVM = context.read<ResponsiveVM>();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        responsiveVM.extendChange(constraints.maxWidth);
        print('${constraints.maxWidth} ${constraints.maxHeight}');
        return MaterialApp.router(
          /// TODO Support DarkTheme LightTheme
          theme: AppTheme.responsive(responsiveVM.extend),

          routerConfig: router,

          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
