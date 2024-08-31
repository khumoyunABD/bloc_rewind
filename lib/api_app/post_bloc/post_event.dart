part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => []; // Default empty list
}

class LoadPostEvent extends PostEvent {
  const LoadPostEvent(); // No properties

  @override
  List<Object?> get props => []; // No properties to compare
}





//previous method
// sealed class PostEvent {

// }

// class LoadPostEvent extends PostEvent {}
