import 'package:bloc_rewind/counter_app/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_rewind/counter_app/bloc/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counterValue: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(counterValue: state.counterValue + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterState(counterValue: state.counterValue - 1));
    });
  }
}
