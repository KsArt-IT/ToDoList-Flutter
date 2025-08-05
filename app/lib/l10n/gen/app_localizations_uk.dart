// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get language => 'Українська';

  @override
  String get appTitle => 'ToDo List';

  @override
  String get topic => 'Тема:';

  @override
  String get themeSystem => 'Як на пристрої';

  @override
  String get themeDark => 'Темна';

  @override
  String get themeLight => 'Світла';

  @override
  String get auth => 'Авторизація';

  @override
  String get registration => 'Реєстрація';

  @override
  String get login => 'Увійти';

  @override
  String get logout => 'Вийти';

  @override
  String get emailInput => 'Введіть email';

  @override
  String get passwordInput => 'Введіть пароль';

  @override
  String get loginWithGoogle => 'Увійти через Google акаунт';

  @override
  String get register => 'Зареєструватися';

  @override
  String get passwordConfirm => 'Підтвердіть пароль';

  @override
  String get passwordsNotMatch => 'паролі не співпадають';

  @override
  String get forgotPassword => 'Забули пароль?';

  @override
  String get emailNotExist => 'Користувача з таким email не існує.';

  @override
  String get emailNotValid => 'Невірний формат email.';

  @override
  String get emailInputHelperText =>
      'Введіть коректний адресу email email@example.com';

  @override
  String get passwordInputHelperText =>
      'Введіть пароль довжиною більше 8 символів, що містить цифри, букви та спеціальні символи';

  @override
  String get passwordNotValid => 'Невірний пароль.';

  @override
  String get resetPassword => 'Скинути пароль';

  @override
  String get resetPasswordPage => 'Скидання пароля';

  @override
  String get resetPasswordSent =>
      'На ваш email надіслано запит на відновлення пароля!';

  @override
  String get loginSuccess => 'Успішна авторизація';

  @override
  String get registrationSuccess => 'Успішна реєстрація';

  @override
  String get authCredentialsInvalid =>
      'Надані облікові дані недійсні або термін їх дії закінчився.';

  @override
  String get userBlocked => 'Обліковий запис заблоковано.';

  @override
  String get emailInUse => 'Ця електронна адреса вже використовується.';

  @override
  String get passwordWeak => 'Пароль занадто слабкий.';

  @override
  String get error => 'Помилка';

  @override
  String get networkError => 'Виникла помилка мережі';

  @override
  String get unexpectedStatus => 'Неочікуваний код статусу';

  @override
  String get decodeError => 'Помилка декодування';

  @override
  String get dbNotConnected => 'Базу даних не підключено.';

  @override
  String get invalidRequest => 'Недійсний запит.';

  @override
  String get invalidResponse => 'Недійсна відповідь.';

  @override
  String get save => 'Зберегти';

  @override
  String get delete => 'Видалити';

  @override
  String get options => 'Опції';

  @override
  String get profile => 'Профіль';

  @override
  String get genderMale => 'чоловік';

  @override
  String get genderFemale => 'жінка';

  @override
  String get genderOther => 'інше';

  @override
  String get info => 'Інформація';

  @override
  String get activeTasks => 'Активні завдання';

  @override
  String get completedTasks => 'Виконані завдання';

  @override
  String get createdTasks => 'Створено завдань';

  @override
  String get deletedTasks => 'Видалено завдань';

  @override
  String get addFirstTask => 'Додайте своє перше завдання!';

  @override
  String get newTask => 'Нове завдання';

  @override
  String get enterNewTask => 'Введіть нове завдання';

  @override
  String get taskText => 'Текст завдання';

  @override
  String get enterTaskTitle => 'Введіть назву завдання!';

  @override
  String get importantTask => 'Важливе завдання';

  @override
  String get noTasks => 'Немає завдань';

  @override
  String get forTomorrow => 'На завтра';

  @override
  String get edit => 'Редагувати';

  @override
  String get time => 'Час';

  @override
  String get taskList => 'Список завдань';

  @override
  String get active => 'Активні';

  @override
  String get critical => 'Критичні';

  @override
  String get completed => 'Виконано';

  @override
  String get overdue => 'Прострочені';
}
