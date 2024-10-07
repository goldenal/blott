import 'package:blott_app/welcome/application/welcomeProvider.dart';
import 'package:blott_app/welcome/presentation/screens/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterName extends ConsumerWidget {
  const EnterName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(welcomeProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Your legal name",
                style: GoogleFonts.roboto(
                    fontSize: 30.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "We need to know a bit about you so that we can create your account.",
                style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    color: const Color(0xff737373),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                  controller: model.firstName,
                  onChanged: (val) {
                    model.checkValidity();
                  },
                  decoration: const InputDecoration(
                      hintText: "First name",
                      hintStyle: TextStyle(
                          color: Color(0xff737373),
                          fontWeight: FontWeight.w400))),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                  controller: model.lastName,
                  onChanged: (val) {
                    model.checkValidity();
                  },
                  decoration: const InputDecoration(
                      hintText: "Last name",
                      hintStyle: TextStyle(
                          color: Color(0xff737373),
                          fontWeight: FontWeight.w400))),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (model.isEnabled) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifications()));
                      }
                    },
                    child: Container(
                      width: 56.w,
                      height: 56.w,
                      decoration: BoxDecoration(
                        color: model.isEnabled
                            ? const Color(0xff523AE4)
                            : const Color(0xff523AE4).withOpacity(0.3), // ,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
