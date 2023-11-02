import 'package:flutter/material.dart';
import 'package:chat_craft/screens/chat_screen.dart';
import 'package:chat_craft/screens/craft_screen.dart';
import 'package:chat_craft/screens/intro_screen.dart';
import 'providers/active_theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'constants/themes.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: activeTheme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
      // home: const IntroScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/a': (context) => const ChatScreen(),
        '/b': (context) => const CraftScreen(),
      },
    );
  }
}
