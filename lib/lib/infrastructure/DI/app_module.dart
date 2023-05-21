import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../networking/api_service.dart';
import '../networking/dio_service.dart';
import '../networking/interceptors/logging_interceptor.dart';
import '../networking/local/path_provider_service.dart';

@module
abstract class AppModule {

  @Singleton()
  Dio get dioProvider => Dio(BaseOptions(baseUrl: "BASE URL:PORT"));

  @LazySingleton()
  DioService get dioServiceProvider => DioService(
    dioClient: dioProvider,
    globalCacheOptions: CacheOptions(
      store: HiveCacheStore(PathProviderService.path),
      policy: CachePolicy.noCache,
      maxStale: const Duration(days: 30),
      keyBuilder: (options) => options.path,
    ),
    interceptors: [
      //ApiInterceptor(ref),
      DioCacheInterceptor(
        options: CacheOptions(
          store: HiveCacheStore(PathProviderService.path),
          policy: CachePolicy.noCache,
          maxStale: const Duration(days: 30),
          keyBuilder: (options) => options.path,
        ),
      ),
      if (kDebugMode) LoggingInterceptor(),
      // RefreshTokenInterceptor(ref.read, dioClient: dioProvider),
    ],
  );

  @LazySingleton()
  ApiService get apiServiceProvider => ApiService(dioServiceProvider);

}