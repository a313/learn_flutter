import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets/core/util.dart';
import 'package:widgets/theme/app_font.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent(
      {super.key,
      required this.nextWeek,
      required this.prevWeek,
      required this.week,
      required this.time});
  final int week;
  final String time;
  final Function() nextWeek;
  final Function() prevWeek;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.Secondary,
      child: Row(
        children: [
          InkWell(
              onTap: () {},
              child: Padding(
                padding: padAll12,
                child: SvgPicture.asset('assets/svg/Arrow_drop_left.svg'),
              )),
          Text(
            'Uke $week',
            style: AppFonts.Medium14,
          ),
          Expanded(
              child: Text(
            time,
            style: AppFonts.Medium12,
            textAlign: TextAlign.right,
          )),
          InkWell(
              onTap: () {},
              child: Padding(
                  padding: padAll12,
                  child: SvgPicture.asset('assets/svg/Arrow_drop_right.svg'))),
        ],
      ),
    );
  }
}
