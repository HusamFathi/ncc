// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'منصة الأمة';

  @override
  String get appNameShort => 'منصة الأمة';

  @override
  String get emptyHistoryRoutes => 'لا توجد سجلات للمسارات';

  @override
  String get badRequestException => 'الطلب غير صالح';

  @override
  String get netWorkConnectionErrorMessage => 'فشل الاتصال بالشبكة';

  @override
  String get sessionExpiredFailureMessage =>
      'انتهت الجلسة. يُرجى تسجيل الدخول مرة أخرى.';

  @override
  String get forbiddenFailureMessage =>
      'ليس لديك صلاحية للوصول إلى هذا المورد.';

  @override
  String get cacheFailure => 'فشلت عملية التخزين المؤقت';

  @override
  String get metaAuthErrorMessage => 'فشلت عملية المصادقة';

  @override
  String get lowVolumeWarningMessage =>
      'الصوت مكتوم. يُرجى رفع مستوى الصوت لسماع المحتوى.';

  @override
  String get unKnownErrorMessage => 'حدث خطأ غير متوقع.';

  @override
  String get unableToLoadLocalData => 'تعذر تحميل البيانات المحلية';

  @override
  String get internetConnectionRestoredMessage =>
      'تم استعادة الاتصال بالإنترنت.';

  @override
  String get noInternetConnectionMessage =>
      'لا يوجد اتصال بالإنترنت. يُرجى التحقق من اتصالك.';

  @override
  String get syncWithSystem => 'مزامنة مع إعدادات النظام';

  @override
  String get aboutPlatform => 'عن المنصة';

  @override
  String get msfSlideTitle => 'بدعم من';

  @override
  String get msfSlideDescription => 'مؤسسة الخدمات الإعلامية بمجلس النواب';

  @override
  String get onboardingGoalsTitle => 'أهدافنا';

  @override
  String get onboardingGoalsDescription =>
      'إنتاج محتوى هادف، وتعزيز الشراكات الإعلامية، ونشر الوعي المجتمعي.';

  @override
  String get radioVolume => 'مستوى صوت الراديو';

  @override
  String get live => 'مباشر';

  @override
  String get ok => 'حسنًا';

  @override
  String get setUpRadioVolumeLevel => 'ضبط مستوى صوت الراديو';

  @override
  String get setUpRadioVolumeLevelMessage =>
      'يمكنك ضبط مستوى صوت الراديو دون التأثير على مستوى صوت جهازك.';

  @override
  String get onboardingVisionTitle => 'رؤيتنا';

  @override
  String get onboardingVisionDescription =>
      'أن نكون منصة إعلامية وطنية رائدة تعزز التواصل، وتنشر الوعي، وتخدم المجتمع الليبي.';

  @override
  String get onboardingMissionTitle => 'رسالتنا';

  @override
  String get onboardingMissionDescription =>
      'تقديم محتوى إعلامي موثوق يعزز الشفافية، ويدعم المؤسسات، ويخدم الصالح العام.';

  @override
  String get light => 'الوضع الفاتح';

  @override
  String get onboardingNotionRadioTitle => 'راديو الأمة';

  @override
  String get onboardingNotionRadioDescription =>
      'منصة إذاعية تقدم الأخبار والبرامج الحوارية والمحتوى الهادف، لتبقيك على تواصل مع مجتمعك.';

  @override
  String get onboardingHeritageRadioTitle => 'راديو الأمة للتراث';

  @override
  String get onboardingHeritageRadioDescription =>
      'اكتشف ثراء التراث الليبي من خلال برامج تحتفي بالهوية الوطنية وتحافظ على قصصه للأجيال القادمة.';

  @override
  String get dark => 'الوضع الداكن';

  @override
  String get hello => 'مرحبًا';

  @override
  String get onboardingWelcomeDescription =>
      'منصة إعلامية وطنية تقدم محتوى مهنيًا يعزز التواصل ويواكب تطلعات المجتمع الليبي.';

  @override
  String get tapToContinue => 'اضغط للمتابعة';

  @override
  String get notionRadioForHeritage => 'راديو الأمة للتراث';

  @override
  String get backgroundPlaybackTitle => 'الاستماع في الخلفية';

  @override
  String get notNow => 'ليس الآن';

  @override
  String get backgroundPlaybackDescription =>
      'اسمح بالإشعارات للتحكم في تشغيل الراديو أثناء استخدام تطبيقات أخرى أو عند قفل الجهاز.';

  @override
  String get kContinue => 'متابعة';

  @override
  String get play => 'تشغيل';

  @override
  String get next => 'التالي';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get close => 'إغلاق';

  @override
  String versionInfo(Object build, Object version) {
    return 'الإصدار $version+$build';
  }

  @override
  String get mobileApps => 'تطبيقات الهاتف';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String get notionRadio => 'راديو الأمة';

  @override
  String get notionRadioInfo =>
      'راديو الأمة هو إذاعة FM موحدة تبث على تردد 93.9 ميغاهرتز، وانطلق بثها من مدينة بنغازي في 1 يناير 2020، لتصل إلى جمهورها في معظم المدن الليبية. وتسعى الإذاعة إلى أن تكون صوتًا لليبيين، ومنبرًا يتيح لهم التعبير عن آرائهم بحرية واستقلالية، ومشاركة إبداعاتهم في مجالات المعرفة والثقافة والأدب.\n\nوانطلاقًا من اهتمام مؤسسة الخدمات الإعلامية بمجلس النواب بالتواصل مع جمهورها ودعم الإبداع الإعلامي، جاءت انطلاقة راديو الأمة تجسيدًا لرؤيتها في بناء جسور التواصل بين المبدعين والمجتمع، وإتاحة مساحة تجمع المعرفة والثقافة والكلمة الهادفة.';

  @override
  String errorCode(Object code) {
    return 'رمز الخطأ: $code';
  }

  @override
  String get channelRadioName => 'راديو الأمة للتراث';

  @override
  String get channelRadioDescription =>
      'قناة إشعارات راديو الأمة للتراث، المخصصة لإحياء التراث الثقافي الليبي وتعزيز الهوية الوطنية من خلال برامج متخصصة وتحديثات صوتية مهمة.';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get menu => 'القائمة';

  @override
  String get home => 'الرئيسية';

  @override
  String get notionRadioSlogan => 'راديو الأمة... نبض الأمة';

  @override
  String get notionRadioForHeritageSlogan => 'صدى الماضي... ونبض الحاضر';

  @override
  String get notionRadioForHeritageInfo =>
      'راديو الأمة للتراث هو مبادرة إذاعية ثقافية تهدف إلى الحفاظ على التراث الليبي وتعزيز الهوية الوطنية من خلال برامج تتناول التاريخ الوطني، والفنون التقليدية، والعادات والتقاليد في مختلف مناطق ليبيا. ويديره مركز الأمة للتواصل، ويسهم في ربط الأجيال بتراثها وتعزيز الوعي بالموروث الثقافي الليبي.\n\nيتوفر راديو الأمة للتراث عبر منصات متعددة:\n• البث المباشر عبر الموقع الرسمي\n• تطبيق الهاتف المحمول لنظام أندرويد\n• منصات التواصل الاجتماعي، بما في ذلك فيسبوك ويوتيوب';

  @override
  String get appSlogan =>
      'المنصة الإعلامية الرسمية لمؤسسة الخدمات الإعلامية بمجلس النواب، تقدم محتوى إعلاميًا مهنيًا يعزز التواصل المؤسسي، ويواكب تطلعات المجتمع الليبي، ويعكس رسالتها الإعلامية بمهنية وشفافية.';

  @override
  String get ourVision => 'الرؤية الاستراتيجية';

  @override
  String get ourMessage => 'الرسالة الأساسية';

  @override
  String get ourGoals => 'الأهداف الاستراتيجية';

  @override
  String get settings => 'الإعدادات';

  @override
  String get nccVision =>
      'أن نكون المؤسسة الرائدة في ليبيا في مجال التواصل المؤسسي والإعلام والتوعية المجتمعية.';

  @override
  String get nccMessage =>
      'تقديم إعلام موثوق يعزز الشفافية والوحدة الوطنية، ويدعم التواصل المؤسسي الفعال.';

  @override
  String get nccGoals =>
      '• تطوير محتوى إعلامي يخدم الصالح العام\n• دعم التنمية الوطنية من خلال التواصل الاستراتيجي\n• تعزيز التعاون الإعلامي بين الجهات الحكومية ومؤسسات المجتمع المدني';

  @override
  String get msfhor => 'مؤسسة الخدمات الإعلامية بمجلس النواب';

  @override
  String autobotsCopyRights(Object appName, Object year) {
    return '© $appName $year - جميع الحقوق محفوظة';
  }

  @override
  String powerBy(Object orgName) {
    return 'مقدّم من: $orgName';
  }

  @override
  String get madeInMessage => 'صُنع في بنغازي';
}
