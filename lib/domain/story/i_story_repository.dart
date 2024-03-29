import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/story_failure.dart';
import 'package:book_ai/infrastructure/story/story_dtos.dart';
import 'package:dartz/dartz.dart';

abstract class IStoryRepository {
  Stream<Either<StoryFailure, List<StoryItem>>> watchAll();
  // Future<Either<StoryFailure, List<StoryItem>>> get();
  Future<Either<StoryFailure, StoryDto>> createSaveAndGet(String searchParams);
  Future<Either<StoryFailure, Unit>> delete(StoryItem story);
}
