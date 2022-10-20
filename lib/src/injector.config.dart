// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/di/AppModule.dart' as _i12;
import 'movies/data/data_sources/movie_service.dart' as _i4;
import 'movies/data/data_sources/movie_service_imp.dart' as _i5;
import 'movies/data/repositories/movie_repository_imp.dart' as _i7;
import 'movies/domain/repositories/movie_repository.dart' as _i6;
import 'movies/domain/use_cases/get_now_playing_use_case.dart' as _i8;
import 'movies/domain/use_cases/get_popular_use_case.dart' as _i9;
import 'movies/domain/use_cases/get_top_rate_use_case.dart' as _i10;
import 'movies/presentation/pages/home/home_bloc.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.factoryAsync<_i3.Dio>(
    () => appModule.dio,
    preResolve: true,
  );
  gh.lazySingleton<_i4.MovieService>(() => _i5.MovieServiceImp(get<_i3.Dio>()));
  gh.factory<_i5.MovieServiceImp>(
      () => appModule.getAuthService(get<_i3.Dio>()));
  gh.lazySingleton<_i6.MovieRepository>(
      () => _i7.MovieRepositoryImp(get<_i4.MovieService>()));
  gh.lazySingleton<_i8.GetNowPlayingUseCase>(
      () => _i8.GetNowPlayingUseCase(get<_i6.MovieRepository>()));
  gh.lazySingleton<_i9.GetPopularUseCase>(
      () => _i9.GetPopularUseCase(get<_i6.MovieRepository>()));
  gh.lazySingleton<_i10.GetTopRateUseCase>(
      () => _i10.GetTopRateUseCase(get<_i6.MovieRepository>()));
  gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(
        get<_i8.GetNowPlayingUseCase>(),
        get<_i10.GetTopRateUseCase>(),
        get<_i9.GetPopularUseCase>(),
      ));
  return get;
}

class _$AppModule extends _i12.AppModule {}
