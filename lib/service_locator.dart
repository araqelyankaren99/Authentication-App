import 'package:flutter_authentication_app/src/config/navigation/main_navigation.dart';
import 'package:flutter_authentication_app/src/config/navigation/route_names.dart';
import 'package:flutter_authentication_app/src/data/repository/user.dart';
import 'package:flutter_authentication_app/src/domain/entity/user.g.dart';
import 'package:flutter_authentication_app/src/presentation/screens/login/store.dart';
import 'package:get_it/get_it.dart';

Future<void> setupDependencies() async{
  await _registerMainNavigation();
  await _registerUserRepository();
  _setupLoginStore();
}

final _serviceLocator = GetIt.instance;

Future<void> _registerMainNavigation() async {
  const initialRoute = MainNavigationRouteNames.login;

  final mainNavigation = MainNavigation(initialRoute: initialRoute);
  _serviceLocator
      .registerLazySingleton<MainNavigation>(() => mainNavigation);
}

Future<void> _registerUserRepository() async {
  await initStore();
  final userRepository = UserRepositoryImpl(getUserBox());
  _serviceLocator
      .registerLazySingleton<UserRepository>(() => userRepository);
}

void _setupLoginStore() async {
  final userRepository = GetIt.I<UserRepository>();
  _serviceLocator.registerFactory<LoginStore>(() => LoginStore(userRepository));
}
