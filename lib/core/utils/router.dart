import 'package:flutter/material.dart';
import 'package:job_listing/constant/app_strings.dart';
import 'package:job_listing/models/job_model.dart';
import 'package:job_listing/presentation/pages/job_detail_page.dart';
import 'package:job_listing/presentation/pages/job_listing_page.dart';
import 'package:job_listing/presentation/pages/saved_jobs_page.dart';

class AppRouter {
  static const String home = '/';
  static const String savedJobs = '/saved';
  static const String jobDetail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const JobListPage());

      case savedJobs:
        return MaterialPageRoute(builder: (_) => const SavedJobsPage());

      case jobDetail:
        final job = settings.arguments as JobModel;
        return MaterialPageRoute(builder: (_) => JobDetailScreen(job: job));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text(AppStrings.noroutedefined)),
          ),
        );
    }
  }
}
