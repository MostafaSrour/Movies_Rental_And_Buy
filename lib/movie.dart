class Movie {
  final String name;
  final String box;
  final String cover;
  final String description;
  List<String> platforms;
  double rating;
  List<String> screenshots;

  Movie({
    required this.name,
    required this.box,
    this.cover = '',
    this.description = '',
    this.platforms = const [],
    this.rating = 0,
    this.screenshots = const [],
  });

  String getPlatforms() {
    String platformText = "";
    if (platforms.length > 1) {
      for (int i = 0; i < platforms.length; i++) {
        if (i == 0) {
          platformText = platforms[0];
        } else {
          platformText = platformText + " | " + platforms[i];
        }
      }
    } else if (platforms.length == 1) {
      platformText = platforms[0];
    }

    return platformText;
  }
}
