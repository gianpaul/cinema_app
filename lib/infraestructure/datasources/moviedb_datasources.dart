import 'package:cinema_app/config/constants/environment.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/infraestructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';

import '../../domain/datasources/movies_datasource.dart';
import '../models/moviedb/moviedb_response.dart';

class MoviedbDataSource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieKeyDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies =
        movieDBResponse.results
            .where((e) => e.posterPath != 'no-poster')
            .map((e) => MovieMapper.movieDBToEntity(e))
            .toList();

    return movies;
  }
}
