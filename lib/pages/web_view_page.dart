import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  const WebViewPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPage();
  }
}

class _WebViewPage extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SizedBox(
          child: InkWell(
            onTap: () {
              // 返回
              Navigator.pop(context);
            },
            child: SizedBox(
              width: 200.w,
              height: 50.h,
              child: const Text('返回'),
            ),
          ),
        ),
      ),
    );
  }
}
