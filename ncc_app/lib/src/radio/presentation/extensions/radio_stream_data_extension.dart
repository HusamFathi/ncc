import 'package:flutter/material.dart';

import '../../../../core/extensions/string.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/radio_stream_data.dart';

extension RadioStreamDataExtension on RadioStreamData {
  String getLocalizedName(BuildContext context) {
    return _localizedValue(context, name,'Loading.....').toTitle();
  }

  String getLocalizedSubtitle(BuildContext context) {
    return _localizedValue(context, subtitle,'Loading..................').capitalizeFirstLetter();
  }

  String getLocalizedDescription(BuildContext context) {
    return _localizedValue(context, description,'Loading ................................').capitalizeFirstLetter();
  }

  

  String _localizedValue(BuildContext context, String key,String defaultString) {
    final AppLocalizations tr = Tr.of(context);

    switch (key) {
      case 'notionRadioForHeritage':
        return tr.notionRadioForHeritage;
      case 'notionRadioForHeritageSlogan':
        return tr.notionRadioForHeritageSlogan;
      case 'notionRadioForHeritageInfo':
        return tr.notionRadioForHeritageInfo;
      case 'notionRadio':
        return tr.notionRadio;
      case 'notionRadioSlogan':
        return tr.notionRadioSlogan;
      case 'notionRadioInfo':
        return tr.notionRadioInfo;
      default:
        return defaultString;
    }
  }
}
