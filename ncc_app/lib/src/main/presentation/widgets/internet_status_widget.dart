import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../../../../core/locale/app_localizations_helper.dart';

import '../../../../core/injection/init_di.dart';

class InternetStatusWidget extends StatefulWidget {
  const InternetStatusWidget({super.key});

  @override
  State<InternetStatusWidget> createState() => _InternetStatusWidgetState();
}

class _InternetStatusWidgetState extends State<InternetStatusWidget> {
  InternetStatus? prevInternetStatus;
  late StreamSubscription<InternetStatus> subscription;
  bool _isVisible = false;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    subscription = InternetConnection().onStatusChange.listen((
      InternetStatus status,
    ) {
      if (status == InternetStatus.connected) {
        _hideTimer?.cancel();

        _hideTimer = Timer(const Duration(seconds: 3), () {
          setState(() {
            _isVisible = false;
          });
        });
      } else {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.3),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
     duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: !_isVisible
          ? SizedBox(key: ValueKey('hidden'))
          : SafeArea(
              child: StreamBuilder<InternetStatus>(
                key: const ValueKey('visible'),

                stream: sl<InternetConnection>().onStatusChange,
                initialData: InternetStatus.connected,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    InternetStatus status = asyncSnapshot.data!;
                    if (status == InternetStatus.disconnected) {
                      return Container(
                        color: Colors.red,
                        child: ListTile(
                          title: Text(
                            Tr.of(context).noInternetConnectionMessage,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.green,
                        child: ListTile(
                          title: Text(
                            Tr.of(context).internetConnectionRestoredMessage,
                          ),
                        ),
                      );
                    }
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
    );
  }
}
