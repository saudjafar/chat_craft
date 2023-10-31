import 'package:chat_craft/widgets/intro_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:chat_craft/screens/chat_screen.dart';
import 'package:chat_craft/screens/craft_screen.dart';
import '../providers/active_theme_provider.dart';
import '../widgets/theme_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroScreen extends ConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);

    return Scaffold(
      appBar: const IntroAppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
              // imageAsset: 'assets/chat.png',
              imageAsset: (activeTheme == Themes.dark)
                  ? 'assets/chat-d.png'
                  : 'assets/chat-w.png',

              buttonText: 'ChatAI',
            ),
            const SizedBox(width: 80),
            _CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CraftScreen()),
                );
              },
              imageAsset: (activeTheme == Themes.dark)
                  ? 'assets/craft-d.png'
                  : 'assets/craft-w.png',
              buttonText: 'CraftAI',
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageAsset;
  final String buttonText;

  const _CustomButton({
    required this.onPressed,
    required this.imageAsset,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageAsset,
            width: 100, // Adjust the image width
            height: 100, // Adjust the image height
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                buttonText, // You can replace this with your text
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary, // Adjust the text color
                  fontSize: 18, // Adjust the text size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
