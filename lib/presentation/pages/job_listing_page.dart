import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing/bloc/job/job_cubit.dart';
import 'package:job_listing/bloc/theme/theme_cubit.dart';
import 'package:job_listing/constant/app_strings.dart';
import 'package:job_listing/constant/text_styles.dart';
import 'package:job_listing/core/widgets/custom_app_bar.dart';
import 'package:job_listing/core/utils/router.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.appTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark),

            onPressed: () => Navigator.pushNamed(context, AppRouter.savedJobs),
          ),
        ],
      ),
      body: BlocBuilder<JobCubit, JobState>(
        builder: (context, state) {
          if (state is JobLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JobLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.jobs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final job = state.jobs[index];
                final isSaved = state.saved.contains(job.id);

                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.jobDetail,
                      arguments: job,
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(job.name, style: AppTextStyles.title),
                                const SizedBox(height: 4),
                                Text(
                                  '${AppStrings.pantoneLabel}${job.pantoneValue}',
                                  style: AppTextStyles.subtitle,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isSaved ? Icons.bookmark : Icons.bookmark_outline,
                            ),
                            onPressed:
                                () =>
                                    context.read<JobCubit>().toggleSave(job.id),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is JobError) {
            return Center(
              child: Text(state.message, style: AppTextStyles.body),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
