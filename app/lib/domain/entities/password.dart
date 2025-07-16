final class Password {
  final String value;
  const Password({required this.value});

  static final _passwordRegex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,64}$',
  );

  bool get isValid => _passwordRegex.hasMatch(value);
}
