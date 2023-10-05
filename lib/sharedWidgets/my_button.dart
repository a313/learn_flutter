import 'package:flutter/material.dart';
import 'package:widgets/core/extentsion/build_context_ext.dart';
import 'package:widgets/theme/app_font.dart';

class MyButton extends StatelessWidget {
  final WidgetBuilder builder;
  const MyButton._({Key? key, required this.builder}) : super(key: key);

  factory MyButton.primary({
    required String title,
    required Function() onPressed,
  }) {
    return MyButton._(
      builder: (context) => PrimaryButton(
        title: title,
        onPressed: onPressed,
      ),
    );
  }

  factory MyButton.secondary({
    required String title,
    required Function() onPressed,
  }) {
    return MyButton._(
      builder: (context) => SecondaryButton(
        title: title,
        onPressed: onPressed,
        textStyle: AppFonts.bMedium,
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
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: context.primaryColor,
            padding: padding),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle ?? AppFonts.bMedium,
        ));
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.padding,
    required this.textStyle,
  }) : super(key: key);
  final String title;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 2.0, color: context.primaryColor),
            borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: context.neutral600,
        padding: padding,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(title, textScaleFactor: 1, maxLines: 1, style: textStyle),
    );
  }
}
