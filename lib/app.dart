import 'package:demo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

// 这段代码的目的是适应不同设备的屏幕尺寸，通过计算和缩放，使得应用的界面元素在不同设备上保持合适的大小和比例。
Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  // 逻辑短边
  final logicalShortestSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  // 逻辑长边
  final logicalLongestSide =
      firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  // 缩放比例 designSize 越小，元素越大
  const scaleFactor = 0.95;
  // 缩放后的逻辑短边和长边
  return Size(
      logicalShortestSide * scaleFactor, logicalLongestSide * scaleFactor);
}

// 无状态组件
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // toast 提示必须为APP的顶层组件
    return OKToast(
        child: ScreenUtilInit(
      // 屏幕适配父组件组件
      designSize: designSize,
      builder: (context, child) {
        return MaterialApp(
            title: "Flutter Demo",
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomePage());
      },
    ));
  }
}
