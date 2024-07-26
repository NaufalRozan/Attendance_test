import 'package:attendance_test/data/datasources/attendance_remote_datasource.dart';
import 'package:attendance_test/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/core.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/auth/pages/splash_page.dart';
import 'presentation/home/bloc/checkin_attendance/checkin_attendance_bloc.dart';
import 'presentation/home/bloc/checkout_attendance/checkout_attendance_bloc.dart';
import 'presentation/home/bloc/get_attendance_by_date/get_attendance_by_date_bloc.dart';
import 'presentation/home/bloc/get_company/get_company_bloc.dart';
import 'presentation/home/bloc/is_checkedin/is_checkedin_bloc.dart';
import 'presentation/home/bloc/update_user_register_face/update_user_register_face_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              UpdateUserRegisterFaceBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetCompanyBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => IsCheckedinBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CheckinAttendanceBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              CheckoutAttendanceBloc(AttendanceRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetAttendanceByDateBloc(AttendanceRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          dividerTheme:
              DividerThemeData(color: AppColors.light.withOpacity(0.5)),
          dialogTheme: const DialogTheme(elevation: 0),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.kumbhSans(
              color: AppColors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}

