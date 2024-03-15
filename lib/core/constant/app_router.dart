enum AppRouter {
  home(name: 'home', path: '/', subPath: '/'),
  history(name: 'history', path: '/history', subPath: 'history'),
  test(name: 'test', path: '/test', subPath: '/test');

  const AppRouter({
    required this.name,
    required this.path,
    required this.subPath,
  });

  final String name;
  final String path;
  final String subPath;
}
