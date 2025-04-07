import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing/bloc/job/job_cubit.dart';
import 'package:job_listing/constant/app_strings.dart';
import 'package:job_listing/core/widgets/custom_app_bar.dart';
import 'package:job_listing/core/utils/router.dart';

class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<JobCubit>().state;

    if (state is! JobLoaded) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final savedJobs =
        state.jobs.where((j) => state.saved.contains(j.id)).toList();

    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.savedJobs),
      body:
          savedJobs.isEmpty
              ? const Center(child: Text(AppStrings.noSavedJobs))
              : ListView.builder(
                itemCount: savedJobs.length,
                itemBuilder: (_, i) {
                  final job = savedJobs[i];
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
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(0.8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          title: Text(job.name),
                          subtitle: Text('${AppStrings.yearLabel} ${job.year}'),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              context.read<JobCubit>().toggleSave(job.id);
                            
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
