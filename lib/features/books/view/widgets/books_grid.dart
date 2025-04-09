import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/core/router/router.gr.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/features/books/view/widgets/book_card.dart';

class BooksGrid extends ConsumerWidget {
  final List<Book> books;
  final bool showLoadingMore;
  final ScrollController scrollController;
  const BooksGrid({
    super.key,
    required this.books,
    this.showLoadingMore = false,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: books.length + (showLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (books.length == index) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return BookCard(
          book: books[index],
          onTap: () => context.pushRoute(BookDetailsRoute(book: books[index])),
        );
      },
    );
  }
}
