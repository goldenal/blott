import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class NewWebLoader extends StatefulWidget {
  String title;
  String? url;
  NewWebLoader(this.title, this.url);

  @override
  _WebLoaderActivity createState() => _WebLoaderActivity();
}

class _WebLoaderActivity extends State<NewWebLoader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? altUrl = '${ModalRoute.of(context)!.settings.arguments}';
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params)
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) async {
                CircularProgressIndicator();
              },
              onPageFinished: (String url) {
                CircularProgressIndicator();
              },
              onWebResourceError: (WebResourceError error) {
                CircularProgressIndicator();
              },
              onNavigationRequest: (NavigationRequest nav) {
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url ?? altUrl));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
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
        iconTheme: IconThemeData(color: Colors.purple),
        title: Text(
          "NEWS",
        ),
        elevation: 0.0,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
