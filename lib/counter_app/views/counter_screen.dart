// ignore_for_file: avoid_print

import 'package:bloc_rewind/counter_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_rewind/counter_app/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_rewind/counter_app/bloc/counter_bloc/counter_state.dart';
import 'package:bloc_rewind/counter_app/bloc/visibility_bloc/visibility_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  //final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    Color? numColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            //bloc: counterBloc,
            builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: numColor,
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<VisibilityBloc, VisibilityState>(
            builder: (context, state) {
              return Visibility(
                visible: state.isVisible,
                child: Container(
                  height: 50,
                  width: 50,
                  //color: Colors.pink.shade200,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.pink.shade200,
                  ),
                  child: const Icon(CupertinoIcons.eye_solid),
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementEvent());
                },
                icon: const Icon(CupertinoIcons.minus),
              ),
              IconButton.filled(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementEvent());
                },
                icon: const Icon(CupertinoIcons.add),
              ),
            ],
          ),
          BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state.counterValue < 0) {
                numColor = Colors.red;
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('The value has gone negative'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
              if (state.counterValue > 0) {
                numColor = Colors.green;
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('The value is positive'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
              if (state.counterValue == 0) {
                numColor = Colors.grey;
              }
            },
            child: const Text('Bloc Listener'),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Bloc Consumer'),
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state.counterValue < 0) {
                numColor = Colors.red;
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('The value has gone negative'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
              if (state.counterValue > 0) {
                numColor = Colors.green;
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('The value is positive'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
              if (state.counterValue == 0) {
                numColor = Colors.grey;
              }
            },
            builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: numColor,
                ),
              );
            },
            //child: const Text('Bloc Listener'),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton.outlined(
            iconSize: 30,
            onPressed: () {
              context.read<VisibilityBloc>().add(IsVisibleEvent());
            },
            icon: const Icon(CupertinoIcons.eye_fill),
          ),
          IconButton.outlined(
            iconSize: 30,
            onPressed: () {
              context.read<VisibilityBloc>().add(IsNotVisibleEvent());
            },
            icon: const Icon(CupertinoIcons.eye_slash),
          ),
        ],
      ),
    );
  }
}
