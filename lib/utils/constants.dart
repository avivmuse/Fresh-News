class Constants {
  static String TOP_HEADLINES_URL =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=ce8a57e2da014a3fbfa2d5490a8218b6';

  static String headlinesFor(String keyword) {
    return 'https://newsapi.org/v2/everything?q=$keyword&apiKey=ce8a57e2da014a3fbfa2d5490a8218b6';
  }
}
