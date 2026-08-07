// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'The Nation\'s Platform';

  @override
  String get appNameShort => 'The Nation\'s Platform';

  @override
  String get emptyHistoryRoutes => 'no route history available';

  @override
  String get badRequestException => 'invalid request format';

  @override
  String get netWorkConnectionErrorMessage => 'network connection failed';

  @override
  String get sessionExpiredFailureMessage =>
      'session expired - please login again';

  @override
  String get forbiddenFailureMessage => 'unauthorized access';

  @override
  String get cacheFailure => 'cache operation failed';

  @override
  String get metaAuthErrorMessage => 'authentication failed';

  @override
  String get unKnownErrorMessage => 'unexpected error occurred';

  @override
  String get unableToLoadLocalData => 'failed to load local data';

  @override
  String get syncWithSystem => 'sync with system settings';

  @override
  String get msfSlideTitle => 'Powered by';

  @override
  String get onboardingGoalsTitle => 'Our Goals';

  @override
  String get onboardingGoalsDescription =>
      'Create meaningful content, strengthen media partnerships, and promote community awareness.';

  @override
  String get onboardingVisionTitle => 'Our Vision';

  @override
  String get onboardingVisionDescription =>
      'To be a leading national media platform that strengthens communication, promotes awareness, and serves the Libyan community.';

  @override
  String get onboardingMissionTitle => 'Our Mission';

  @override
  String get onboardingMissionDescription =>
      'Deliver trusted media that promotes transparency, supports institutions, and serves the public interest.';

  @override
  String get light => 'light mode';

  @override
  String get msfSlideDescription =>
      'Media Services Foundation of the Libyan House of Representatives';

  @override
  String get onboardingNotionRadioTitle => 'Notion Radio';

  @override
  String get onboardingNotionRadioDescription =>
      'A radio platform delivering news, talk shows, and meaningful programs to keep you connected with your community.';

  @override
  String get onboardingHeritageRadioTitle => 'Al-Ummah Heritage Radio';

  @override
  String get onboardingHeritageRadioDescription =>
      'Discover Libya\'s rich heritage through programs that celebrate national identity and preserve stories for future generations.';

  @override
  String get dark => 'dark mode';

  @override
  String get hello => 'hello';

  @override
  String get onboardingWelcomeDescription =>
      'A national media platform delivering professional content that strengthens communication and reflects the aspirations of the Libyan community.';

  @override
  String get tabtocontinue => 'Tab To Continue';

  @override
  String get notionRadioForHeritage => 'nation heritage radio';

  @override
  String get backgroundPlaybackTitle => 'Keep Listening in the Background';

  @override
  String get notNow => 'Not Now';

  @override
  String get backgroundPlaybackDescription =>
      'Allow notifications so our app can keep your radio playing while you use other apps or lock your device. Playback controls will also appear in your notification panel.';

  @override
  String get kContinue => 'Continue';

  @override
  String get play => 'play';

  @override
  String get next => 'next';

  @override
  String get pause => 'pause';

  @override
  String get close => 'close';

  @override
  String versionInfo(Object build, Object version) {
    return 'version $version+$build';
  }

  @override
  String get mobileApps => 'mobile apps';

  @override
  String get commingSoon => 'coming soon';

  @override
  String get notionRadio => 'notion radio';

  @override
  String get notionRadioInfo =>
      'radio Al-Umma is the first unified shortwave radio (93.9 FM) and its broadcast was launched in the city of Benghazi on 1/1/2020, in most Libyan cities to be the voice of Libyans who find in it spaces to express their opinions with complete freedom and independence, and to scatter fragments of their creativity in the spaces of knowledge and literature, where the free, unique and purposeful word is. And as the Media Services Institution of the House of Representatives has always been with its audience on the path of creativity, the launch of Radio Al-Umma is an embodiment of its goals to create bridges of communication and love between creators who were separated by the hand of fate here and there, so that they may find in the gardens of Radio Al-Umma, adorned with their presence, a pleasure and delight from the harvest of knowledge and the delicate pulse.';

  @override
  String errorCode(Object code) {
    return 'error code $code!';
  }

  @override
  String get channelRadioName => 'Omma Radio Heritage';

  @override
  String get channelRadioDescription =>
      'Notification channel for Omma Radio Heritage - a station to revive Libyan cultural heritage and strengthen national identity with specialized programs and important audio updates.';

  @override
  String get retry => 'retry';

  @override
  String get cancel => 'cancel';

  @override
  String get selectLanguage => 'select language';

  @override
  String get menu => 'menu';

  @override
  String get home => 'home';

  @override
  String get notionRadioSlogaan => 'notion radio... the pulse of the nation';

  @override
  String get notionRadioForHeritageSlogan =>
      'echoing the past... resonating with the present';

  @override
  String get notionRadioForHeritageInfo =>
      'nation heritage radio is a cultural broadcasting initiative dedicated to preserving Libyan heritage through programs exploring national history, traditional arts, and regional customs. operated by the nation communication center, it bridges generations by promoting awareness of Libya\'s rich cultural legacy. \n\navailable on multiple platforms:\n• live streaming via official website\n• Android mobile app\n• social media platforms (Facebook/YouTube)';

  @override
  String get appSlogan =>
      'official media platform of the parliamentary media services foundation - delivering professional content that aligns with national aspirations while maintaining institutional transparency.';

  @override
  String get ourVision => 'strategic vision';

  @override
  String get ourMessage => 'core mission';

  @override
  String get ourGoals => 'strategic objectives';

  @override
  String get settings => 'settings';

  @override
  String get nccVision =>
      'to become Libya\'s premier institution for governmental communication and public awareness';

  @override
  String get nccMessage =>
      'delivering trusted media that fosters transparency, national unity, and institutional governance';

  @override
  String get nccGoals =>
      '• development of public-service media content\n• support for national development through strategic communication\n• fostering media collaboration between government and civil entities';

  @override
  String get msfhor => 'parliamentary media services foundation';

  @override
  String autobotsCopyRights(Object appName, Object year) {
    return '© $appName $year - all rights reserved';
  }

  @override
  String powerBy(Object orgName) {
    return 'provided by : $orgName';
  }

  @override
  String get madeInMessage => 'made in benghazi';
}
