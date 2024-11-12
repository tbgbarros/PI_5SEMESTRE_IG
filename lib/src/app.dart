import 'package:flutter/material.dart';
import 'package:pi5_app_manaciais/src/core/constants/constants.dart';
import 'features/feed/presentation/feed_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kLightTheme.copyWith(
        scaffoldBackgroundColor:
            Colors.transparent, // Definindo o fundo transparente
      ),
      darkTheme: kDarkTheme.copyWith(
        scaffoldBackgroundColor:
            Colors.transparent, // Fundo transparente no tema escuro
      ),
      home: const FeedPage(),
    );
  }
}
