import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class NewWebLoader extends StatefulWidget {
  String title;
  String? url;
  NewWebLoader(this.title, this.url);

  @override
  _WebLoaderActivity createState() => _WebLoaderActivity();
}

class _WebLoaderActivity extends State<NewWebLoader> {
  @override
  bool loading = false;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? altUrl = '${ModalRoute.of(context)!.settings.arguments}';
    final PlatformWebViewControllerCreationParams params =
        const PlatformWebViewControllerCreationParams();
    // if (WebViewPlatform.instance is WebKitWebViewPlatform) {
    //   params = WebKitWebViewControllerCreationParams(
    //     allowsInlineMediaPlayback: true,
    //     mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
    //   );
    // } else {
    //   params = const PlatformWebViewControllerCreationParams();
    // }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params)
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
                //EasyLoading.show(status: 'loading...');
              },
              onPageStarted: (String url) async {
                EasyLoading.show(status: 'loading...');
                // loading = true;
                // setState(() {});
              },
              onPageFinished: (String url) {
                EasyLoading.dismiss();
                // loading = false;
                // setState(() {});
              },
              onWebResourceError: (WebResourceError error) {
                EasyLoading.dismiss();
                // loading = false;
                // setState(() {});
              },
              onNavigationRequest: (NavigationRequest nav) {
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url ?? altUrl));

    // if (controller.platform is AndroidWebViewController) {
    //   AndroidWebViewController.enableDebugging(true);
    //   (controller.platform as AndroidWebViewController)
    //       .setMediaPlaybackRequiresUserGesture(false);
    // }
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_backspace,
            size: 32.h,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.purple),
        title: const Text(
          "NEWS",
        ),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          // if (loading)
          // const Center(
          //   child: CircularProgressIndicator(
          //     color: Colors.purple,
          //   ),
          //),
        ],
      ),
    );
  }
}
