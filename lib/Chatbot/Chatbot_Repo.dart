//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

import 'package:dart_openai/dart_openai.dart';

class ChatBotRepo {
  static const _apiKey = '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';

  static Future<String> generateChats(String prompt) async {
    OpenAI.apiKey = _apiKey;
    OpenAICompletionModel completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      prompt: prompt,
      maxTokens: 1000,
      temperature: 0.5,
      n: 1,
      echo: true,
    );
    print(completion.choices[0].text);
    return completion.choices[0].text;
  }
}
