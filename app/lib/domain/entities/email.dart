final class Email {
  final String value;

  const Email({required this.value});

  bool get isValid => _emailRegex.hasMatch(value);

  static bool validate(String value) => _emailRegex.hasMatch(value);

  static final _emailRegex = RegExp(
    r'^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+'
    r'([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$',
  );
}
