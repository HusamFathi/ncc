import 'package:flutter/material.dart';

import '../../../../../core/src/entities/language.dart';
import '../../../../core/extensions/string.dart';
import '../../../../core/locale/app_localizations_helper.dart';

enum LanguageChangerStyle { listTile, popupMenu }

class LanguageChangerWidget extends StatelessWidget {
  final Language currentLanguageCode;
  final List<Language> supportedLanguages;
  final Function(Language) onLanguageChanged;
  final LanguageChangerStyle style;
  const LanguageChangerWidget({
    super.key,
    required this.currentLanguageCode,
    required this.supportedLanguages,
    this.style = LanguageChangerStyle.popupMenu,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (style == LanguageChangerStyle.listTile) {
      return ListTile(
        leading: const Icon(Icons.language),
        title: Text(currentLanguageCode.getLanguageNativeName()),
        subtitle: Text(Tr.of(context).selectLanguage.toTitle()),
        onTap: () {
          // Show language selection dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(Tr.of(context).selectLanguage.toTitle()),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: supportedLanguages.map((language) {
                      return ListTile(
                        title: Text(language.getLanguageNativeName()),
                        onTap: () {
                          Navigator.of(context).pop();
                          onLanguageChanged(language);
                        },
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          );
        },
      );
    }
    return PopupMenuButton<Language>(
      icon: const Icon(Icons.language),
      itemBuilder: (context) {
        return supportedLanguages.map((language) {
          return PopupMenuItem<Language>(
            value: language,
            child: Text(language.getLanguageNativeName()),
          );
        }).toList();
      },
      onSelected: (language) {
        onLanguageChanged(language);
      },
    );
  }
}
