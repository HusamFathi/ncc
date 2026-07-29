// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../../../core/locale/app_localizations_helper.dart';

// import '../config/routes/routes_config.dart';
// import '../extensions/string.dart';
// import '../services/credentials/credentials_service.dart';
// import '../utils/constants.dart';
// import 'loading_dialog.dart';

// Future<void> showSessionExpiredMessageDialog(BuildContext context) {
//   return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return const PopScope(
//           canPop: false,
//           child: SessionExpiredMessageDialog(),
//         );
//       });
// }

// class SessionExpiredMessageDialog extends StatelessWidget {
//   const SessionExpiredMessageDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(
//         AL.of(context).yourLogInSessionExpired.capitalizeFirstLetter(),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Gap(kMediumGap),
//           Text(
//             AL.of(context).sessionExpiredFailureMessage,
//           ),
//           const Gap(kMediumGap),
//         ],
//       ),
//       actions: [
//         FilledButton(
//           onPressed: () {
//             showLoadingDialog(context);
//             CredentialsService.instance.signOut().then((value) {
//               context.goNamed(
//                 RoutesConfig.sigInRoute.name,
//               );
//             });
//             Navigator.pop(context);
//           },
//           child: Text(
//             AL.of(context).signIn.toTitle(),
//           ),
//         )
//       ],
//     );
//   }
// }
