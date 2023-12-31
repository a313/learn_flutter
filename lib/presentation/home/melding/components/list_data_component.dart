import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:widgets/core/extensions/datetime_ext.dart';
import 'package:widgets/core/util.dart';
import 'package:widgets/domain/models/Melding.dart';
import 'package:widgets/theme/app_font.dart';

class ListDataComponent extends StatelessWidget {
  const ListDataComponent({
    super.key,
    required this.data,
    required this.onOpenDetail,
  });

  final Map<DateTime, List<Melding>> data;
  final Function(Melding item) onOpenDetail;

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
              return MeldingItem(
                item: item,
                onOpenDetail: onOpenDetail,
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
    return SizedBox();
  }
}

class MeldingItem extends StatelessWidget {
  const MeldingItem({
    super.key,
    required this.item,
    required this.onOpenDetail,
  });

  final Melding item;
  final Function(Melding item) onOpenDetail;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onOpenDetail(item);
      },
      child: Container(
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
                'kl. 09.30',
                style: AppFonts.Medium12.copyWith(color: context.Secondary2),
              ),
              sizedBoxH04,
              Text(
                'data',
                style: AppFonts.Regular12.copyWith(color: context.Secondary2),
              ),
              sizedBoxH04,
              Text('data', style: AppFonts.Regular14)
            ],
          ),
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
