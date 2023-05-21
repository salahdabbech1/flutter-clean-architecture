import '../../../infrastructure/Base/domain/base_repository.dart';
import '../data/test_model.dart';

abstract class HomeRepository extends BaseRepository {
  Future<String> getDate();

  Future<TestModel> getRoute();
}
