import 'package:flutter/material.dart';
import 'package:my_books/app/view/app.dart';
import 'package:my_books/bootstrap.dart';
import 'package:my_books/features/splash/view/splash_view.dart';

class Splasher extends StatelessWidget {
  const Splasher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashView(
        removeSpalshLoader: true,
        onInitialized: (container) {
          bootstrap(
            () => const App(),
            parent: container,
          );
        },
      ),
    );
  }
}
