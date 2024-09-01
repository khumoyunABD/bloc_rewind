// ignore_for_file: prefer_const_constructors

import 'package:bloc_rewind/internet_app/internet_cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class InternetScreen extends StatefulWidget {
  const InternetScreen({super.key});

  @override
  State<InternetScreen> createState() => _InternetScreenState();
}

class _InternetScreenState extends State<InternetScreen> {
  late InternetCubit internetCubit;

  @override
  void initState() {
    internetCubit = context.read<InternetCubit>();
    internetCubit.checkConnectivity();
    internetCubit.trackConnectivityChange();
    super.initState();
  }

  @override
  void dispose() {
    internetCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Connection App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetStatus>(
                builder: (context, state) {
                  var statusDis = ConnectivityStatus.disconnected;
                  //var statusCon = ConnectivityStatus.connected;
                  // if (state.status == statusDis) {
                  return state.status == statusDis
                      ? Column(
                          children: [
                            // Icon(
                            //   CupertinoIcons.wifi_slash,
                            //   color: Colors.red,
                            // ),
                            Lottie.asset(
                              height: 150,
                              width: 150,
                              "assets/animations/wifi_off.json",
                              repeat: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const RadialGradient(
                                  colors: <Color>[
                                    Colors.purple,
                                    Colors.red,
                                  ],
                                  center: Alignment.center,
                                  radius: 3,
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds);
                              },
                              child: const Text(
                                'Internet connection is not available',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            // Icon(
                            //   CupertinoIcons.wifi,
                            //   color: Colors.green,
                            // ),
                            Lottie.asset(
                              height: 350,
                              width: 350,
                              "assets/animations/wifi_on_rad.json",
                              repeat: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return RadialGradient(
                                  colors: const <Color>[
                                    Colors.teal,
                                    Colors.deepPurple
                                  ],
                                  center: Alignment.center,
                                  radius: 3,
                                  tileMode: TileMode.mirror,
                                ).createShader(bounds);
                              },
                              child: SelectableText(
                                'Internet connection is available',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
