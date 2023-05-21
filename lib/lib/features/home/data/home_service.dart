import 'package:flutter_clean_architecture_sample/lib/features/home/data/test_model.dart';
import 'package:injectable/injectable.dart';
import '../../../infrastructure/networking/api_service.dart';
import '../../../infrastructure/networking/custom_exception.dart';

@Injectable()
class HomeService extends ApiService {
  final ApiService apiService;

  HomeService(super.dioService, this.apiService);

  Future<String> getDate() async {
    await Future.delayed(const Duration(seconds: 3));
    return ("Called the API successfully");
  }

  Future<TestModel> getRoute() async {
    try {
      return await apiService.getDocumentData<TestModel>(
          endpoint: "YOUR ENDPOINT HERE", converter: TestModel.fromJson);
    } on CustomException {
      rethrow;
    }
  }
}
