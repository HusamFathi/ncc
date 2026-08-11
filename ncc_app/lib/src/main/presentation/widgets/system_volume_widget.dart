import 'dart:async';

import 'package:flutter/material.dart';
import 'package:volume_controller/volume_controller.dart';

import '../../../../core/locale/app_localizations_helper.dart';

class SystemVolumeWidget extends StatefulWidget {
  const SystemVolumeWidget({super.key});

  @override
  State<SystemVolumeWidget> createState() => _SystemVolumeWidgetState();
}

class _SystemVolumeWidgetState extends State<SystemVolumeWidget> {
  final StreamController<double> _volumeStreamController =
      StreamController<double>.broadcast();

  Timer? _hideTimer;

  bool _isVisible = false;
  double initialData = 1;
  @override
  void initState() {
    super.initState();
    _start();
  }

  Future<void> _start() async {
    final double volume = await VolumeController.instance.getVolume();
    setState(() {
      initialData = volume;
    });
    if (volume == 0) {
      setState(() {
        _isVisible = true;
      });

      _volumeStreamController.add(volume);
    }

    VolumeController.instance.addListener(
      _onVolumeChanged,
      fetchInitialVolume: false,
    );
  }

  void _onVolumeChanged(double volume) {
    _volumeStreamController.add(volume);

    setState(() {
      _isVisible = true;
    });

    // Reset the timer every time the volume changes.
    _hideTimer?.cancel();

    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        if (volume != 0) {
          _isVisible = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();

    VolumeController.instance.removeListener();

    _volumeStreamController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: !_isVisible
          ? const SizedBox.shrink()
          : StreamBuilder(
              stream: _volumeStreamController.stream,
              initialData: initialData,
              builder: (context, asyncSnapshot) {
                if (!asyncSnapshot.hasData) {
                  return const SizedBox.shrink();
                }

                final double volume = asyncSnapshot.data!.toDouble();

                if (volume == 0) {
                  return ListTile(
                    title: Text(Tr.of(context).lowVolumeWarningMessage),
                    leading: const Icon(Icons.volume_mute, color: Colors.red),
                  );
                }

                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: volume),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  builder: (context, animatedVolume, child) {
                    return LinearProgressIndicator(value: animatedVolume);
                  },
                );
              },
            ),
    );
  }
}
