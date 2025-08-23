/// {@template user_entity}
/// Entity for user.
/// {@endtemplate}
final class UserLogged {
  /// {@macro user_entity}
  const UserLogged({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  final String id;
  final String email;
  final String name;
  final String avatar;
}
