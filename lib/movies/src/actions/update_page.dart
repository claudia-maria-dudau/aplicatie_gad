library update_page;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_page.freezed.dart';

@freezed
abstract class UpdatePage with _$UpdatePage{
  const factory UpdatePage(int page) = _UpdatePage;
}