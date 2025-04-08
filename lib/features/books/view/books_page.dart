import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/const/colors/app_colors.dart';
import 'package:my_books/core/router/router.gr.dart';
import 'package:my_books/features/books/controller/books_pod.dart';
import 'package:my_books/features/books/view/widgets/book_card.dart';
import 'package:my_books/shared/riverpod_ext/asynvalue_easy_when.dart';

@RoutePage()
class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BooksView();
  }
}

class BooksView extends ConsumerStatefulWidget {
  const BooksView({super.key});

  @override
  ConsumerState<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends ConsumerState<BooksView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColors.kprimaryColor.withValues(alpha: 0.1),
        title: const Text('MyBooks'),
      ),
      body: SafeArea(child: Consumer(
        builder: (context, ref, child) {
          final booksAsync = ref.watch(booksProvider);
          return booksAsync.easyWhen(
            data: (myBooksModel) {
              final books = myBooksModel.works;
              if (books != null && books.isNotEmpty) {
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return BookCard(
                      book: books[index],
                      onTap: () => context.pushRoute(BookDetailsRoute(book: books[index])),
                      onFavoriteToggle: () {},
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No books available'),
                );
              }
            },
            loadingWidget: () => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (error, stackTrace) => Center(
              child: Column(
                children: [
                  Text(
                    'Error: $error',
                    style: const TextStyle(color: AppColors.kErrorColor),
                  ),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(booksProvider),
                    child: Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
