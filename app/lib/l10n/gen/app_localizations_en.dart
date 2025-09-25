// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get appTitle => 'ToDo List';

  @override
  String get topic => 'Topic:';

  @override
  String get themeSystem => 'System';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String get auth => 'Authorization';

  @override
  String get registration => 'Registration';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get emailInput => 'Enter email';

  @override
  String get passwordInput => 'Enter password';

  @override
  String get loginWithGoogle => 'Login with Google account';

  @override
  String get register => 'Register';

  @override
  String get passwordConfirm => 'Confirm password';

  @override
  String get passwordsNotMatch => 'Passwords do not match';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get emailNotExist => 'A user with this email does not exist.';

  @override
  String get emailNotValid => 'Invalid email format.';

  @override
  String get emailInputHelperText =>
      'Enter a valid email address email@example.com';

  @override
  String get passwordInputHelperText =>
      'Enter a password longer than 8 characters, containing numbers, letters and special characters';

  @override
  String get passwordNotValid => 'Invalid password.';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get resetPasswordPage => 'Reset password page';

  @override
  String get resetPasswordSent =>
      'A password reset request has been sent to your email!';

  @override
  String get loginSuccess => 'Login successful';

  @override
  String get registrationSuccess => 'Registration successful';

  @override
  String get authCredentialsInvalid =>
      'The provided authentication credentials are invalid or have expired.';

  @override
  String get userBlocked => 'User account is blocked.';

  @override
  String get emailInUse => 'This email address is already in use.';

  @override
  String get passwordWeak => 'Password is too weak.';

  @override
  String get error => 'Error';

  @override
  String get networkError => 'Network error occurred';

  @override
  String get unexpectedStatus => 'Unexpected status code';

  @override
  String get decodeError => 'Decoding error';

  @override
  String get dbNotConnected => 'Database is not connected.';

  @override
  String get invalidRequest => 'Invalid request.';

  @override
  String get invalidResponse => 'Invalid response.';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get options => 'Options';

  @override
  String get profile => 'Profile';

  @override
  String get genderMale => 'male';

  @override
  String get genderFemale => 'female';

  @override
  String get genderOther => 'other';

  @override
  String get info => 'Information';

  @override
  String get activeTasks => 'Active tasks';

  @override
  String get completedTasks => 'Completed tasks';

  @override
  String get createdTasks => 'Created tasks';

  @override
  String get deletedTasks => 'Deleted tasks';

  @override
  String get addFirstTask => 'Add your first task!';

  @override
  String get newTask => 'New task';

  @override
  String get enterNewTask => 'Enter new task';

  @override
  String get taskText => 'Task text';

  @override
  String get enterTaskTitle => 'Enter task title!';

  @override
  String get importantTask => 'Important task';

  @override
  String get noTasks => 'No tasks';

  @override
  String get forTomorrow => 'For tomorrow';

  @override
  String get edit => 'Edit';

  @override
  String get time => 'Time';

  @override
  String get taskList => 'Task list';

  @override
  String get active => 'Active';

  @override
  String get critical => 'Critical';

  @override
  String get completed => 'Completed';

  @override
  String get overdue => 'Overdue';

  @override
  String get exception => '----------------------------------------------';

  @override
  String get exceptionGeneral => 'An error occurred, please try again later.';

  @override
  String get exceptionDecode => 'Could not decode entity';

  @override
  String exceptionDecodeEntity(String entityName) {
    return 'Could not decode entity: $entityName';
  }

  @override
  String get exceptionFirebaseAuthEmailExists =>
      'The provided email is already in use';

  @override
  String get exceptionFirebaseAuthInvalidCredentials =>
      'Invalid login credentials';

  @override
  String get exceptionFirebaseAuthInternalError => 'An internal error occurred';

  @override
  String get exceptionFirebaseAuthInvalidEmail =>
      'The provided email is invalid';

  @override
  String get exceptionFirebaseAuthInvalidPassword =>
      'The provided password is invalid';

  @override
  String get exceptionFirebaseAuthInvalidPhone =>
      'The provided phone number is invalid';

  @override
  String get exceptionFirebaseAuthPhoneExists =>
      'The provided phone number is already in use';

  @override
  String get exceptionFirebaseAuthTooManyRequests =>
      'The number of requests exceeds the maximum allowed';

  @override
  String get exceptionFirebaseAuthUserNotFound => 'No such user exists';

  @override
  String get exceptionFirebaseAuthUserDisabled => 'User is disabled';

  @override
  String get exceptionFirebaseAuthInvalidVerificationCode =>
      'The code entered is invalid';

  @override
  String get exceptionFirebaseAuthRequiresRecentLogin =>
      'Additional authentication required';

  @override
  String get exceptionFirebaseAuthUnknown => 'An unknown auth error occurred';

  @override
  String exceptionFirestoreEntityNotFound(String entityName) {
    return 'The requested $entityName was not found';
  }

  @override
  String get exceptionFirestoreEntityNotFoundGeneral =>
      'The requested entity was not found';

  @override
  String get exceptionHttpGeneral =>
      'A network error occurred during the request';

  @override
  String get exceptionHttpNotFound => 'The requested resource was not found';

  @override
  String get exceptionHttpForbidden =>
      'You don\'t have permissions to perform this action';

  @override
  String get exceptionHttpUnauthorized => 'This request was not authorized';

  @override
  String get n => '---';
}
