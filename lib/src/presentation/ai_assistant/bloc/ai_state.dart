// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

part of 'ai_bloc.dart';

class AiState extends Equatable {
  List<types.Message> messages;
  List<Content> history;
  AiState({
    required this.messages,
    this.history = const [],
  });

  AiState copyWith({
    List<types.Message>? messages,
    List<Content>? history,
  }) {
    return AiState(
      messages: messages ?? this.messages,
      history: history ?? this.history,
    );
  }

  @override
  List<Object> get props => [messages, history];
}

class SendingMessageState extends AiState {
  SendingMessageState(List<types.Message> messages, List<Content> history)
      : super(
          messages: messages,
          history: history,
        );
}

class ResponseRecievedState extends AiState {
  ResponseRecievedState(List<types.Message> messages,List<Content> history)
      : super(messages: messages,history: history);
}
