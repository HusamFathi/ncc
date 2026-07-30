import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'nation communication center'**
  String get appName;

  /// No description provided for @appNameShort.
  ///
  /// In en, this message translates to:
  /// **'nation center'**
  String get appNameShort;

  /// No description provided for @emptyHistoryRoutes.
  ///
  /// In en, this message translates to:
  /// **'no route history available'**
  String get emptyHistoryRoutes;

  /// No description provided for @badRequestException.
  ///
  /// In en, this message translates to:
  /// **'invalid request format'**
  String get badRequestException;

  /// No description provided for @netWorkConnectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'network connection failed'**
  String get netWorkConnectionErrorMessage;

  /// No description provided for @sessionExpiredFailureMessage.
  ///
  /// In en, this message translates to:
  /// **'session expired - please login again'**
  String get sessionExpiredFailureMessage;

  /// No description provided for @forbiddenFailureMessage.
  ///
  /// In en, this message translates to:
  /// **'unauthorized access'**
  String get forbiddenFailureMessage;

  /// No description provided for @cacheFailure.
  ///
  /// In en, this message translates to:
  /// **'cache operation failed'**
  String get cacheFailure;

  /// No description provided for @metaAuthErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'authentication failed'**
  String get metaAuthErrorMessage;

  /// No description provided for @unKnownErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'unexpected error occurred'**
  String get unKnownErrorMessage;

  /// No description provided for @unableToLoadLocalData.
  ///
  /// In en, this message translates to:
  /// **'failed to load local data'**
  String get unableToLoadLocalData;

  /// No description provided for @syncWithSystem.
  ///
  /// In en, this message translates to:
  /// **'sync with system settings'**
  String get syncWithSystem;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'light mode'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'dark mode'**
  String get dark;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'hello'**
  String get hello;

  /// No description provided for @tabtocontinue.
  ///
  /// In en, this message translates to:
  /// **'Tab To Continue'**
  String get tabtocontinue;

  /// No description provided for @notionRadioForHeritage.
  ///
  /// In en, this message translates to:
  /// **'nation heritage radio'**
  String get notionRadioForHeritage;

  /// No description provided for @backgroundPlaybackTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep Listening in the Background'**
  String get backgroundPlaybackTitle;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get notNow;

  /// No description provided for @backgroundPlaybackDescription.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications so our app can keep your radio playing while you use other apps or lock your device. Playback controls will also appear in your notification panel.'**
  String get backgroundPlaybackDescription;

  /// No description provided for @kContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get kContinue;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'play'**
  String get play;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'next'**
  String get next;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'pause'**
  String get pause;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get close;

  /// No description provided for @versionInfo.
  ///
  /// In en, this message translates to:
  /// **'version {version}+{build}'**
  String versionInfo(Object build, Object version);

  /// No description provided for @mobileApps.
  ///
  /// In en, this message translates to:
  /// **'mobile apps'**
  String get mobileApps;

  /// No description provided for @commingSoon.
  ///
  /// In en, this message translates to:
  /// **'coming soon'**
  String get commingSoon;

  /// No description provided for @notionRadio.
  ///
  /// In en, this message translates to:
  /// **'notion radio'**
  String get notionRadio;

  /// No description provided for @notionRadioInfo.
  ///
  /// In en, this message translates to:
  /// **'radio Al-Umma is the first unified shortwave radio (93.9 FM) and its broadcast was launched in the city of Benghazi on 1/1/2020, in most Libyan cities to be the voice of Libyans who find in it spaces to express their opinions with complete freedom and independence, and to scatter fragments of their creativity in the spaces of knowledge and literature, where the free, unique and purposeful word is. And as the Media Services Institution of the House of Representatives has always been with its audience on the path of creativity, the launch of Radio Al-Umma is an embodiment of its goals to create bridges of communication and love between creators who were separated by the hand of fate here and there, so that they may find in the gardens of Radio Al-Umma, adorned with their presence, a pleasure and delight from the harvest of knowledge and the delicate pulse.'**
  String get notionRadioInfo;

  /// No description provided for @errorCode.
  ///
  /// In en, this message translates to:
  /// **'error code {code}!'**
  String errorCode(Object code);

  /// No description provided for @channelRadioName.
  ///
  /// In en, this message translates to:
  /// **'Omma Radio Heritage'**
  String get channelRadioName;

  /// No description provided for @channelRadioDescription.
  ///
  /// In en, this message translates to:
  /// **'Notification channel for Omma Radio Heritage - a station to revive Libyan cultural heritage and strengthen national identity with specialized programs and important audio updates.'**
  String get channelRadioDescription;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'select language'**
  String get selectLanguage;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'menu'**
  String get menu;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get home;

  /// No description provided for @notionRadioSlogaan.
  ///
  /// In en, this message translates to:
  /// **'notion radio... the pulse of the nation'**
  String get notionRadioSlogaan;

  /// No description provided for @notionRadioForHeritageSlogan.
  ///
  /// In en, this message translates to:
  /// **'echoing the past... resonating with the present'**
  String get notionRadioForHeritageSlogan;

  /// No description provided for @notionRadioForHeritageInfo.
  ///
  /// In en, this message translates to:
  /// **'nation heritage radio is a cultural broadcasting initiative dedicated to preserving Libyan heritage through programs exploring national history, traditional arts, and regional customs. operated by the nation communication center, it bridges generations by promoting awareness of Libya\'s rich cultural legacy. \n\navailable on multiple platforms:\n• live streaming via official website\n• Android mobile app\n• social media platforms (Facebook/YouTube)'**
  String get notionRadioForHeritageInfo;

  /// No description provided for @appSlogan.
  ///
  /// In en, this message translates to:
  /// **'official media platform of the parliamentary media services foundation - delivering professional content that aligns with national aspirations while maintaining institutional transparency.'**
  String get appSlogan;

  /// No description provided for @ourVision.
  ///
  /// In en, this message translates to:
  /// **'strategic vision'**
  String get ourVision;

  /// No description provided for @ourMessage.
  ///
  /// In en, this message translates to:
  /// **'core mission'**
  String get ourMessage;

  /// No description provided for @ourGoals.
  ///
  /// In en, this message translates to:
  /// **'strategic objectives'**
  String get ourGoals;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'settings'**
  String get settings;

  /// No description provided for @nccVision.
  ///
  /// In en, this message translates to:
  /// **'to become Libya\'s premier institution for governmental communication and public awareness'**
  String get nccVision;

  /// No description provided for @nccMessage.
  ///
  /// In en, this message translates to:
  /// **'delivering trusted media that fosters transparency, national unity, and institutional governance'**
  String get nccMessage;

  /// No description provided for @nccGoals.
  ///
  /// In en, this message translates to:
  /// **'• development of public-service media content\n• support for national development through strategic communication\n• fostering media collaboration between government and civil entities'**
  String get nccGoals;

  /// No description provided for @msfhor.
  ///
  /// In en, this message translates to:
  /// **'parliamentary media services foundation'**
  String get msfhor;

  /// No description provided for @autobotsCopyRights.
  ///
  /// In en, this message translates to:
  /// **'© {appName} {year} - all rights reserved'**
  String autobotsCopyRights(Object appName, Object year);

  /// No description provided for @powerBy.
  ///
  /// In en, this message translates to:
  /// **'provided by : {orgName}'**
  String powerBy(Object orgName);

  /// No description provided for @madeInMessage.
  ///
  /// In en, this message translates to:
  /// **'made in benghazi'**
  String get madeInMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
