import 'package:get_it/get_it.dart';

import 'package:currencyconverterapp/di/inject_bloc_dependencies.dart';
import 'package:currencyconverterapp/di/inject_datasource_dependencies.dart';
import 'package:currencyconverterapp/di/inject_domain_repository_dependencies.dart';
import 'package:currencyconverterapp/di/inject_domain_use_case_dependencies.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await initializeDatasourceDependencies();
  await initializeDomainRepositoryDependencies();
  await initializeDomainUseCaseDependencies();
  await initializeBlocDependencies();
}
