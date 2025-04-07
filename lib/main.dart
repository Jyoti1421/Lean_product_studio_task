import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing/bloc/job/job_cubit.dart';
import 'package:job_listing/bloc/theme/theme_cubit.dart';
import 'package:job_listing/constant/app_strings.dart';
import 'package:job_listing/core/network/dio_client.dart';
import 'package:job_listing/core/theme/app_theme.dart' show AppTheme;
import 'package:job_listing/data/repositories/job_repository.dart';
import 'package:job_listing/core/utils/router.dart';

void main() {
  runApp(const JobApp());
}

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => JobCubit(JobRepository(DioClient()))..loadJobs(),
        ),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: AppStrings.jobListTitle,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRouter.home,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
