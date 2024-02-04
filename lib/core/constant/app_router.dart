enum AppRouter {
  root(name: 'root', path: '/', subPath: '/'),;


  const AppRouter({
    required this.name,
    required this.path,
    required this.subPath,
  });

  final String name;
  final String path;
  final String subPath;
}
