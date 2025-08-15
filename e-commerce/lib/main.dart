import 'package:authentication_task/config/routing/routes.dart';
import 'package:authentication_task/core/dependency_injection/locator.dart';
import 'package:authentication_task/feature/presentation/authentication/bloc/auth.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:size_config/size_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await locatorSetup();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(BlocProvider(
    create: (context) => AuthBloc(locator()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizeConfigInit(
      referenceHeight: 900,
      referenceWidth: 360,
      builder: (context, child) => MaterialApp.router(
        title: 'Size Config Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: routs,
        // home: context.goNamed('login'),
      ),
    );
  }
}
