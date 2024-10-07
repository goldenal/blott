import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedItem extends StatelessWidget {
  final String pic, title, time, body;
  const FeedItem(
      {super.key,
      required this.body,
      required this.pic,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: pic,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
                  height: 30.w,
                  width: 30.w,
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress)),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: 100.w,
          width: 100.w,
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
                  Text(
                    title,
                    style: GoogleFonts.rubik(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    time,
                    style: GoogleFonts.rubik(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                body,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }
}
