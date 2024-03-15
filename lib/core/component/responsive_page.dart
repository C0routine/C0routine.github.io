import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blog/core/providers/current_platform_providers.dart';

class ResponsivePage extends ConsumerWidget {
  const ResponsivePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              Future(() {
                ref.read(currentPlatformsProvider.notifier).changePlatform(constraints);
              });
              return child;
            },
          ),
        ),
      ),
    );
  }
}
