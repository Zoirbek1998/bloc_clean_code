import 'package:bloc_clean_code/core/widgets/main_wrapper.dart';
import 'package:bloc_clean_code/feature/feature_weather/presentation/bloc/home/home_bloc.dart';
import 'package:bloc_clean_code/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/feature_bookmark/presentation/bloc/bookmark_bloc.dart';

void main() async {
  /// init locator
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<HomeBloc>()),
        BlocProvider(create: (_) => locator<BookmarkBloc>()),
      ],
      child:  MainWrapper(),
    ),
  ));
}
