import 'package:flutter_dotenv/flutter_dotenv.dart';

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
  
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
  static String get firebaseApiKey => dotenv.env['FIREBASE_API_KEY'] ?? '';
  
  static Future<void> initialize({Environment env = Environment.production}) async {
    _environment = env;
    
    final envFile = switch (env) {
      Environment.development => '.env.dev',
      Environment.staging => '.env.staging',
      Environment.production => '.env.prod',
    };
    
    try {
      await dotenv.load(fileName: envFile);
    } catch (e) {
      // Fallback to default .env
      await dotenv.load(fileName: '.env');
    }
  }
}
