import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing/bloc/job/job_cubit.dart';
import 'package:job_listing/constant/app_strings.dart';
import 'package:job_listing/constant/text_styles.dart';
import 'package:job_listing/models/job_model.dart';
import 'package:job_listing/core/utils/color_utils.dart';
import 'package:job_listing/core/widgets/custom_app_bar.dart';

class JobDetailScreen extends StatelessWidget {
  final JobModel job;

  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: job.name,
        actions: [
          BlocBuilder<JobCubit, JobState>(
            builder: (context, state) {
              final isSaved =
                  state is JobLoaded && state.saved.contains(job.id);
              return IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_outline,
                  color: isSaved ? theme.colorScheme.secondary : Colors.white,
                ),
                onPressed: () {
                  context.read<JobCubit>().toggleSave(job.id);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(getColorFromHex(job.color)),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${AppStrings.yearLabel} ${job.year}',
                  style: AppTextStyles.title.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppStrings.colorCodeLabel, style: AppTextStyles.subtitle),
                Text(
                  job.color,
                  style: AppTextStyles.body.copyWith(
                    color: Color(getColorFromHex(job.color)),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(AppStrings.pantoneLabel, style: AppTextStyles.subtitle),
                Text(job.pantoneValue, style: AppTextStyles.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
