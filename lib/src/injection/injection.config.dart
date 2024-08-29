import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:opticonnect_sdk/src/injection/injection.config.config.dart';

final GetIt getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureSdkDependencyInjection() => getIt.init();
