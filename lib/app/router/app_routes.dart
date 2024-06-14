enum AppRoute {
  appUpdate('app-update'),
  home('');

  const AppRoute(this._path);

  final String _path;

  String get path => '/$_path';
}
