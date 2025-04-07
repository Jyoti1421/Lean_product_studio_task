part of 'job_cubit.dart';

abstract class JobState {}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final List<JobModel> jobs;
  final List<int> saved;
  final bool isLoading;
  JobLoaded({required this.jobs, required this.saved, this.isLoading = false});
  JobLoaded copyWith({
    List<JobModel>? jobs,
    List<int>? saved,
    bool? isLoading,
  }) {
    return JobLoaded(
      jobs: jobs ?? this.jobs,
      saved: saved ?? this.saved,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class JobError extends JobState {
  final String message;
  JobError(this.message);
}
