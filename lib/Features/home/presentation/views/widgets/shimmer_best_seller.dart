import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBestSeller extends StatelessWidget {
  const ShimmerBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white70,
        child: Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: 200,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 20,
                            width: 100,
                            color: Colors.white,
                          ),
                        ])
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
