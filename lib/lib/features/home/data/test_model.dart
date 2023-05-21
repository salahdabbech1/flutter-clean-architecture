import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../infrastructure/helpers/typedefs.dart';

part 'test_model.freezed.dart';

part 'test_model.g.dart';

@freezed
class TestModel with _$TestModel {
  const factory TestModel({
    required int id,
    required String name,
    required String email,
  }) = _TestModel;

  factory TestModel.fromJson(JSON json) => _$TestModelFromJson(json);
}
