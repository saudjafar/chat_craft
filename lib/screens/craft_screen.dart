import 'package:flutter/material.dart';
import 'package:chat_craft/services/ai_handler.dart';
import 'package:chat_craft/widgets/description_field.dart';
import 'package:chat_craft/widgets/global_drawer.dart';
import 'package:chat_craft/widgets/image_download_button.dart';
import 'package:chat_craft/widgets/image_container.dart';
import 'package:chat_craft/widgets/my_app_bar.dart';

class CraftScreen extends StatefulWidget {
  const CraftScreen({super.key});

  @override
  State<CraftScreen> createState() => _CraftScreenState();
}

class _CraftScreenState extends State<CraftScreen> {
  final aiHandler = AIHandler();
  String? _imageUrl;
  bool _isGenerating = false;
  String _displayMessage = 'Input a description to generate an image';

  @override
  void dispose() {
    aiHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'CraftAI',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageContainer(
                isGenerating: _isGenerating,
                imageUrl: _imageUrl,
                displayMessage: _displayMessage,
              ),
              const SizedBox(height: 14),
              DescriptionField(
                isGenerating: _isGenerating,
                onSubmitted: generateImage,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ImageDownloadButton(
                  imageUrl: _imageUrl,
                  isGenerating: _isGenerating,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const GlobalDrawer(),
    );
  }

  void generateImage(String prompt) async {
    setState(() => _isGenerating = true);
    final result = await aiHandler.generateImage(prompt);
    setState(() {
      _isGenerating = false;
      _imageUrl = result ?? _imageUrl;
      _displayMessage = result == null
          ? 'An error occurred. Please try again.'
          : _displayMessage;
    });
  }
}
