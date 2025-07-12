enum AppRoute {
  splash('/splash'),
  
  login('/login'),
  registration('/registration'),
  resetPassword('/reset_password'),

  home('/home'),
  edit('/edit'),
  profile('/profile'),
  settings('/settings'),;

  const AppRoute(this.path);
  
  final String path;
}
