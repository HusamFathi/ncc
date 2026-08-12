import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/locale/app_localizations_helper.dart';

class ShareAppPage extends StatelessWidget {
  const ShareAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Tr.of(context).shareAppMessage),
      ),
      body: Container(
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
        child: Image.asset('assets/images/share-link-qr.png'),
      ),
      bottomNavigationBar: ListTile(
        leading: Icon(Icons.share),
        title: Text(Tr.of(context).shareWithMessage),
        onTap: () async {
          await SharePlus.instance.share(ShareParams(text: Tr.of(context).shareAppLinkMessage("https://ncc-landing-xi.vercel.app/")));
        },
      ),
    );
  }
}
