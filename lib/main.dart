import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pingolearn_assignment/firebase/firebase_options.dart';
import 'package:pingolearn_assignment/shared/bloc/home/home_bloc.dart';
import 'package:pingolearn_assignment/shared/repository/data_service.dart';
import 'package:pingolearn_assignment/shared/session_manager.dart';

import 'common_export.dart';

const fetchBackground = "fetchBackground";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.instance.init();
  await SessionManager.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(
            authenticationRepository: AuthenticationRepository(),
          ),
        ),
        BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(
                  dataService: DataService(),
                )),
      ],
      child: const App(),
    ),
  );
}
