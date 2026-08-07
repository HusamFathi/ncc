import 'package:flutter/material.dart';

import '../app_logo_widget.dart';

class DrawerNavigatorsWidget extends StatelessWidget {
  final void Function(int inex) goToIndex;
  const DrawerNavigatorsWidget({super.key, required this.goToIndex});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: AppLogoWidget(onTap: () => goToIndex(0)),
          ),
          // ListTile(
          //   title: Text(Tr.of(context).main.capitalizeFirstLetter()),
          //   onTap: () => goToIndex(0),
          // ),
          // ListTile(
          //   title: Text(Tr.of(context).ourPartners.capitalizeFirstLetter()),
          //   onTap: () => goToIndex(1),
          // ),
          // ListTile(
          //   title: Text(Tr.of(context).features.capitalizeFirstLetter()),
          //   onTap: () => goToIndex(2),
          // ),
          // ListTile(
          //   title: Text(Tr.of(context).faqTitle.capitalizeFirstLetter()),
          //   onTap: () => goToIndex(4),
          // ),
        ],
      ),
    );
  }
}
