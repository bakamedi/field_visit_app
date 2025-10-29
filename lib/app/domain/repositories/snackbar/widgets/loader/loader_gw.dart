import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../../presentation/global/controllers/loader/loader_gc.dart';

class LoaderGW extends ConsumerWidget {
  const LoaderGW({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final adaptativeScreen = AdaptativeScreen(context);

    final loaderGC = ref.watch(loaderGP);

    return loaderGC.loading
        ? PopScope(
            canPop: false,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: SizedBox.expand(
                        child: ColoredBox(
                          color: Colors.black.withValues(alpha: 0.4),
                          child: Transform.scale(
                            scale: adaptativeScreen.dp(0.25),
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
