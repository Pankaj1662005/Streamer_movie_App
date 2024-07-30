import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewr extends StatefulWidget {
  const Webviewr({super.key});

  @override
  State<Webviewr> createState() => _WebviewrState();
}

class _WebviewrState extends State<Webviewr> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("https://attackertv.so/movie"));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          // Navigate back within the WebView
          controller.goBack();
          return false; // Prevent default back button action
        } else {
          return true; // Allow default back button action
        }
      },
      child: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
