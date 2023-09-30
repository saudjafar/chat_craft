import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadEnvironmentVariables() async {
  await dotenv.load(fileName: ".env");
}

String? apiKey = dotenv.env['API_KEY'];

class AIHandler {
  final _openAI = OpenAI.instance.build(
    token: apiKey,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
    isLogger: true,
  );

  Future<String> getResponse(String message) async {
    try {
      final request = ChatCompleteText(messages: [
        Map.of({"role": "user", "content": message})
      ], maxToken: 200, model: kChatGptTurbo0301Model);

      final response = await _openAI.onChatCompletion(request: request);
      if (response != null) {
        return response.choices[0].message.content.trim();
      }

      return 'Something went wrong';
    } catch (e) {
      return 'Bad response';
    }
  }

  Future<ImageUrl?> generateImage(String prompt) async {
    try {
      final request = GenerateImage(
        prompt,
        1,
        size: '1024x1024',
      );
      final response = await _openAI.generateImage(request);
      if (response != null) {
        final imageDataList = response.data;
        final imageData = imageDataList?.last;
        return imageData?.url;
      }
      return 'Something went wrong';
    } catch (e) {
      print(e);
    }
    return null;
  }

  void dispose() {
    _openAI.close();
  }
}

typedef ImageUrl = String;
