part of 'visibility_bloc.dart';

sealed class VisibilityEvent extends Equatable {
  const VisibilityEvent();

  @override
  List<Object> get props => [];
}

class IsVisibleEvent extends VisibilityEvent {}

class IsNotVisibleEvent extends VisibilityEvent {}
