import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 1
  late WebViewController controller;
  @override
  void initState() {
    // 2
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://cccccch-vits-fast-fine-tuning-dingzhen.hf.space'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              // 3
              Expanded(child: WebViewWidget(controller: controller))
            ],
          ),
        ));
  }
}