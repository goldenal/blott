import 'package:blott_app/features/onboarding/application/welcomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends ConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(welcomeProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 143.h,
              ),
              Image.asset("assets/images/notif.png"),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Get the most out of Blott ✅",
                style: GoogleFonts.roboto(
                    fontSize: 24.sp,
                    color: const Color(0xff1E1F20),
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Allow notifications to stay in the loop with your payments, requests and groups.",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    color: const Color(0xff737373),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 260.h,
              ),
              InkWell(
                onTap: () {
                  model.showNotificationPopUp(context);
                },
                child: Container(
                  width: 327.w,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                      color: const Color(0xff523AE4),
                      borderRadius: BorderRadius.circular(24.r)),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          color: const Color(0xffFAFAFA),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
