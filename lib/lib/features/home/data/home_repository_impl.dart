import 'package:flutter_clean_architecture_sample/lib/features/home/data/test_model.dart';
import 'package:injectable/injectable.dart';

import '../../../infrastructure/networking/custom_exception.dart';
import '../domain/home_repository.dart';
import 'home_service.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImplementation implements HomeRepository {
  final HomeService service;

  HomeRepositoryImplementation(this.service);

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<String> getDate() async {
    return await service.getDate();
  }

  @override
  Future<void> post(item) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<void> update(item) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<TestModel> getRoute() async {
    try {
      return await service.getRoute();
    } on CustomException {
      rethrow;
    }
  }
}
