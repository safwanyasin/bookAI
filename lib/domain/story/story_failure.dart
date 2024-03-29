import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_failure.freezed.dart';

@freezed
abstract class StoryFailure with _$StoryFailure {
  const factory StoryFailure.unexpected() = _Unexpected;
  const factory StoryFailure.insufficientPermissions() =
      _InsufficientPermissions;
  const factory StoryFailure.unableToUpdate() = _UnableToUpdate;
}
