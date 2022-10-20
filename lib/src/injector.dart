import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/src/injector.config.dart';



final getIt = GetIt.instance;


@InjectableInit()
Future<void> configureDependencies() async => $initGetIt(getIt);

