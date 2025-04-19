import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment{

  static String theMovieKeyDbKey = dotenv.env['THE_MOVIES_DB_API_KEY'] ?? 'Api key not found';
}