import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/core/router/router.gr.dart';
import 'package:my_books/features/favourite/controller/favourite_pod.dart';
import 'package:my_books/features/favourite/view/widgets/favourite_book_card.dart';

@RoutePage()
class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FavouriteView();
  }
}

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final favoriteBooks = ref.watch(favoriteBooksNotifierProvider);
            return favoriteBooks.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No favourites yet',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add books to your favourites',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: favoriteBooks.length,
                    itemBuilder: (context, index) {
                      final book = favoriteBooks[index];
                      return FavoriteBookCard(
                        book: book,
                        onTap: () => context.pushRoute(BookDetailsRoute(
                          book: book,
                          isFromFavorite: true,
                        )),
                        onRemove: () => {},
                      );
                    },
                  );
          },
        ));
  }
}
