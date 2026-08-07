import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/string.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../../../radio/presentation/widgets/radio_stream_controller_widget.dart';

class MainShellPage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainShellPage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: RadioStreamControllerWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: Tr.of(context).home.toTitle(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu),
            label: Tr.of(context).menu.toTitle(),
          ),
        ],
      ),
    );
  }
}
