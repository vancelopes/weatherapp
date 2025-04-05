import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingContent extends StatelessWidget {
  const LoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Skeletonizer(
          enabled: true,
          child: Padding( padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: 350,
                    height: 200,
                    color: Colors.grey[300],
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Skeletonizer(
          enabled: true,
          child: Padding( padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                    width: 60,
                    height: 40,
                    color: Colors.grey[300],
                  );
                },
              ),
            ),
          ),
        ),
        // SizedBox(height: 16),
        // Skeletonizer(
        //   enabled: true,
        //   child: Padding( padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        //     child: SizedBox(
        //       height: 350,
        //       child: ListView.builder(
        //         itemCount: 6,
        //         itemBuilder: (context, index) {
        //           return Container(
        //             margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        //             height: 50,
        //             color: Colors.grey[300],
        //           );
        //         },
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}