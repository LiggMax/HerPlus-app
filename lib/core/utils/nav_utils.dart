import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//不依赖上下文的导航工具类
class NavUtils {
  /// 全局 Navigator Key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// 返回上一个页面，并可携带返回值
  static void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }

  /// 普通跳转：压栈一个新页面
  static Future<T?> push<T extends Object?>(Widget page) {
    return navigatorKey.currentState!.push(
      CupertinoPageRoute(builder: (_) => page),
    );
  }

  /// 普通跳转：压栈一个新页面（Material 风格）
  static Future<T?> upPush<T extends Object?>(Widget page) {
    return navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// 替换当前页面：新页面替换掉当前页面
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page,
  ) {
    return navigatorKey.currentState!.pushReplacement(
      CupertinoPageRoute(builder: (_) => page),
    );
  }

  /// 跳转并清空栈：新页面进入后，之前所有页面都会被移除
  static Future<T?> pushAndRemoveUntil<T extends Object?>(Widget page) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      CupertinoPageRoute(builder: (_) => page),
      (Route<dynamic> route) => false,
    );
  }

  /// 跳转到错误页（数据异常时使用）
  // static Future<T?> toErrorPage<T extends Object?>({String errorMsg = "数据异常"}) {
  //   return push(ErrorPage(errorMessage: errorMsg));
  // }

  /// 显示底部弹窗（系统自带的 showModalBottomSheet）（这里只是简单封装带有 context,以后如果不够用可以扩展参数）
  static Future<T?> showBottomSheet<T>({
    required WidgetBuilder builder,
    bool isScrollControlled = false,
    bool useRootNavigator = true,
    Color? backgroundColor,
    Color? barrierColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
  }) {
    return showModalBottomSheet<T>(
      context: navigatorKey.currentContext!,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      barrierColor: barrierColor,
      clipBehavior: clipBehavior,
      builder: builder,
    );
  }
}
