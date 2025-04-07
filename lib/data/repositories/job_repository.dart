import 'dart:developer';

import 'package:job_listing/core/network/dio_client.dart';
import 'package:job_listing/models/job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobRepository {
  final DioClient dioClient;

  JobRepository(this.dioClient);

  /// Fetches a list of jobs from the API
  Future<List<JobModel>> fetchJobs() async {
    try {
      final response = await dioClient.get('/jobs');
      final data = response.data['data'] as List;

      return data.map((json) => JobModel.fromJson(json)).toList();
    } catch (e, stackTrace) {
      log("StackTrace: $stackTrace");
      return [];
    }
  }

  /// Retrieves a list of saved job IDs from local storage
  Future<List<int>> getSavedJobs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('saved') ?? [];
    return saved.map(int.parse).toList();
  }

  /// Toggles the save status of a job ID in local storage
  Future<void> toggleSave(int jobId) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('saved') ?? [];

    if (saved.contains(jobId.toString())) {
      saved.remove(jobId.toString());
    } else {
      saved.add(jobId.toString());
    }

    await prefs.setStringList('saved', saved);
  }
}
