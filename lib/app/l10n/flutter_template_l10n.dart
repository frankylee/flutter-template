import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'flutter_template_l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of FlutterTemplateL10n
/// returned by `FlutterTemplateL10n.of(context)`.
///
/// Applications need to include `FlutterTemplateL10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/flutter_template_l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FlutterTemplateL10n.localizationsDelegates,
///   supportedLocales: FlutterTemplateL10n.supportedLocales,
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
/// be consistent with the languages listed in the FlutterTemplateL10n.supportedLocales
/// property.
abstract class FlutterTemplateL10n {
  FlutterTemplateL10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FlutterTemplateL10n? of(BuildContext context) {
    return Localizations.of<FlutterTemplateL10n>(context, FlutterTemplateL10n);
  }

  static const LocalizationsDelegate<FlutterTemplateL10n> delegate = _FlutterTemplateL10nDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Demo Home Page'**
  String get appTitle;

  /// No description provided for @uhOhSomethingIsWrong.
  ///
  /// In en, this message translates to:
  /// **'Uh oh! Something went wrong. Please try again.'**
  String get uhOhSomethingIsWrong;
}

class _FlutterTemplateL10nDelegate extends LocalizationsDelegate<FlutterTemplateL10n> {
  const _FlutterTemplateL10nDelegate();

  @override
  Future<FlutterTemplateL10n> load(Locale locale) {
    return SynchronousFuture<FlutterTemplateL10n>(lookupFlutterTemplateL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_FlutterTemplateL10nDelegate old) => false;
}

FlutterTemplateL10n lookupFlutterTemplateL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return FlutterTemplateL10nEn();
  }

  throw FlutterError(
    'FlutterTemplateL10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
