import 'package:bloc_rewind/api_app/data/provider/post_provider.dart';
import 'package:bloc_rewind/api_app/data/repository/post_repository.dart';
import 'package:bloc_rewind/api_app/post_bloc/post_bloc.dart';
import 'package:bloc_rewind/api_app/views/api_screen.dart';
import 'package:bloc_rewind/app_view.dart';
import 'package:bloc_rewind/counter_app/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_rewind/counter_app/bloc/visibility_bloc/visibility_bloc.dart';
import 'package:bloc_rewind/counter_app/views/counter_screen.dart';
import 'package:bloc_rewind/internet_app/internet_cubit/internet_cubit.dart';
import 'package:bloc_rewind/internet_app/views/internet_screen.dart';
import 'package:bloc_rewind/timer_app/views/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyAppView(),
      ),
      GoRoute(
        path: '/counter_app',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CounterBloc(),
            ),
            BlocProvider(
              create: (context) => VisibilityBloc(),
            ),
          ],
          child: const CounterScreen(),
        ),
      ),
      GoRoute(
        path: '/timer_app',
        builder: (context, state) => const TimerScreen(),
      ),
      GoRoute(
        path: '/api_app',
        builder: (context, state) => RepositoryProvider(
          create: (context) => PostRepository(PostProvider()),
          child: BlocProvider(
            //lazy: false,
            create: (context) => PostBloc(context.read<PostRepository>()),
            child: const ApiScreen(),
          ),
        ),
      ),
      GoRoute(
        path: '/internet_app',
        builder: (context, state) => BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(),
          child: const InternetScreen(),
        ),
      ),
    ]);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.blue.shade200,
          onSurface: Colors.black,
          primary: const Color.fromRGBO(214, 167, 32, 1),
          //const Color.fromRGBO(4, 103, 172, 1),
          onPrimary: Colors.white,
          onSecondaryContainer: Colors.grey.shade400,
          onPrimaryContainer: const Color.fromARGB(255, 220, 202, 121),
        ),
      ),
      title: 'Bloc Rewind',
    );
  }
}
