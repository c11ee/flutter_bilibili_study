import 'package:flutter/material.dart';

///
/// RouteUtils 类
/// 通过封装 Flutter 的导航操作，简化了应用中的路由管理，
/// 便于开发者在项目中快速进行页面跳转和管理导航栈
///
class RouteUtils {
  // 私有构造函数，确保不能被实例化
  // 该设计模式确保了这个类只能通过静态方法使用，作为工具类存在
  RouteUtils._();

  // 在任何地方访问 `Navigator` 的状态和上下文.
  static final navigatorKey = GlobalKey<NavigatorState>();

  // getter
  // 返回当前 `Navigator` 的上下文
  static BuildContext get context => navigatorKey.currentContext!;

  // 返回 `Navigator` 的状态
  static NavigatorState get navigator => navigatorKey.currentState!;

  /// 进行页面跳转
  /// [fullscreenDialog] 控制是否显示为全屏对话框（默认值为 `false`）。
  /// [settings] 可用于传递自定义的路由设置。
  /// [maintainState] 表示是否保持页面状态（默认值为 `true`）。
  static Future push(
    BuildContext context,
    Widget page, {
    bool? fullscreenDialog,
    RouteSettings? settings,
    bool maintainState = true,
  }) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => page,
          fullscreenDialog: fullscreenDialog ?? false,
          settings: settings,
          maintainState: maintainState,
        ));
  }

  /// 使用命名路由来进行页面跳转。
  /// [name] 为目标路由的名称。
  /// [arguments] 可选参数，用于传递给目标路由。
  static Future pushForNamed(
    BuildContext context,
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(context, name, arguments: arguments);
  }

  /// 使用自定义的 route 进行动态跳转。
  /// [route] 为自定义的路由对象。
  static Future pushForPageRoute(BuildContext context, Route route) {
    return Navigator.push(context, route);
  }

  /// 跳转到指定页面，跳转后清空导航栈中的所有其他页面，只保留目标页面
  /// [name] 为目标页面的路由名称。
  /// [arguments] 可选参数，用于传递给目标页面。
  static Future pushNamedAndRemoveUntil(BuildContext context, String name,
      {Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(context, name, (route) => false,
        arguments: arguments);
  }

  /// 类似 `pushNamedAndRemoveUntil` 但使用的是普通页面而不是命名路由
  /// [page] 为目标页面的 `Widget`。
  /// [fullscreenDialog], [settings], [maintainState] 与 `push` 方法类似。
  static Future pushAndRemoveUntil(
    BuildContext context,
    Widget page, {
    bool? fullscreenDialog,
    RouteSettings? settings,
    bool maintainState = true,
  }) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => page,
          fullscreenDialog: fullscreenDialog ?? false,
          settings: settings,
          maintainState: maintainState,
        ),
        (route) => false);
  }

  /// 用新的路由替换当前路由
  /// [name] 为目标路由的名称。
  /// [result] 表示返回给之前页面的结果。
  /// [argument] 用于传递给目标路由的参数。
  static Future pushReplacementNamed(
    BuildContext context,
    String name, {
    Object? result,
    Object? argument,
  }) {
    return Navigator.pushReplacementNamed(context, name,
        arguments: argument, result: result);
  }

  /// 关闭当前页面
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  /// 关闭当前页面: 包含返回值
  /// 使用泛型 [T] 来指定返回数据的类型。
  /// [data] 表示返回的数据。
  static void popOfData<T extends Object?>(BuildContext context, {T? data}) {
    Navigator.of(context).pop(data);
  }
}
