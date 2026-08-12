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
  /// **'The Nation\'s Platform'**
  String get appName;

  /// No description provided for @appNameShort.
  ///
  /// In en, this message translates to:
  /// **'The Nation\'s Platform'**
  String get appNameShort;

  /// No description provided for @emptyHistoryRoutes.
  ///
  /// In en, this message translates to:
  /// **'No route history available'**
  String get emptyHistoryRoutes;

  /// No description provided for @badRequestException.
  ///
  /// In en, this message translates to:
  /// **'Invalid request'**
  String get badRequestException;

  /// No description provided for @netWorkConnectionErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Network connection failed'**
  String get netWorkConnectionErrorMessage;

  /// No description provided for @sessionExpiredFailureMessage.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please log in again.'**
  String get sessionExpiredFailureMessage;

  /// No description provided for @forbiddenFailureMessage.
  ///
  /// In en, this message translates to:
  /// **'You are not authorized to access this resource.'**
  String get forbiddenFailureMessage;

  /// No description provided for @cacheFailure.
  ///
  /// In en, this message translates to:
  /// **'Cache operation failed'**
  String get cacheFailure;

  /// No description provided for @metaAuthErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed'**
  String get metaAuthErrorMessage;

  /// No description provided for @lowVolumeWarningMessage.
  ///
  /// In en, this message translates to:
  /// **'Your volume is muted. Please turn it up.'**
  String get lowVolumeWarningMessage;

  /// No description provided for @unKnownErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get unKnownErrorMessage;

  /// No description provided for @unableToLoadLocalData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load local data'**
  String get unableToLoadLocalData;

  /// No description provided for @internetConnectionRestoredMessage.
  ///
  /// In en, this message translates to:
  /// **'Internet connection restored.'**
  String get internetConnectionRestoredMessage;

  /// No description provided for @noInternetConnectionMessage.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your connection.'**
  String get noInternetConnectionMessage;

  /// No description provided for @moreRadioChannelsComing.
  ///
  /// In en, this message translates to:
  /// **'More radio channels will be available soon.'**
  String get moreRadioChannelsComing;

  /// No description provided for @shareAppMessage.
  ///
  /// In en, this message translates to:
  /// **'Share The App'**
  String get shareAppMessage;

  /// No description provided for @syncWithSystem.
  ///
  /// In en, this message translates to:
  /// **'Sync with system settings'**
  String get syncWithSystem;

  /// No description provided for @aboutPlatform.
  ///
  /// In en, this message translates to:
  /// **'About the Platform'**
  String get aboutPlatform;

  /// No description provided for @msfSlideTitle.
  ///
  /// In en, this message translates to:
  /// **'Powered by'**
  String get msfSlideTitle;

  /// No description provided for @msfSlideDescription.
  ///
  /// In en, this message translates to:
  /// **'Media Services Foundation of the House of Representatives'**
  String get msfSlideDescription;

  /// No description provided for @onboardingGoalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Goals'**
  String get onboardingGoalsTitle;

  /// No description provided for @onboardingGoalsDescription.
  ///
  /// In en, this message translates to:
  /// **'Create meaningful content, strengthen media partnerships, and promote community awareness.'**
  String get onboardingGoalsDescription;

  /// No description provided for @radioVolume.
  ///
  /// In en, this message translates to:
  /// **'Radio Volume'**
  String get radioVolume;

  /// No description provided for @live.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get live;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @setUpRadioVolumeLevel.
  ///
  /// In en, this message translates to:
  /// **'Set Radio Volume'**
  String get setUpRadioVolumeLevel;

  /// No description provided for @setUpRadioVolumeLevelMessage.
  ///
  /// In en, this message translates to:
  /// **'Adjust the radio volume without changing your device\'s system volume.'**
  String get setUpRadioVolumeLevelMessage;

  /// No description provided for @onboardingVisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get onboardingVisionTitle;

  /// No description provided for @onboardingVisionDescription.
  ///
  /// In en, this message translates to:
  /// **'To become a leading national media platform that strengthens communication, promotes awareness, and serves the Libyan community.'**
  String get onboardingVisionDescription;

  /// No description provided for @onboardingMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get onboardingMissionTitle;

  /// No description provided for @onboardingMissionDescription.
  ///
  /// In en, this message translates to:
  /// **'Deliver trusted media that promotes transparency, supports institutions, and serves the public interest.'**
  String get onboardingMissionDescription;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get light;

  /// No description provided for @onboardingNotionRadioTitle.
  ///
  /// In en, this message translates to:
  /// **'Nation Radio'**
  String get onboardingNotionRadioTitle;

  /// No description provided for @onboardingNotionRadioDescription.
  ///
  /// In en, this message translates to:
  /// **'A radio platform delivering news, talk shows, and engaging programs that keep you connected with your community.'**
  String get onboardingNotionRadioDescription;

  /// No description provided for @onboardingHeritageRadioTitle.
  ///
  /// In en, this message translates to:
  /// **'Al-Umma Heritage Radio'**
  String get onboardingHeritageRadioTitle;

  /// No description provided for @onboardingHeritageRadioDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover Libya\'s rich heritage through programs that celebrate national identity and preserve its stories for future generations.'**
  String get onboardingHeritageRadioDescription;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get dark;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @onboardingWelcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'A national media platform delivering professional content that strengthens communication and reflects the aspirations of the Libyan community.'**
  String get onboardingWelcomeDescription;

  /// No description provided for @tapToContinue.
  ///
  /// In en, this message translates to:
  /// **'Tap to continue'**
  String get tapToContinue;

  /// No description provided for @notionRadioForHeritage.
  ///
  /// In en, this message translates to:
  /// **'Al-Umma Heritage Radio'**
  String get notionRadioForHeritage;

  /// No description provided for @backgroundPlaybackTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep Listening in the Background'**
  String get backgroundPlaybackTitle;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get notNow;

  /// No description provided for @backgroundPlaybackDescription.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications to control radio playback while using other apps or when your device is locked.'**
  String get backgroundPlaybackDescription;

  /// No description provided for @kContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get kContinue;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @versionInfo.
  ///
  /// In en, this message translates to:
  /// **'Version {version}+{build}'**
  String versionInfo(Object build, Object version);

  /// No description provided for @mobileApps.
  ///
  /// In en, this message translates to:
  /// **'Mobile apps'**
  String get mobileApps;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @notionRadio.
  ///
  /// In en, this message translates to:
  /// **'Nation Radio'**
  String get notionRadio;

  /// No description provided for @notionRadioInfo.
  ///
  /// In en, this message translates to:
  /// **'Al-Umma Radio is a unified FM radio station broadcasting on 93.9 FM. Its broadcast was launched in Benghazi on January 1, 2020, reaching audiences across most Libyan cities. The station provides a platform for Libyans to freely express their opinions, share their creativity, and engage with knowledge, culture, and literature.\n\nAs the Media Services Foundation of the House of Representatives continues to connect with its audience through creative and meaningful media, the launch of Al-Umma Radio represents an extension of its mission to build bridges of communication between creators and communities across Libya.'**
  String get notionRadioInfo;

  /// No description provided for @errorCode.
  ///
  /// In en, this message translates to:
  /// **'Error code: {code}'**
  String errorCode(Object code);

  /// No description provided for @channelRadioName.
  ///
  /// In en, this message translates to:
  /// **'Al-Umma Heritage Radio'**
  String get channelRadioName;

  /// No description provided for @channelRadioDescription.
  ///
  /// In en, this message translates to:
  /// **'Notification channel for Al-Umma Heritage Radio, dedicated to preserving Libyan cultural heritage, strengthening national identity, and delivering specialized programs and important audio updates.'**
  String get channelRadioDescription;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @notionRadioSlogan.
  ///
  /// In en, this message translates to:
  /// **'Nation Radio... The Pulse of the Nation'**
  String get notionRadioSlogan;

  /// No description provided for @notionRadioForHeritageSlogan.
  ///
  /// In en, this message translates to:
  /// **'Echoing the past... Resonating with the present'**
  String get notionRadioForHeritageSlogan;

  /// No description provided for @notionRadioForHeritageInfo.
  ///
  /// In en, this message translates to:
  /// **'Al-Umma Heritage Radio is a cultural broadcasting initiative dedicated to preserving and celebrating Libya\'s heritage through programs exploring national history, traditional arts, and regional customs. Operated by the Nation Communication Center, it connects generations by promoting awareness of Libya\'s rich cultural legacy.\n\nAvailable on multiple platforms:\n• Live streaming via the official website\n• Android mobile app\n• Social media platforms, including Facebook and YouTube'**
  String get notionRadioForHeritageInfo;

  /// No description provided for @appSlogan.
  ///
  /// In en, this message translates to:
  /// **'The official media platform of the Parliamentary Media Services Foundation, delivering professional content that reflects national aspirations while upholding institutional transparency.'**
  String get appSlogan;

  /// No description provided for @ourVision.
  ///
  /// In en, this message translates to:
  /// **'Strategic Vision'**
  String get ourVision;

  /// No description provided for @ourMessage.
  ///
  /// In en, this message translates to:
  /// **'Core Mission'**
  String get ourMessage;

  /// No description provided for @ourGoals.
  ///
  /// In en, this message translates to:
  /// **'Strategic Objectives'**
  String get ourGoals;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @shareWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Share with more options....'**
  String get shareWithMessage;

  /// No description provided for @nccVision.
  ///
  /// In en, this message translates to:
  /// **'To become Libya\'s leading institution for governmental communication and public awareness'**
  String get nccVision;

  /// No description provided for @nccMessage.
  ///
  /// In en, this message translates to:
  /// **'Deliver trusted media that promotes transparency, national unity, and effective institutional communication'**
  String get nccMessage;

  /// No description provided for @nccGoals.
  ///
  /// In en, this message translates to:
  /// **'• Develop public-service media content\n• Support national development through strategic communication\n• Foster media collaboration between government and civil society'**
  String get nccGoals;

  /// No description provided for @msfhor.
  ///
  /// In en, this message translates to:
  /// **'Parliamentary Media Services Foundation'**
  String get msfhor;

  /// No description provided for @autobotsCopyRights.
  ///
  /// In en, this message translates to:
  /// **'© {appName} {year} - All rights reserved'**
  String autobotsCopyRights(Object appName, Object year);

  /// No description provided for @powerBy.
  ///
  /// In en, this message translates to:
  /// **'Provided by: {orgName}'**
  String powerBy(Object orgName);

  /// No description provided for @openFacebookPageMessage.
  ///
  /// In en, this message translates to:
  /// **'Stay connected with us and be part of our journey on Facebook.'**
  String get openFacebookPageMessage;

  /// No description provided for @shareAppLinkMessage.
  ///
  /// In en, this message translates to:
  /// **'Discover our app and stay connected with us! Download it here: {link}'**
  String shareAppLinkMessage(Object link);

  /// No description provided for @madeInMessage.
  ///
  /// In en, this message translates to:
  /// **'Made in Benghazi'**
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
