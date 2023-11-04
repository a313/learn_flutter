import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:widgets/core/extensions/datetime_ext.dart';
import 'package:widgets/core/util.dart';
import 'package:widgets/domain/models/activity/activity.dart';
import 'package:widgets/theme/app_font.dart';

class ListDataComponent extends StatelessWidget {
  const ListDataComponent({
    super.key,
    required this.data,
  });

  final Map<DateTime, List<Activity>> data;

  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      final beginOfWeek = data.keys.first.beginOfWeek;
      return CustomScrollView(
        slivers: List.generate(7, (index) {
          final time = beginOfWeek.add(Duration(days: index));
          List<Activity> items = [];
          if (data.containsKey(time)) {
            items = data[time]!;
          }
          return SliverStickyHeader.builder(
            builder: (context, state) => StickyHeader(time: time),
            sliver: SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                if (items.isEmpty) return NotExistEventComponent();
                final item = items.elementAt(index);
                return ArrangementItem(
                  item: item,
                );
              },
            ),
          );
        }),
      );
    } else {
      return SizedBox();
    }
  }
}

class NotExistEventComponent extends StatelessWidget {
  const NotExistEventComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: context.Disabled, borderRadius: borRad04),
              width: 6,
              height: 28,
            ),
            sizedBoxW12,
            Text(
              'Ingen planer',
              style: AppFonts.Medium14.copyWith(color: context.Secondary2),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: borRad08,
        border: Border.all(color: context.Stroke3, width: 0.2),
      ),
    );
  }
}

class ArrangementItem extends StatelessWidget {
  const ArrangementItem({
    super.key,
    required this.item,
  });

  final Activity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
      decoration: BoxDecoration(
        borderRadius: borRad08,
        border: Border.all(color: context.Stroke3, width: 0.2),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 8, 12, 8),
        padding: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
            color: context.Secondary,
            width: 4,
          )),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH04,
            Text(
              item.activityNm1 ?? 'unknown',
              style: AppFonts.Medium16.copyWith(color: context.Primary),
            ),
            sizedBoxH04,
            Text(
              'Kl. ' + (item.activityStartTime ?? ''),
              style: AppFonts.Medium12.copyWith(color: context.Secondary2),
            ),
            sizedBoxH04,
            Text(
              item.activityStartTime ?? '',
              style: AppFonts.Regular12.copyWith(color: context.Secondary2),
            ),
            sizedBoxH04,
            HtmlWidget(item.activityNote ?? '')
            // Text(item.activityNote ?? '', style: AppFonts.Regular14)
          ],
        ),
      ),
    );
  }
}

class StickyHeader extends StatelessWidget {
  const StickyHeader({
    super.key,
    required this.time,
  });
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.BlackS00,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12 + 20, 12, 12, 0),
        child: Text(
          time.toStringFormat('E dd. MMM yyyy'),
          style: AppFonts.Medium12,
        ),
      ),
    );
  }
}
