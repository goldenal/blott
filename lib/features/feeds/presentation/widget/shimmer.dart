import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FeedsShimmer extends StatelessWidget {
  const FeedsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        shimmerWidget(),
        SizedBox(
          height: 10.h,
        ),
        shimmerWidget(),
        SizedBox(
          height: 10.h,
        ),
        shimmerWidget(),
        SizedBox(
          height: 10.h,
        ),
        shimmerWidget(),
        SizedBox(
          height: 10.h,
        ),
        shimmerWidget(),
      ],
    );
  }
}

shimmerWidget() {
  return Row(
    children: [
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: Container(
          height: 100.w,
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(8.r)),
        ),
      ),
      SizedBox(
        width: 16.w,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 20.w,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 20.w,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              child: Container(
                height: 50.w,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
