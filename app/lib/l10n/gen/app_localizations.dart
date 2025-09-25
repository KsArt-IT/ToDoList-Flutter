import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
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
    Locale('en'),
    Locale('ru'),
    Locale('uk'),
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ToDo List'**
  String get appTitle;

  /// No description provided for @topic.
  ///
  /// In en, this message translates to:
  /// **'Topic:'**
  String get topic;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @auth.
  ///
  /// In en, this message translates to:
  /// **'Authorization'**
  String get auth;

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @emailInput.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get emailInput;

  /// No description provided for @passwordInput.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get passwordInput;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google account'**
  String get loginWithGoogle;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @passwordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get passwordConfirm;

  /// No description provided for @passwordsNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsNotMatch;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @emailNotExist.
  ///
  /// In en, this message translates to:
  /// **'A user with this email does not exist.'**
  String get emailNotExist;

  /// No description provided for @emailNotValid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format.'**
  String get emailNotValid;

  /// No description provided for @emailInputHelperText.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address email@example.com'**
  String get emailInputHelperText;

  /// No description provided for @passwordInputHelperText.
  ///
  /// In en, this message translates to:
  /// **'Enter a password longer than 8 characters, containing numbers, letters and special characters'**
  String get passwordInputHelperText;

  /// No description provided for @passwordNotValid.
  ///
  /// In en, this message translates to:
  /// **'Invalid password.'**
  String get passwordNotValid;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @resetPasswordPage.
  ///
  /// In en, this message translates to:
  /// **'Reset password page'**
  String get resetPasswordPage;

  /// No description provided for @resetPasswordSent.
  ///
  /// In en, this message translates to:
  /// **'A password reset request has been sent to your email!'**
  String get resetPasswordSent;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login successful'**
  String get loginSuccess;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful'**
  String get registrationSuccess;

  /// No description provided for @authCredentialsInvalid.
  ///
  /// In en, this message translates to:
  /// **'The provided authentication credentials are invalid or have expired.'**
  String get authCredentialsInvalid;

  /// No description provided for @userBlocked.
  ///
  /// In en, this message translates to:
  /// **'User account is blocked.'**
  String get userBlocked;

  /// No description provided for @emailInUse.
  ///
  /// In en, this message translates to:
  /// **'This email address is already in use.'**
  String get emailInUse;

  /// No description provided for @passwordWeak.
  ///
  /// In en, this message translates to:
  /// **'Password is too weak.'**
  String get passwordWeak;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network error occurred'**
  String get networkError;

  /// No description provided for @unexpectedStatus.
  ///
  /// In en, this message translates to:
  /// **'Unexpected status code'**
  String get unexpectedStatus;

  /// No description provided for @decodeError.
  ///
  /// In en, this message translates to:
  /// **'Decoding error'**
  String get decodeError;

  /// No description provided for @dbNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Database is not connected.'**
  String get dbNotConnected;

  /// No description provided for @invalidRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request.'**
  String get invalidRequest;

  /// No description provided for @invalidResponse.
  ///
  /// In en, this message translates to:
  /// **'Invalid response.'**
  String get invalidResponse;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @options.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get options;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'other'**
  String get genderOther;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get info;

  /// No description provided for @activeTasks.
  ///
  /// In en, this message translates to:
  /// **'Active tasks'**
  String get activeTasks;

  /// No description provided for @completedTasks.
  ///
  /// In en, this message translates to:
  /// **'Completed tasks'**
  String get completedTasks;

  /// No description provided for @createdTasks.
  ///
  /// In en, this message translates to:
  /// **'Created tasks'**
  String get createdTasks;

  /// No description provided for @deletedTasks.
  ///
  /// In en, this message translates to:
  /// **'Deleted tasks'**
  String get deletedTasks;

  /// No description provided for @addFirstTask.
  ///
  /// In en, this message translates to:
  /// **'Add your first task!'**
  String get addFirstTask;

  /// No description provided for @newTask.
  ///
  /// In en, this message translates to:
  /// **'New task'**
  String get newTask;

  /// No description provided for @enterNewTask.
  ///
  /// In en, this message translates to:
  /// **'Enter new task'**
  String get enterNewTask;

  /// No description provided for @taskText.
  ///
  /// In en, this message translates to:
  /// **'Task text'**
  String get taskText;

  /// No description provided for @enterTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter task title!'**
  String get enterTaskTitle;

  /// No description provided for @importantTask.
  ///
  /// In en, this message translates to:
  /// **'Important task'**
  String get importantTask;

  /// No description provided for @noTasks.
  ///
  /// In en, this message translates to:
  /// **'No tasks'**
  String get noTasks;

  /// No description provided for @forTomorrow.
  ///
  /// In en, this message translates to:
  /// **'For tomorrow'**
  String get forTomorrow;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @taskList.
  ///
  /// In en, this message translates to:
  /// **'Task list'**
  String get taskList;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @critical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get critical;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @exception.
  ///
  /// In en, this message translates to:
  /// **'----------------------------------------------'**
  String get exception;

  /// No description provided for @exceptionGeneral.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later.'**
  String get exceptionGeneral;

  /// No description provided for @exceptionDecode.
  ///
  /// In en, this message translates to:
  /// **'Could not decode entity'**
  String get exceptionDecode;

  /// No description provided for @exceptionDecodeEntity.
  ///
  /// In en, this message translates to:
  /// **'Could not decode entity: {entityName}'**
  String exceptionDecodeEntity(String entityName);

  /// No description provided for @exceptionFirebaseAuthEmailExists.
  ///
  /// In en, this message translates to:
  /// **'The provided email is already in use'**
  String get exceptionFirebaseAuthEmailExists;

  /// No description provided for @exceptionFirebaseAuthInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid login credentials'**
  String get exceptionFirebaseAuthInvalidCredentials;

  /// No description provided for @exceptionFirebaseAuthInternalError.
  ///
  /// In en, this message translates to:
  /// **'An internal error occurred'**
  String get exceptionFirebaseAuthInternalError;

  /// No description provided for @exceptionFirebaseAuthInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'The provided email is invalid'**
  String get exceptionFirebaseAuthInvalidEmail;

  /// No description provided for @exceptionFirebaseAuthInvalidPassword.
  ///
  /// In en, this message translates to:
  /// **'The provided password is invalid'**
  String get exceptionFirebaseAuthInvalidPassword;

  /// No description provided for @exceptionFirebaseAuthInvalidPhone.
  ///
  /// In en, this message translates to:
  /// **'The provided phone number is invalid'**
  String get exceptionFirebaseAuthInvalidPhone;

  /// No description provided for @exceptionFirebaseAuthPhoneExists.
  ///
  /// In en, this message translates to:
  /// **'The provided phone number is already in use'**
  String get exceptionFirebaseAuthPhoneExists;

  /// No description provided for @exceptionFirebaseAuthTooManyRequests.
  ///
  /// In en, this message translates to:
  /// **'The number of requests exceeds the maximum allowed'**
  String get exceptionFirebaseAuthTooManyRequests;

  /// No description provided for @exceptionFirebaseAuthUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'No such user exists'**
  String get exceptionFirebaseAuthUserNotFound;

  /// No description provided for @exceptionFirebaseAuthUserDisabled.
  ///
  /// In en, this message translates to:
  /// **'User is disabled'**
  String get exceptionFirebaseAuthUserDisabled;

  /// No description provided for @exceptionFirebaseAuthInvalidVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'The code entered is invalid'**
  String get exceptionFirebaseAuthInvalidVerificationCode;

  /// No description provided for @exceptionFirebaseAuthRequiresRecentLogin.
  ///
  /// In en, this message translates to:
  /// **'Additional authentication required'**
  String get exceptionFirebaseAuthRequiresRecentLogin;

  /// No description provided for @exceptionFirebaseAuthUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown auth error occurred'**
  String get exceptionFirebaseAuthUnknown;

  /// No description provided for @exceptionFirestoreEntityNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested {entityName} was not found'**
  String exceptionFirestoreEntityNotFound(String entityName);

  /// No description provided for @exceptionFirestoreEntityNotFoundGeneral.
  ///
  /// In en, this message translates to:
  /// **'The requested entity was not found'**
  String get exceptionFirestoreEntityNotFoundGeneral;

  /// No description provided for @exceptionHttpGeneral.
  ///
  /// In en, this message translates to:
  /// **'A network error occurred during the request'**
  String get exceptionHttpGeneral;

  /// No description provided for @exceptionHttpNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested resource was not found'**
  String get exceptionHttpNotFound;

  /// No description provided for @exceptionHttpForbidden.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permissions to perform this action'**
  String get exceptionHttpForbidden;

  /// No description provided for @exceptionHttpUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'This request was not authorized'**
  String get exceptionHttpUnauthorized;

  /// No description provided for @n.
  ///
  /// In en, this message translates to:
  /// **'---'**
  String get n;
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
      <String>['en', 'ru', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
