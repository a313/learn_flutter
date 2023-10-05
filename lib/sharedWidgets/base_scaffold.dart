import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseScafold extends StatelessWidget {
  const BaseScafold({
    Key? key,
    this.fab,
    this.backgroundColor,
    this.fabLocation,
    this.safeAreaBottom,
    this.safeAreaTop = true,
    this.onWillPop,
    this.onTappedScene,
    required this.body,
    this.appBar,
    this.extendBodyBehindAppBar = false,
  }) : super(key: key);

  final Widget body;
  final Widget? fab;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? fabLocation;
  final bool? safeAreaBottom;
  final bool safeAreaTop;
  final Future<bool> Function()? onWillPop;
  final Function()? onTappedScene;
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: WillPopScope(
        onWillPop: () {
          if (onWillPop != null) {
            return onWillPop!();
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          floatingActionButton: fab,
          floatingActionButtonLocation: fabLocation,
          backgroundColor: backgroundColor,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          appBar: appBar,
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTappedScene,
            child: SafeArea(
              top: safeAreaTop,
              bottom: true,
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}

class BaseScafoldAppBar extends StatelessWidget {
  const BaseScafoldAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.actions,
    this.tag,
    required this.body,
    this.fab,
    this.leading,
    this.showBackBtn = true,
    this.backgroundColor,
    this.appbarColor,
    this.fabLocation,
    this.elevation,
    this.safeAreaBottom,
    this.safeAreaTop = true,
    this.onWillPop,
    this.onTappedScene,
    this.systemOverlayStyle,
    this.extendBodyBehindAppBar = false,
    this.centerTitle,
  }) : super(key: key);
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final String? tag;
  final Widget body;
  final Widget? fab;
  final Widget? leading;
  final bool showBackBtn;
  final Color? backgroundColor;
  final Color? appbarColor;
  final FloatingActionButtonLocation? fabLocation;
  final double? elevation;
  final bool? safeAreaBottom;
  final bool safeAreaTop;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Future<bool> Function()? onWillPop;
  final bool extendBodyBehindAppBar;
  final bool? centerTitle;
  final Function()? onTappedScene;

  @override
  Widget build(BuildContext context) {
    return BaseScafold(
      backgroundColor: backgroundColor,
      fab: fab,
      onTappedScene: onTappedScene,
      fabLocation: fabLocation,
      onWillPop: onWillPop,
      safeAreaBottom: safeAreaBottom,
      safeAreaTop: safeAreaTop,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: body,
      appBar: AppBar(
        backgroundColor: appbarColor,
        elevation: elevation,
        actions: actions,
        centerTitle: centerTitle,
        automaticallyImplyLeading: showBackBtn,
        systemOverlayStyle: systemOverlayStyle,
        title: titleWidget ?? Text(title ?? ''),
      ),
    );
  }
}
