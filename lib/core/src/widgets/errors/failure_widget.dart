import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/string.dart';
import '../../../locale/app_localizations_helper.dart';
import '../../../utils/constants.dart';
import 'error_text_widget.dart';
import 'success_error_icon_widget.dart';

class FailureWidget extends StatelessWidget {
  final String error;
  final int code;
  final void Function()? onRetry;
  final void Function()? onCancel;

  const FailureWidget({
    super.key,
    required this.error,
    required this.code,
    this.onRetry,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kSmallPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SuccessErrorIconWidget(isSuccess: false, iconSize: 150),
            const Gap(kMediumGap),
            ErrorTextWidget(
              error: Tr.of(context).errorCode(code).capitalizeFirstLetter(),
            ),
            const Gap(kMediumGap),
            ErrorTextWidget(error: error),
            const Gap(kMediumGap),
            Builder(
              builder: (context) {
                return onRetry != null
                    ? FilledButton(
                        onPressed: onRetry,
                        child: Text(
                          Tr.of(context).retry.capitalizeFirstLetter(),
                        ),
                      )
                    : const SizedBox();
              },
            ),
            onCancel != null ? const Gap(kMediumGap) : const SizedBox(),
            const Gap(kMediumGap),
            onCancel != null
                ? ElevatedButton(
                    onPressed: onCancel,
                    child: Text(Tr.of(context).cancel.capitalizeFirstLetter()),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
