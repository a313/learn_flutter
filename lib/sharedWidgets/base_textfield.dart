import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets/core/util.dart';
import 'package:widgets/theme/app_font.dart';

enum TFState { unfocus, focus, filled, error, disable }

const Duration _kTransitionDuration = Duration(milliseconds: 200);
const Curve _kTransitionCurve = Curves.fastOutSlowIn;

class BaseLabelTextField extends StatefulWidget {
  const BaseLabelTextField({
    Key? key,
    required this.label,
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
    this.validMode,
    this.obscureText = false,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.onEndEdit,
    this.onBeginEdit,
    this.errorStyle,
    this.onClear,
    this.errorText,
  }) : super(key: key);

  final bool autofocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? initialValue;
  final String? Function(String? p1)? validator;
  final TextCapitalization textCapitalization;
  final bool enabled;
  final List<TextInputFormatter>? formaters;
  final TextInputAction? textInputAction;
  final Function(String p1)? onChanged;
  final Function(String p1)? onSubmitted;
  final Function()? onBeginEdit;
  final Function(String p1)? onEndEdit;
  final Function()? onClear;
  final AutovalidateMode? validMode;
  final Widget? prefix;
  final Widget? suffix;
  final String label;
  final String? hintText;
  final String? helperText;
  final TextStyle? errorStyle;
  final bool obscureText;
  final String? errorText;

  @override
  State<BaseLabelTextField> createState() => _BaseLabelTextFieldState();
}

class _BaseLabelTextFieldState extends State<BaseLabelTextField> {
  late FocusNode node;
  late TextEditingController controller;
  late TFState state;
  bool hasError = false;
  bool smallLabel = false;
  FormFieldState<String>? formField;
  bool isObscureText = false;

  @override
  void initState() {
    node = widget.focusNode ?? FocusNode();
    controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    state = TFState.focus;
    isObscureText = widget.obscureText;
    node.addListener(focusEvent);
    controller.addListener(updateUI);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateUI();
  }

  @override
  void dispose() {
    node.removeListener(focusEvent);
    controller.removeListener(updateUI);
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const disableFont = TextStyle(fontSize: double.minPositive);
    return FormField<String>(
      validator: widget.validator,
      initialValue: widget.controller?.text ?? widget.initialValue,
      autovalidateMode: widget.validMode,
      builder: (field) {
        formField = field;
        bool isErr = field.hasError || widget.errorText.hasText;
        String? errText = widget.errorText ?? field.errorText;
        void onChangedHandler(String value) {
          field.didChange(value);
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        }

        return UnmanagedRestorationScope(
          bucket: field.bucket,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: getBorderByState(),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedPositioned(
                      duration: _kTransitionDuration,
                      left: 16,
                      top: smallLabel ? 8 : 18,
                      child: AnimatedDefaultTextStyle(
                        duration: _kTransitionDuration,
                        curve: _kTransitionCurve,
                        style: smallLabel
                            //TODO change font size
                            ? AppFonts.Bold14.copyWith(
                                color: context.Primary.withOpacity(
                                    widget.enabled ? 1 : 0.5),
                                height: 1)
                            : AppFonts.Bold14.copyWith(
                                color: context.Primary.withOpacity(
                                    widget.enabled ? 1 : 0.5),
                                height: 1),
                        child: Text(widget.label),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: TextField(
                        autofocus: widget.autofocus,
                        focusNode: node,
                        controller: controller,
                        keyboardType: widget.keyboardType,
                        maxLength: widget.maxLength,
                        obscureText: isObscureText,
                        maxLines: widget.maxLines,
                        textCapitalization: widget.textCapitalization,
                        enabled: widget.enabled,
                        inputFormatters: widget.formaters,
                        textInputAction: widget.textInputAction,
                        onChanged: onChangedHandler,
                        style: AppFonts.Medium14.copyWith(
                          color: widget.enabled
                              ? null //TODO change color
                              : HexColor.fromHex('#EBEBE4'),
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(16, 6, 36, 0),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          counter: const SizedBox(),
                          errorStyle: disableFont,
                          hintStyle: smallLabel
                              //TODO fontsize & change color
                              ? AppFonts.Medium14.copyWith(
                                  color: HexColor.fromHex('#B3B3B3'))
                              : disableFont,
                          hintText: widget.hintText,
                        ),
                      ),
                    ),
                    if (widget.suffix == null)
                      widget.obscureText
                          ? Positioned(
                              right: 0,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscureText = !isObscureText;
                                    });
                                  },
                                  icon: isObscureText
                                      ? SvgPicture.asset(
                                          'assets/svg/View_hide.svg')
                                      : SvgPicture.asset(
                                          'assets/svg/View_light.svg')))
                          : Positioned(
                              right: 0,
                              child: controller.text.hasText && widget.enabled
                                  ? IconButton(
                                      onPressed: () {
                                        controller.clear();
                                        widget.onClear?.call();
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/svg/Dell_light.svg'))
                                  : const SizedBox()),
                    if (widget.suffix != null)
                      Positioned(right: 0, child: widget.suffix!),
                  ],
                ),
              ),
              //TODO change HexColor -> context. ...
              if (isErr)
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                  child: Text(
                    errText!,
                    style: widget.errorStyle ??
                        AppFonts.Regular14.copyWith(
                            color: HexColor.fromHex('#CC3300')),
                  ),
                ),
              if (!isErr && widget.helperText.hasText)
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                  child: Text(
                    widget.helperText!,
                    style: AppFonts.Regular14.copyWith(color: context.Primary),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void updateUI() {
    formField?.didChange(controller.text);
    if (hasError) {
      state = TFState.error;
    } else if (!widget.enabled) {
      state = TFState.disable;
    } else {
      if (node.hasFocus) {
        state = TFState.focus;
      } else {
        state = TFState.unfocus;
      }
    }
    if (node.hasFocus) {
      smallLabel = true;
    } else {
      smallLabel = controller.text.hasText;
    }
    if (mounted) {
      setState(() {});
    }
  }

  Border getBorderByState() {
    //TODO change HexColor -> context. ...
    switch (state) {
      case TFState.unfocus:
        return Border.all(color: HexColor.fromHex('#B3B3B3'));
      case TFState.focus:
        return Border.all(color: context.Primary);
      case TFState.filled:
        return Border.all(color: context.Primary);
      case TFState.error:
        return Border.all(color: HexColor.fromHex('#CC3300'));
      case TFState.disable:
        return Border.all(color: HexColor.fromHex('#EBEBE4'));
    }
  }

  void focusEvent() {
    if (node.hasFocus) {
      widget.onBeginEdit?.call();
    } else {
      widget.onEndEdit?.call(controller.text);
    }
    updateUI();
  }
}
