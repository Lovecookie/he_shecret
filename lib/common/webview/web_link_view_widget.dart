import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FWebLinkViewWidget extends StatefulWidget {
  final String linkUrl;
  final String commonId;
  final double height;

  const FWebLinkViewWidget({
    super.key,
    required this.linkUrl,
    this.commonId = "",
    this.height = 300.0,
  });

  @override
  State<FWebLinkViewWidget> createState() => _FWebLinkViewWidgetState();
}

class _FWebLinkViewWidgetState extends State<FWebLinkViewWidget> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.linkUrl));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: webViewController);
  }
}
