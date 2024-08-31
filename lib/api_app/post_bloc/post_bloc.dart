import 'package:bloc/bloc.dart';
import 'package:bloc_rewind/api_app/data/model/post.dart';
import 'package:bloc_rewind/api_app/data/repository/post_repository.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostInitialState()) {
    on<LoadPostEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final posts = await _postRepository.getPosts();
        emit(PostSuccessState(posts));
      } catch (e) {
        emit(PostFailureState(e.toString()));
      }
    });
  }
}
