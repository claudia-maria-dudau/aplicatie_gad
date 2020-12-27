library update_title;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_title.freezed.dart';

@freezed
abstract class UpdateTitle with _$UpdateTitle {
  const factory UpdateTitle(String title) = _UpdateTitle;
}
