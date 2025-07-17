class AppConfiguration{

  static late String flavor;

  static bool get isDev => flavor == 'development';
  static bool get isProd => flavor == 'production';


  static String get ownersCollectionName =>
      !isDev ? 'Owners' : 'owners_development';
  static String get blogsCollectionName =>
      isDev ? ' blogs_development' : 'Blogs';
  static String get requestsCollectionName =>
      isDev ? 'requests_development' : 'Requests';
}

