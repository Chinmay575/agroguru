// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables, must_be_immutable

part of 'ai_bloc.dart';

class AiEvent extends Equatable {
  AiEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends AiEvent {
  types.Message message;
  SendMessageEvent({
    required this.message,
  });
}

class UpdateMessagesEvent extends AiEvent {
  List<types.Message> messages;
  UpdateMessagesEvent({
    required this.messages,
  });
}
