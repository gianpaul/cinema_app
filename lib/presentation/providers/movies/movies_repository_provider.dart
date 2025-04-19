import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infraestructure/datasources/moviedb_datasources.dart';
import '../../../infraestructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDataSource());
});
