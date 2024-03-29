import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/value_objects.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'book_dtos.freezed.dart';
part 'book_dtos.g.dart';

@freezed
abstract class BookDto implements _$BookDto {
  const BookDto._();

  const factory BookDto({
    // @JsonKey(includeToJson: true) String bookId, // check if this is needed
    required String bookId,
    required String bookName,
    required String authorName,
    required String description,
    required String language,
    required int pageCount,
    required int reviewCount,
    required double rating,
    required String imageUrl,
    required String category,
    required String publisher,
    required String publishDate,
    // @ServerTimestampConverter() required FieldValue serverTimestamp,
    @Default(false) bool liked,
  }) = _BookDto;

  factory BookDto.fromDomain(Book book) {
    return BookDto(
      bookId: book.bookId.getOrCrash(),
      bookName: book.bookName.getOrCrash(),
      authorName: book.authorName.getOrCrash(),
      description: book.description.getOrCrash(),
      language: book.language.getOrCrash(),
      pageCount: book.pageCount.getOrCrash(),
      reviewCount: book.reviewCount.getOrCrash(),
      rating: book.rating.getOrCrash(),
      imageUrl: book.imageUrl.getOrCrash(),
      category: book.category.getOrCrash(),
      publisher: book.publisher.getOrCrash(),
      publishDate: book.publishDate.getOrCrash(),
      // serverTimestamp: FieldValue.serverTimestamp(),
    );
  }

  Book toDomain() {
    return Book(
      bookId: UniqueId.fromUniqueString(bookId),
      bookName: BookName(bookName),
      authorName: AuthorName(authorName),
      description: Description(description),
      language: Language(language),
      pageCount: PageCount(pageCount),
      reviewCount: ReviewCount(reviewCount),
      rating: Rating(rating),
      imageUrl: ImageUrl(imageUrl),
      category: Category(category),
      publisher: Publisher(publisher),
      publishDate: PublishDate(publishDate),
    );
  }

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  factory BookDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['bookId'] = doc.id;
    return BookDto.fromJson(data);
  }

  // can maybe add a .fromdio function
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}
