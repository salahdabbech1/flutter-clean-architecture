import 'package:injectable/injectable.dart';

import '../../../infrastructure/Base/domain/usecase/param_use_case.dart';
import '../data/test_model.dart';
import 'home_repository.dart';

@Injectable()
class GetDataUseCase extends BaseUseCase<HomeRepository> {
  GetDataUseCase(HomeRepository repository) : super(repository);

  Future<String> getData() async => await repository.getDate();

  Future<TestModel> getRoute() async => await repository.getRoute();
}
