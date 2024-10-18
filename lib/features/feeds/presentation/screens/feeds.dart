import 'package:blott_app/features/feeds/application/feeds_provider.dart';
import 'package:blott_app/features/feeds/domain/data_model.dart';
import 'package:blott_app/features/feeds/presentation/screens/webview.dart';
import 'package:blott_app/features/feeds/presentation/widget/feed_item.dart';
import 'package:blott_app/features/feeds/presentation/widget/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Feeds extends ConsumerStatefulWidget {
  const Feeds({super.key});

  @override
  ConsumerState<Feeds> createState() => _FeedsState();
}

class _FeedsState extends ConsumerState<Feeds> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final model = ref.watch(feedsProvider);
      model.fetchData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(feedsProvider);
    return Scaffold(
      backgroundColor: const Color(0xff05021B),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Hey ${model.retrieveName()} ",
                style: GoogleFonts.raleway(
                    fontSize: 32.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 22.h,
              ),
              model.isloading
                  ? FeedsShimmer()
                  : Expanded(
                        child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              FeedsData dt = model.data[index];
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewWebLoader("News", dt.url)));
                                  },
                                  child: FeedItem(
                                    body: dt.summary ?? "",
                                    pic: dt.image ?? "",
                                    title: dt.source ?? "",
                                    time: model.convertTime(dt.datetime ?? 0),
                                  ));
                            },
                            itemCount: model.data.length),
                      ),
                    
            ],
          ),
        ),
      ),
    );
  }
}
