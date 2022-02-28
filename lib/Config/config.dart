class Config{
  // network constants
  static Uri setApi (String endPoint){
    return  Uri.parse("http://e-branch.two-tech.net/api/$endPoint");
  }
  static String url = "http://e-branch.two-tech.net";
}