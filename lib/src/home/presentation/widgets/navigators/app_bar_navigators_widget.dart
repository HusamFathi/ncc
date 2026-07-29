import 'package:flutter/material.dart';

class AppBarNavigatorsWidget extends StatelessWidget {
  final void Function(int inex) goToIndex;
  const AppBarNavigatorsWidget({super.key, required this.goToIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // OutlinedButton(
        //   onPressed: () => goToIndex(0),

        //   child: Text(Tr.of(context).main.capitalizeFirstLetter()),
        // ),
        // Gap(kSmallGap),
        // OutlinedButton(
        //   onPressed: () => goToIndex(1),

        //   child: Text(Tr.of(context).ourPartners.capitalizeFirstLetter()),
        // ),
        // Gap(kSmallGap),
        // OutlinedButton(
        //   onPressed: () => goToIndex(2),

        //   child: Text(Tr.of(context).features.capitalizeFirstLetter()),
        // ),
        // Gap(kSmallGap),
        // OutlinedButton(
        //   onPressed: () => goToIndex(4),

        //   child: Text(Tr.of(context).faqTitle.capitalizeFirstLetter()),
        // ),
      ],
    );
  }
}
