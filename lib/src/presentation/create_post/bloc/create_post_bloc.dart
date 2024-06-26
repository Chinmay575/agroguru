import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc()
      : super(
          CreatePostState(
            content: '',
            images: [],
            title: '',
            videos: [],
          ),
        ) {
    on<CreatePostGetData>(
      (event, emit) {
        emit(
          state.copyWith(
            content: event.content,
            images: event.images,
            title: event.title,
            videos: event.videos,
          ),
        );
      },
    );
  }
}
