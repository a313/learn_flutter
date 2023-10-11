import 'package:flutter/material.dart';
import 'package:widgets/core/extensions/build_context_ext.dart';
import 'package:widgets/theme/app_font.dart';

class MyButton extends StatelessWidget {
  final WidgetBuilder builder;
  const MyButton._({Key? key, required this.builder}) : super(key: key);

  factory MyButton.P1Primary(
      {required String title,
      required Function()? onPressed,
      Widget? prefix,
      Widget? subfix}) {
    return MyButton._(
      builder: (context) => PrimaryButton(
        title: title,
        onPressed: onPressed,
        prefix: prefix,
        subfix: subfix,
        bgColor: context.Primary,
        textStyle: AppFonts.Medium14.copyWith(color: context.BlackS00),
      ),
    );
  }

  factory MyButton.S2Primary(
      {required String title,
      required Function()? onPressed,
      Widget? prefix,
      Widget? subfix}) {
    return MyButton._(
      builder: (context) => PrimaryButton(
        title: title,
        onPressed: onPressed,
        prefix: prefix,
        subfix: subfix,
        bgColor: context.Secondary,
        textStyle: AppFonts.Medium14.copyWith(color: context.Primary),
      ),
    );
  }

  factory MyButton.P1Secondary(
      {required String title,
      required Function()? onPressed,
      Widget? prefix,
      Widget? subfix}) {
    return MyButton._(
      builder: (context) => SecondaryButton(
        title: title,
        onPressed: onPressed,
        prefix: prefix,
        subfix: subfix,
        borderColor: context.Primary,
        textStyle: AppFonts.Medium14.copyWith(color: context.Primary),
      ),
    );
  }

  factory MyButton.S2Secondary(
      {required String title,
      required Function()? onPressed,
      Widget? prefix,
      Widget? subfix}) {
    return MyButton._(
      builder: (context) => SecondaryButton(
        title: title,
        onPressed: onPressed,
        prefix: prefix,
        subfix: subfix,
        borderColor: context.Secondary,
        textStyle: AppFonts.Medium14.copyWith(color: context.Secondary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: builder);
  }
}

class PrimaryButton extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final Widget? subfix;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final Color? bgColor;

  const PrimaryButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.prefix,
      this.subfix,
      this.textStyle,
      this.bgColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: bgColor,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10)),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle ?? AppFonts.Medium14,
        ));
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {super.key,
      required this.title,
      this.prefix,
      this.subfix,
      this.onPressed,
      this.textStyle,
      required this.borderColor});
  final String title;
  final Widget? prefix;
  final Widget? subfix;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: borderColor),
            ),
            backgroundColor: context.BlackS00,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10)),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle ?? AppFonts.Medium14,
        ));
  }
}
