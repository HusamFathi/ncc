// import 'package:flutter/material.dart';

// import '../../../../../../core/locale/app_localizations_helper.dart';
// import '../../extensions/string.dart';
// import '../../utils/url_launcher.dart';

// class PoweredByWidget extends StatelessWidget {
//   const PoweredByWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const String url = 'https://www.atheerio.com/';

//     return TextButton(
//       onPressed: () async {
//         UrlLauncher.openLink(link: url);
//       },
//       // leading: Image.asset('images/atheerio.png', height: 25, width: 25),
//       child: Text(
//         Tr.of(context).poweredByAtheerio.toTitle(),
//         style: TextStyle(
//           decoration: TextDecoration.underline,
//           color: Theme.of(context).textTheme.bodyMedium!.color!,
//           fontSize: 13,
//           // fontStyle: FontStyle.italic,
//         ),
//       ),
//     );
//   }
// }
