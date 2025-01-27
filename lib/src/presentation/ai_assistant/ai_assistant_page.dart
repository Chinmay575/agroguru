import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'bloc/ai_bloc.dart';

class AiAssistantPage extends StatefulWidget {
  const AiAssistantPage({super.key});

  @override
  State<AiAssistantPage> createState() => _AiAssistantPageState();
}

class _AiAssistantPageState extends State<AiAssistantPage> {
  Future _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        author: types.User(id: AuthRepository.curUser?.id ?? ''),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );
      return message;
    }
  }

  List<types.Message> _handlePreviewDataFetched(
    List<types.Message> messages,
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    messages[index] = updatedMessage;
    return messages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: BlocConsumer<AiBloc, AiState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SendingMessageState) {
            return Container(
              child: Chat(
                messages: state.messages,
                onSendPressed: (val) {},
                inputOptions: const InputOptions(enabled: false),
                user: types.User(id: AuthRepository.curUser?.id ?? ''),
              ),
            );
          }
          return Container(
            child: Chat(
              messages: state.messages,
              onSendPressed: (val) {
                context.read<AiBloc>().add(
                      SendMessageEvent(
                        message: types.TextMessage.fromPartial(
                          author:
                              types.User(id: AuthRepository.curUser?.id ?? ''),
                          id: const Uuid().v4(),
                          partialText: val,
                        ),
                      ),
                    );
              },
              inputOptions: const InputOptions(
                enableSuggestions: true,
              ),
              
              onAttachmentPressed: () async {
                await _handleImageSelection().then(
                  (value) {
                    if (value != null) {
                      context.read<AiBloc>().add(
                            SendMessageEvent(
                              message: value,
                            ),
                          );
                    }
                  },
                );
              },
              onPreviewDataFetched: (txt, prev) {
                context.read<AiBloc>().add(
                      UpdateMessagesEvent(
                        messages: _handlePreviewDataFetched(
                          state.messages,
                          txt,
                          prev,
                        ),
                      ),
                    );
              },
              showUserNames: true,
              user: types.User(id: AuthRepository.curUser?.id ?? ''),
            ),
          );
        },
      ),
    );
  }
}
