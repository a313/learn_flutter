import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets/core/extentsion/build_context_ext.dart';

import '../theme/app_font.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    Key? key,
    this.labelText,
    this.helperText,
    this.errorText,
    this.validator,
    this.keyboardType,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.formaters,
    this.textCapitalization = TextCapitalization.words,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.maxLines = 1,
    this.textStyle,
    this.validMode,
    this.obscureText = false,
    this.initialValue,
    this.onClear,
  }) : super(key: key);

  final bool autofocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String? p1)? validator;
  final TextCapitalization textCapitalization;
  final bool enabled;
  final List<TextInputFormatter>? formaters;
  final TextInputAction? textInputAction;
  final Function(String p1)? onChanged;
  final Function()? onClear;
  final Function(String p1)? onSubmitted;
  final AutovalidateMode? validMode;
  final Widget? prefix;
  final Widget? suffix;
  final String? labelText;
  final TextStyle? textStyle;
  final String? helperText;
  final String? errorText;
  final bool obscureText;
  final String? initialValue;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late TextEditingController controller;
  late bool showPassword;

  @override
  void initState() {
    showPassword = widget.obscureText;
    controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      obscureText: showPassword,
      maxLines: widget.maxLines,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization,
      enabled: widget.enabled,
      inputFormatters: widget.formaters,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      autovalidateMode: widget.validMode,
      style: (widget.textStyle ?? AppFonts.bMedium).copyWith(
        color: widget.enabled ? null : context.neutral600,
      ),
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        prefixIcon: widget.prefix,
        // suffixIcon: _Suffix(
        //   controller: controller,
        //   obscureText: widget.obscureText,
        //   showPassword: showPassword,
        //   onChanged: widget.onChanged,
        //   onClear: widget.onClear,
        //   onToggleVisible: (visible) {
        //     setState(() {
        //       showPassword = visible;
        //     });
        //   },
        // ),
        labelText: widget.labelText,
        fillColor: widget.enabled ? context.neutral100 : context.neutral300,
        labelStyle: (widget.textStyle ?? AppFonts.bSmall).copyWith(height: 1),
        hintStyle: (widget.textStyle ?? AppFonts.bSmall)
            .copyWith(color: context.neutral600, height: 1),
        helperMaxLines: 1,
        counter: const SizedBox(),
        helperText: widget.helperText,
        hintMaxLines: 2,
        helperStyle:
            AppFonts.bSmall.copyWith(color: context.neutral800, height: 1),
        errorText: widget.errorText,
        errorMaxLines: 2,
        errorStyle: AppFonts.bSmall.copyWith(color: Colors.red, height: 1),
      ),
    );
  }
}

// class _Suffix extends StatelessWidget {
//   const _Suffix(
//       {required this.controller,
//       required this.showPassword,
//       required this.obscureText});

//   final TextEditingController controller;
//   final bool showPassword;
//   final bool obscureText;

//   final Function(String p1)? onChanged;
//   final Function()? onClear;
//   final Function(bool visible)? onToggleVisible;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         InkWell(
//           onTap: () {
//             controller.clear();
//             onChanged?.call("");
//             onClear?.call();
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(12),
//             child: SvgPicture.asset("assets/svg/Regular/XCircle.svg"),
//           ),
//         ),
//         if (obscureText)
//           IconButton(
//             icon: Icon(
//               showPassword ? Icons.visibility : Icons.visibility_off,
//               color: context.neutral700,
//             ),
//             onPressed: onToggleVisible?.call(!showPassword),
//           ),
//       ],
//     );
//   }
// }
