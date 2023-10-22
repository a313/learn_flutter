import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/core/extensions/datetime_ext.dart';
import 'package:widgets/core/util.dart';
import 'package:widgets/sharedWidgets/base_scaffold.dart';
import 'package:widgets/theme/app_font.dart';
import 'melding_detail_controller.dart';

class MeldingDetailPage extends GetView<MeldingDetailController> {
  const MeldingDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Tilbake',
      body: GetBuilder<MeldingDetailController>(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 24, 20),
            child: Column(
              children: [
                Text(
                  controller.melding.title,
                  style: AppFonts.Medium18.copyWith(color: context.Primary),
                ),
                Row(
                  children: [
                    Text(
                      controller.melding.author,
                      style:
                          AppFonts.Medium14.copyWith(color: context.Primary1),
                    ),
                  ],
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: controller.melding.time
                                .toStringFormat('E dd. MMM yyyy') +
                            ' kl. ' +
                            controller.melding.time.toStringFormat('HH.mm'),
                        style:
                            AppFonts.Medium12.copyWith(color: context.Primary1),
                      ),
                    ),
                  ],
                ),
                sizedBoxH20,
                Row(
                  children: [
                    Flexible(
                        child:
                            Container(child: Text(controller.melding.content))),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
