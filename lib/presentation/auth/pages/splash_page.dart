import 'package:attendance_test/data/datasources/auth_local_datasource.dart';
import 'package:attendance_test/presentation/home/pages/main_page.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacement(const LoginPage()),
    );
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: FutureBuilder(
        future: AuthLocalDatasource().isAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Assets.images.logo.image(),
                ),
                const Spacer(),
                Assets.images.footer.image(height: 70),
                const SpaceHeight(20.0),
              ],
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const MainPage()),
              );
            } else {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const LoginPage()),
              );
            }
          }
          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Assets.images.logo.image(),
              ),
              const Spacer(),
              Assets.images.footer.image(height: 100),
              const SpaceHeight(20.0),
            ],
          );
        },
      ),
    );
  }
}