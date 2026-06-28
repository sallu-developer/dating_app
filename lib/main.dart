import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:dating_app/core/theme/app_theme.dart';
import 'package:dating_app/data/datasources/user_remote_data_source.dart';
import 'package:dating_app/data/repositories/user_repository_impl.dart';
import 'package:dating_app/domain/usecases/get_users_usecase.dart';
import 'package:dating_app/presentation/blocs/home/home_bloc.dart';
import 'package:dating_app/presentation/blocs/home/home_event.dart';
import 'package:dating_app/presentation/pages/main_screen.dart';

void main() {
  final httpClient = http.Client();
  final remoteDataSource = UserRemoteDataSourceImpl(client: httpClient);
  final userRepository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
  final getUsersUseCase = GetUsersUseCase(userRepository);

  runApp(MyApp(getUsersUseCase: getUsersUseCase));
}

class MyApp extends StatelessWidget {
  final GetUsersUseCase getUsersUseCase;

  const MyApp({super.key, required this.getUsersUseCase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating App',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => HomeBloc(getUsersUseCase: getUsersUseCase)..add(LoadUsersEvent()),
        child: const MainScreen(),
      ),
    );
  }
}
