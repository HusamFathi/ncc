import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<bool> urlLauncher(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
      return true;
    } else {
      log('Could not launch $url');
      return false;
    }
  }
}
