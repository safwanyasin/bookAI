import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/book_failure.dart';
import 'package:book_ai/domain/book/i_book_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'book_actor_state.dart';
part 'book_actor_cubit.freezed.dart';

@injectable
class BookActorCubit extends Cubit<BookActorState> {
  final IBookRepository _bookRepository;

  BookActorCubit(this._bookRepository) : super(const BookActorState.initial());

  // deletes a book by calling the relevant function from the repository in the infrastructure layer and handles the response
  Future<void> delete(Book book, bool fromWishlist) async {
    emit(const BookActorState.actionInProgress());
    final possibleFailure = await _bookRepository.delete(book, fromWishlist);
    emit(
      possibleFailure.fold(
        (f) => BookActorState.deleteFailure(f),
        (_) => const BookActorState.deleteSuccess(),
      ),
    );
  }
}
