import 'package:flutter/material.dart';
import 'package:ncc/core/utils/constants.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/locale/app_localizations_helper.dart';

class ShareAppPage extends StatelessWidget {
  final Map<String, dynamic>? query;
  const ShareAppPage({super.key, this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(color: Theme.of(context).colorScheme.onPrimary),
        title: Text(
          Tr.of(context).shareAppMessage,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.center,
            child: Padding(
              padding: EdgeInsetsGeometry.all(kSmallPadding),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(kRoundedCorners),
                child: Image.asset('assets/images/share-link-qr.png'),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: .min,
          children: [
            ListTile(
              leading: Icon(Icons.share),
              title: Text(Tr.of(context).shareWithMessage),
              onTap: () async {
                await SharePlus.instance.share(
                  ShareParams(
                    text: Tr.of(
                      context,
                    ).shareAppLinkMessage("https://ncc-landing-xi.vercel.app/"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
