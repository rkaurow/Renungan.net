import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_sir_pandi/features/bloc/bloc/renungan_bloc.dart';
import 'package:task_sir_pandi/features/pages/main_page.dart';
import 'package:task_sir_pandi/features/pages/onboarding_screen.dart';
import 'package:task_sir_pandi/services/datasources/data_renungan_remote_datasources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RenunganBloc(DataRenunganRemoteDatasources()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MainPage()),
    );
  }
}
