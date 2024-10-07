import 'package:blott_app/feeds/application/feeds_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Errorpage extends ConsumerWidget {
 final String? txt;
  const Errorpage({super.key,required this.txt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(feedsProvider);
    return Scaffold(
      backgroundColor: const Color(0xff05021B),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Hey ${model.retrieveName()} ",
              style: GoogleFonts.raleway(
                  fontSize: 32.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 34.h,
            ),
            Text(
              "Something went wrong(${txt}). Please try again later. ",
              style: GoogleFonts.raleway(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
