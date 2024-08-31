part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState(); // Constructor

  @override
  List<Object?> get props => []; // Default empty list
}

final class PostInitialState extends PostState {
  @override
  List<Object?> get props => []; // No properties to compare
}

final class PostLoadingState extends PostState {
  @override
  List<Object?> get props => []; // No properties to compare
}

final class PostSuccessState extends PostState {
  final Post post;
  const PostSuccessState(this.post);

  @override
  List<Object?> get props => [post]; // Compare based on 'post'
}

final class PostFailureState extends PostState {
  final String error;
  const PostFailureState(this.error);

  @override
  List<Object?> get props => [error]; // Compare based on 'error'
}


//previous method
// sealed class PostState {

// }

// final class PostInitialState extends PostState {}

// final class PostLoadingState extends PostState {}

// final class PostSuccessState extends PostState {
//   final Post post;
//   PostSuccessState(this.post);
// }

// final class PostFailureState extends PostState {
//   final String error;
//   PostFailureState(this.error);
// }
