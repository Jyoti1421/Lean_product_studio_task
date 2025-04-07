import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing/models/job_model.dart';
import '../../data/repositories/job_repository.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobRepository repository;

  JobCubit(this.repository) : super(JobInitial());

  Future<void> loadJobs() async {
    emit(JobLoading());
    try {
      final jobs = await repository.fetchJobs();
      final saved = await repository.getSavedJobs();
      emit(JobLoaded(jobs: jobs, saved: saved, isLoading: false));
    } catch (e) {
      emit(JobError('Failed to load jobs'));
    }
  }

  Future<void> toggleSave(int id) async {
    await repository.toggleSave(id);
    final saved = await repository.getSavedJobs();

    if (state is JobLoaded) {
      final current = state as JobLoaded;
      emit(current.copyWith(saved: saved));
    }
  }
}
