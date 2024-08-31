import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeringList extends StatelessWidget {
  const ShimmeringList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      color: Colors.blueGrey,
                    ),
                    const SizedBox(width: 18.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100, // Adjust width here
                          height: 20.0,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          width: 200, // Adjust width here
                          height: 14.0,
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
