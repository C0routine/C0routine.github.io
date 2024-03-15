class ProjectListModel {
  final String title;
  final String description;
  final List<String> imageUrlList;

  final String? aosUrl;
  final String? iosUrl;
  final String? webUrl;

  ProjectListModel({
    required this.title,
    required this.description,
    required this.imageUrlList,
    this.aosUrl,
    this.iosUrl,
    this.webUrl,
  });
}
