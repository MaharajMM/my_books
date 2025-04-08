import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/features/books/controller/books_pod.dart';
import 'package:my_books/features/books/state/recipes_state.dart';
import 'package:my_books/features/books/view/widgets/books_grid.dart';

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
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_paginationScrollListener);
  }

  void _paginationScrollListener() {
    if (!_isLoadingMore &&
        _scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
      _isLoadingMore = true;
      ref.read(booksProvider.notifier).loadNextPage().then((_) {
        _isLoadingMore = false;
      }).catchError((_) {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('MyBooks'),
      ),
      body: SafeArea(child: Consumer(
        builder: (context, ref, child) {
          final booksAsync = ref.watch(booksProvider);
          return booksAsync.when(
            data: (booksState) => switch (booksState) {
              BooksInitialState(:final books, :final hasMore) => BooksGrid(
                  books: books,
                  showLoadingMore: hasMore,
                  scrollController: _scrollController,
                ),
              LoadingBooksState() => const Center(
                  child: CircularProgressIndicator(),
                ),
              LoadingMoreBooksState(:final currentBooks) => BooksGrid(
                  books: currentBooks,
                  showLoadingMore: true,
                  scrollController: _scrollController,
                ),
              BooksLoadErrorState(:final error, :final lastKnownBooks) => Stack(
                  children: [
                    BooksGrid(
                      books: lastKnownBooks,
                      scrollController: _scrollController,
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Material(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red.shade900),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              BooksFetchErrorState(:final error) => Center(
                  child: Text('Error: $error'),
                ),
              NoBooksFoundState() => const Center(
                  child: Text('No Books found.'),
                ),
            },
            error: (error, stack) => Center(child: Text('Error: $error')),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
          // return booksAsync.easyWhen(
          //   data: (myBooksModel) {
          //     final books = myBooksModel.works;
          //     if (books != null && books.isNotEmpty) {
          //       return GridView.builder(
          //         padding: const EdgeInsets.all(16),
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           childAspectRatio: 0.6,
          //           crossAxisSpacing: 16,
          //           mainAxisSpacing: 16,
          //         ),
          //         itemCount: books.length,
          //         itemBuilder: (context, index) {
          //           return BookCard(
          //             book: books[index],
          //             onTap: () => context.pushRoute(BookDetailsRoute(book: books[index])),
          //             onFavoriteToggle: () {},
          //           );
          //         },
          //       );
          //     } else {
          //       return const Center(
          //         child: Text('No books available'),
          //       );
          //     }
          //   },
          //   loadingWidget: () => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          //   errorWidget: (error, stackTrace) => Center(
          //     child: Column(
          //       children: [
          //         Text(
          //           'Error: $error',
          //           style: const TextStyle(color: AppColors.kErrorColor),
          //         ),
          //         ElevatedButton(
          //           onPressed: () => ref.invalidate(booksProvider),
          //           child: Text('Retry'),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      )),
    );
  }
}
