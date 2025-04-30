import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/view/gallery/data/models/image_list.dart';
import 'package:food_delivery/view/gallery/home_page.dart';
import 'package:provider/provider.dart';

import 'package:food_delivery/view/login/login_page/bloc/login_bloc.dart';
import 'package:food_delivery/view/login/signup/bloc/sign_up_bloc.dart';
import 'package:food_delivery/view/home/bloc/image_picker_bloc.dart';
import 'package:food_delivery/view/on_boarding/startup_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ImageModel())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
          BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
          BlocProvider<ImagePickerBloc>(create: (context) => ImagePickerBloc()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Metropolis",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const StartupView(),
    );
  }
}
