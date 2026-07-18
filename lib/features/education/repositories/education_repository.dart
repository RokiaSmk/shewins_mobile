import '../models/education_response.dart';
import '../remote/education_remote_data_source.dart';

class EducationRepository {
  final EducationRemoteDataSource _remoteDataSource =
      EducationRemoteDataSource();

  Future<List<EducationResponse>> getContents() {
    return _remoteDataSource.getContents();
  }

  Future<EducationResponse> getContentById(
    String id,
  ) {
    return _remoteDataSource.getContentById(id);
  }
}