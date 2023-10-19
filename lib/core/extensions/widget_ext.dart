import 'package:flutter/material.dart';

extension WigetExt on Widget {
  ColoredBox coloredBox({Color color = const Color(0x6CF44336)}) => ColoredBox(
        color: color,
        child: this,
      );

  DebugSizeWidget debugSize() => DebugSizeWidget(child: this);
}

class DebugSizeWidget extends StatefulWidget {
  const DebugSizeWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<DebugSizeWidget> createState() => _DebugSizeWidgetState();
}

class _DebugSizeWidgetState extends State<DebugSizeWidget> {
  final GlobalKey _key = GlobalKey();
  Size size = Size.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  getSizeAndPosition() {
    final cardBox = _key.currentContext?.findRenderObject();
    size = (cardBox as RenderBox).size;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: UniqueKey(),
      alignment: Alignment.bottomRight,
      children: [
        Container(
          key: _key,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.red,
            strokeAlign: BorderSide.strokeAlignOutside,
          )),
          child: widget.child,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'w:${size.width}\nh:${size.height}\nar:${size.width / size.height}',
            style: const TextStyle(fontSize: 10, color: Colors.white),
            textAlign: TextAlign.right,
          ),
        ).coloredBox(color: Colors.black),
      ],
    );
  }
}
