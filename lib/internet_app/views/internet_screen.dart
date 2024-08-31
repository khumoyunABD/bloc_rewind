import 'package:bloc_rewind/internet_app/internet_cubit/internet_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetStatus>(
                builder: (context, state) {
              var statusDis = ConnectivityStatus.disconnected;
              //var statusCon = ConnectivityStatus.connected;
              // if (state.status == statusDis) {
              return state.status == statusDis
                  ? const Column(
                      children: [
                        Icon(
                          CupertinoIcons.wifi_slash,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Internet connection is not available',
                          //style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  : const Column(
                      children: [
                        Icon(
                          CupertinoIcons.wifi,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Internet connection is available',
                          //style: TextStyle(color: Colors.black),
                        ),
                      ],
                    );
            }
                // return Column(
                //   children: [
                //     Icon(
                //       state.status == statusDis
                //           ? CupertinoIcons.wifi_slash
                //           : CupertinoIcons.wifi,
                //     ),
                //     const SizedBox(
                //       height: 20,
                //     ),
                //     Text(
                //       state.status == statusDis
                //           ? 'Internet connection is not available'
                //           : 'Internet connection is available',
                //     ),
                //   ],
                // );

                ),
          ],
        ),
      ]),
    );
  }
}
