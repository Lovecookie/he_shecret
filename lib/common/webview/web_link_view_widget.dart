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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      // decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      constraints: BoxConstraints(maxHeight: widget.height),
      // height: widget.height,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        child: WebViewWidget(controller: webViewController),
      ),
    );
  }
}
