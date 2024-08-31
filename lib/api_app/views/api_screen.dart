import 'package:bloc_rewind/api_app/post_bloc/post_bloc.dart';
import 'package:bloc_rewind/components/shimmering_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  void initState() {
    context.read<PostBloc>().add(const LoadPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository App with API'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            const Center(child: CircularProgressIndicator());
          }
          if (state is PostFailureState) {
            return Text(state.error);
          }
          if (state is PostSuccessState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: ListView.builder(
                  itemCount: state.post.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(state.post.data[index].firstName),
                          tileColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          leading: Image.network(
                            state.post.data[index].avatar,
                            //scale: 10,
                          ),
                          subtitle: Text(state.post.data[index].email),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
            );
          } else {
            const Center(
              child: Text('No data'),
            );
          }
          // Default case: no data available
          return const ShimmeringList();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        onPressed: () {
          context.read<PostBloc>().add(const LoadPostEvent());
        },
        child: const Icon(
          CupertinoIcons.refresh,
        ),
      ),
    );
  }
}
