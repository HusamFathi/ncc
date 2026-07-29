import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/locale/app_localizations_helper.dart';
import '../../../../../core/utils/constants.dart';
import 'info_card_widget.dart';

class NccInfoWidget extends StatelessWidget {
  const NccInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 650,
      child: Column(
        children: [
          Gap(kLargeGap),
          InfoCardWidget(
            title: Tr.of(context).ourVision,
            description: Tr.of(context).nccVision,
          ),

          Gap(kSmallGap),

          InfoCardWidget(
            title: Tr.of(context).ourMessage,
            description: Tr.of(context).nccMessage,
          ),
          Gap(kSmallGap),

          InfoCardWidget(
            title: Tr.of(context).ourGoals,
            description: Tr.of(context).nccGoals,
          ),
        ],
      ),
    );
  }
}
