part of 'visibility_bloc.dart';

class VisibilityState extends Equatable {
  const VisibilityState({required this.isVisible});
  final bool isVisible;

  @override
  List<Object> get props => [isVisible];
}

// final class VisibilityInitial extends VisibilityState {
//   const VisibilityInitial(super.isVisible);

//   @override
//   String toString() {
//     return 'VisibilityInitial { visible: $isVisible}';
//   }
// }
