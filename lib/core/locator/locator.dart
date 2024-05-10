import 'package:get_it/get_it.dart';
import 'package:lc_airline/core/presentation/helpers/presentation_helper.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({bool test =false}) async {

  locator.registerLazySingleton<PresentationHelper>(() => PresentationHelper());
}