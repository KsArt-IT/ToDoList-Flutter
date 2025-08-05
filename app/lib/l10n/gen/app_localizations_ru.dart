// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get language => 'Русский';

  @override
  String get appTitle => 'ToDo List';

  @override
  String get topic => 'Тема:';

  @override
  String get themeSystem => 'Как на устройстве';

  @override
  String get themeDark => 'Темная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get auth => 'Авторизация';

  @override
  String get registration => 'Регистрация';

  @override
  String get login => 'Войти';

  @override
  String get logout => 'Выйти';

  @override
  String get emailInput => 'Введите email';

  @override
  String get passwordInput => 'Введите пароль';

  @override
  String get loginWithGoogle => 'Войти с учетной записью Google';

  @override
  String get register => 'Зарегистрироваться';

  @override
  String get passwordConfirm => 'Подтвердите пароль';

  @override
  String get passwordsNotMatch => 'пароли не совпадают';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get emailNotExist => 'Пользователь с таким email не существует.';

  @override
  String get emailNotValid => 'Неверный формат адреса электронной почты.';

  @override
  String get emailInputHelperText =>
      'Введите корректный адрес электронной почты email@example.com';

  @override
  String get passwordInputHelperText =>
      'Введите пароль длинною более 8 символов, содержащий цифры, буквы и специальные символы';

  @override
  String get passwordNotValid => 'Введен неверный пароль.';

  @override
  String get resetPassword => 'Сбросить пароль';

  @override
  String get resetPasswordPage => 'Сброс пароля';

  @override
  String get resetPasswordSent =>
      'На ваш email был отправлен запрос на восстановления пароля!';

  @override
  String get loginSuccess => 'Успешная авторизация';

  @override
  String get registrationSuccess => 'Успешная регистрация';

  @override
  String get authCredentialsInvalid =>
      'Предоставленные учетные данные аутентификации неверны или срок их действия истек.';

  @override
  String get userBlocked => 'Учетная запись пользователя заблокирована.';

  @override
  String get emailInUse => 'Этот адрес электронной почты уже используется.';

  @override
  String get passwordWeak => 'Пароль слишком слабый.';

  @override
  String get error => 'Ошибка';

  @override
  String get networkError => 'Произошла ошибка сети';

  @override
  String get unexpectedStatus => 'Неожиданный код статуса';

  @override
  String get decodeError => 'Ошибка декодирования';

  @override
  String get dbNotConnected => 'База данных не подключена.';

  @override
  String get invalidRequest => 'Запрос недействителен.';

  @override
  String get invalidResponse => 'Ответ недействителен.';

  @override
  String get save => 'Сохранить';

  @override
  String get delete => 'Удалить';

  @override
  String get options => 'Опции';

  @override
  String get profile => 'Профиль';

  @override
  String get genderMale => 'мужской';

  @override
  String get genderFemale => 'женский';

  @override
  String get genderOther => 'другой';

  @override
  String get info => 'Информация';

  @override
  String get activeTasks => 'Активные задачи';

  @override
  String get completedTasks => 'Выполненные задачи';

  @override
  String get createdTasks => 'Создано задач';

  @override
  String get deletedTasks => 'Удалено задач';

  @override
  String get addFirstTask => 'Добавьте свою первую задачу!';

  @override
  String get newTask => 'Новая задача';

  @override
  String get enterNewTask => 'Введите новую задачу';

  @override
  String get taskText => 'Текст задачи';

  @override
  String get enterTaskTitle => 'Введите название задачи!';

  @override
  String get importantTask => 'Важная задача';

  @override
  String get noTasks => 'Нет задач';

  @override
  String get forTomorrow => 'На завтра';

  @override
  String get edit => 'Редактировать';

  @override
  String get time => 'Время';

  @override
  String get taskList => 'Список задач';

  @override
  String get active => 'Активные';

  @override
  String get critical => 'Критические';

  @override
  String get completed => 'Выполнено';

  @override
  String get overdue => 'Просроченные';
}
