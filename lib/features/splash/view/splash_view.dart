import 'package:my_books/bootstrap.dart';
import 'package:my_books/features/splash/controller/future_initializer.dart';
import 'package:my_books/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///This view displayed for initializing all the required things on initialization.
/// This will help for initial loading screen for apps with heavy things initialization;
class SplashView extends ConsumerStatefulWidget {
  /// If true ,this will defer the first frame upto all async initialization done.
  /// On deferring the screen will be blasnk upto the completion of initialization.
  ///
  /// If false, it will show splash loader from the start of the app upto intialization
  ///  without deferring the first frame.
  ///
  final bool removeSpalshLoader;
  final void Function(ProviderContainer container) onInitialized;
  const SplashView({
    super.key,
    required this.onInitialized,
    required this.removeSpalshLoader,
  });

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late Stopwatch stopwatch;
  @override
  void initState() {
    stopwatch = Stopwatch()..start();
    super.initState();
    if (widget.removeSpalshLoader) {
      RendererBinding.instance.deferFirstFrame();
    }
  }

  @override
  void didChangeDependencies() {
    if (widget.removeSpalshLoader) {
      ref.read(futureInitializerPod.future).whenComplete(
        () {
          RendererBinding.instance.allowFirstFrame();
        },
      );
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    stopwatch.stop();
    talker.info("Page disposed after takes ${stopwatch.elapsedMilliseconds}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final futureAsync = ref.watch(futureInitializerPod);
        ref.listen(
          futureInitializerPod,
          (previous, next) {
            if (next is AsyncData && next.valueOrNull != null) {
              talker.info("Initialization takes ${stopwatch.elapsedMilliseconds}");
              widget.onInitialized(next.requireValue);
            }
          },
        );
        return futureAsync.easyWhen(
          data: (data) {
            return const SizedBox.shrink();
          },
          loadingWidget: () => child!,
          errorWidget: (error, stackTrace) => child!,
        );
      },
      child: const LoaderChild(),
    );
  }
}

class LoaderChild extends StatefulWidget {
  const LoaderChild({
    super.key,
  });

  @override
  State<LoaderChild> createState() => _LoaderChildState();
}

class _LoaderChildState extends State<LoaderChild> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Center(),
          ],
        ),
      ),
    );
  }
}
