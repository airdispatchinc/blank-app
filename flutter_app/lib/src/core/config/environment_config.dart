enum Environment {
  development,
  staging,
  production,
}

class EnvironmentConfig {
  static Environment _environment = Environment.production;
  
  static Environment get environment => _environment;
  static bool get isDevelopment => _environment == Environment.development;
  static bool get isStaging => _environment == Environment.staging;
  static bool get isProduction => _environment == Environment.production;
  
  static const String apiBaseUrl = 'https://api.production.example.com';
  static const String apiKey = 'your_api_key_here';
  
  static void initialize({Environment env = Environment.production}) {
    _environment = env;
  }
}
