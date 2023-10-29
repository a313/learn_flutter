import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:widgets/core/extensions/datetime_ext.dart';
import 'package:widgets/core/util.dart';
import 'package:widgets/domain/models/arrangement.dart';
import 'package:widgets/theme/app_font.dart';

class ListDataComponent extends StatelessWidget {
  const ListDataComponent({
    super.key,
    required this.data,
  });

  final Map<DateTime, List<Arrangement>> data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: List.generate(data.keys.length, (index) {
        final key = data.keys.elementAt(index);
        final listItems = data[key];

        return SliverStickyHeader.builder(
          builder: (context, state) => StickyHeader(time: key),
          sliver: SliverList.builder(
            itemCount: max(listItems!.length, 1),
            itemBuilder: (context, index) {
              if (listItems.isEmpty) return NotExistEventComponent();
              final item = listItems.elementAt(index);
              return ArrangementItem(
                item: item,
              );
            },
          ),
        );
      }),
    );
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

  final Arrangement item;

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
              item.title,
              style: AppFonts.Medium16.copyWith(color: context.Primary),
            ),
            sizedBoxH04,
            Text(
              'Kl. ' + item.time.toStringFormat('HH.mm'),
              style: AppFonts.Medium12.copyWith(color: context.Secondary2),
            ),
            sizedBoxH04,
            Text(
              item.address,
              style: AppFonts.Regular12.copyWith(color: context.Secondary2),
            ),
            sizedBoxH04,
            Text(item.content, style: AppFonts.Regular14)
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
