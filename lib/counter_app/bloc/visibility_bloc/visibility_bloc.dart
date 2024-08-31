import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'visibility_event.dart';
part 'visibility_state.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(const VisibilityState(isVisible: true)) {
    on<IsVisibleEvent>((event, emit) {
      emit(VisibilityState(isVisible: state.isVisible == true));
    });
    on<IsNotVisibleEvent>((event, emit) {
      emit(VisibilityState(isVisible: state.isVisible == false));
    });
  }
}
