import 'dart:io';
import 'dart:typed_data';

import 'package:agroguru/src/config/global.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mime/mime.dart';

class AiRepository {
  static String get _apiKey => Global.genAIAPIKey;

  static Future<String> sendMessage({
    required types.Message message,
    List<Content>? history,
  }) async {
    try {
      GenerativeModel textModel =
          GenerativeModel(model: 'gemini-pro', apiKey: _apiKey);

      GenerativeModel imageModel = GenerativeModel(
        model: 'gemini-pro-vision',
        apiKey: _apiKey,
      );

      ChatSession textChat = textModel.startChat(
        // history: history,
      );

      ChatSession imageChat = imageModel.startChat(
        // history: history,
      );

      GenerateContentResponse response;

      switch (message.type) {
        case (types.MessageType.text):
          {
            response = await textChat.sendMessage(
              Content.text(
                (message as types.TextMessage).text,
                
              ),
            );
            break;
          }
        case (types.MessageType.image):
          {
            Uint8List image =
                await File((message as types.ImageMessage).uri).readAsBytes();

            String mime = lookupMimeType((message).uri) ?? '';

            response = await imageChat.sendMessage(
              Content.data(mime, image),
            );
            break;
          }
        default:
          response = GenerateContentResponse([], null);

          break;
      }

      if (response.text != null) {
        return response.text ?? '';
      }
    } on Exception catch (e) {
      print(e);
    }

    return 'Unexpected error occured! Try again later ';
  }
}
