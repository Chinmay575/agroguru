import 'dart:io';
import 'dart:typed_data';

import 'package:agroguru/src/domain/repository/ai_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

part 'ai_event.dart';
part 'ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {
  AiBloc() : super(ResponseRecievedState([], [])) {
    on<SendMessageEvent>(
      (event, emit) async {
        emit(SendingMessageState(state.messages, state.history));

        types.Message msg = event.message;

        print(event.message.type);

        state.messages.insert(
          0,
          msg,
        );

        if (msg.type == types.MessageType.image) {
          types.ImageMessage tmp = msg as types.ImageMessage;
          String mime = lookupMimeType(msg.uri) ?? 'text/text';
          Uint8List image = await File(tmp.uri).readAsBytes();
          state.history.add(Content.data(mime, image));
        } else {
          types.TextMessage tmp = msg as types.TextMessage;

          state.history.add(Content.text(tmp.text));
        }

        String response = await AiRepository.sendMessage(
          message: event.message,
          history: state.history,
        );

        final reply = types.TextMessage(
          author: const types.User(id: 'gemini'),
          id: const Uuid().v4(),
          text: response,
          createdAt: DateTime.now().millisecondsSinceEpoch,
        );

        state.messages.insert(
          0,
          reply,
        );

        state.history.add(
          Content.model(
            [
              TextPart(reply.text),
            ],
          ),
        );

        emit(ResponseRecievedState(state.messages, state.history));
      },
    );

    on<UpdateMessagesEvent>(
      (event, emit) {
        emit(state.copyWith(messages: event.messages));
      },
    );
  }
}
