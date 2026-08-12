import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/src/widgets/base_animator_widget.dart';
import '../../../../core/utils/constants.dart';

class NotificationsPermissionsPage extends StatefulWidget {
  final VoidCallback goNext;

  const NotificationsPermissionsPage({super.key, required this.goNext});

  @override
  State<NotificationsPermissionsPage> createState() =>
      _NotificationsPermissionsPageState();
}

class _NotificationsPermissionsPageState
    extends State<NotificationsPermissionsPage> {
  @override
  void initState() {
    super.initState();
    // Permission.notification.request();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kMediumPadding),
          child: Column(
            children: [
              const Spacer(),

              Icon(
                Icons.radio_rounded,
                size: 180,
                color: theme.colorScheme.primary,
              ),

              Gap(kLargeGap),
              BaseAnimatorWidget(
                child: Text(
                  Tr.of(context).backgroundPlaybackTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Gap(kMediumGap),

              BaseAnimatorWidget(
                child: Text(
                  Tr.of(context).backgroundPlaybackDescription,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    await Permission.notification.request().then((
                      PermissionStatus value,
                    ) {
                      widget.goNext();
                    });
                  },
                  child: Text(Tr.of(context).kContinue),
                ),
              ),

              TextButton(
                onPressed: widget.goNext,
                child: Text(Tr.of(context).notNow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
