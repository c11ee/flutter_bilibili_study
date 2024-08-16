import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPage();
  }
}

class _WebViewPage extends State<WebViewPage> {
  String name = "";

  @override
  void initState() {
    super.initState();

    // 组件初始化完成后获取路由参数
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var map = ModalRoute.of(context)?.settings.arguments;
      if (map is Map) {
        name = map['name'];
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
