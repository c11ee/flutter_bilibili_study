import "package:demo/pages/home/home_page.dart";
import "package:demo/pages/web_view_page.dart";
import "package:flutter/material.dart";

// 路由管理类
class Routes {
  ///
  /// Route 使用 动态类型 dynamic
  /// 路由跳转都会经过 generaterRoute
  /// 需要知道跳转的是哪个页面
  ///
  static Route<dynamic> generaterRoute(RouteSettings settings) {
    String name = settings.name ?? "";

    switch (name) {
      case RoutePath.home:
        return pageRoute(const HomePage(), settings: settings);

      case RoutePath.webViewPage:
        return pageRoute(const WebViewPage(), settings: settings);

      default:
        return pageRoute(Scaffold(
          body: SafeArea(
            child: Center(
              child: Text("route path $name not exist"),
            ),
          ),
        ));
    }
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? true,
      allowSnapshotting: allowSnapshotting ?? true,
    );
  }
}

// 定义所有路由地址
class RoutePath {
  // 首页
  static const String home = "/";

  // 网页页面
  static const String webViewPage = "/web_view_page";
}
