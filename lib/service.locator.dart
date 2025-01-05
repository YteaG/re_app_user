// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// void setup() {
//   // Register data sources
//   getIt.registerLazySingleton<PropertyRemoteDataSource>(() => PropertyRemoteDataSourceImpl());
  
//   // Register repositories
//   getIt.registerLazySingleton<PropertyRepository>(() => PropertyRepositoryImpl(getIt()));
  
//   // Register use cases
//   getIt.registerLazySingleton<GetPropertiesUseCase>(() => GetPropertiesUseCase(getIt()));
  
//   // Register providers
//   getIt.registerFactory(() => PropertyNotifier(getIt()));
// }
