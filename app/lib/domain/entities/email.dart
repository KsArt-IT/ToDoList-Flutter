final class Email {
  final String value;

  const Email({required this.value});

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  bool get isValid => _emailRegex.hasMatch(value);
}
