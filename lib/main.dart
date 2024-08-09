import 'package:ecommerce/features/cart/presentation/model_view/order_cubit.dart';
import 'package:ecommerce/features/home/presentation/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/service_locator.dart';
import 'features/cart/presentation/model_view/cart_cubit.dart';
import 'features/home/presentation/view_models/favourites_cubit/favorites_cubit.dart';
import 'features/login/presentation/views/login_screen.dart';
import 'features/onboarding/presentation/views/onboarding_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup(); // Initialize service locator or dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => OrderCubit()),
      ],
      child: MaterialApp(
        routes: {
          '/login': (context) => LoginScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: OnboardingScreen(),
        ),
      ),
    );
  }
}
