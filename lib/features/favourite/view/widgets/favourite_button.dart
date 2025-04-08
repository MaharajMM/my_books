import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/const/colors/app_colors.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/features/favourite/controller/favourite_pod.dart';
import 'package:velocity_x/velocity_x.dart';

class FavourriteButton extends StatelessWidget {
  final Book book;
  const FavourriteButton({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final favorites = ref.watch(favoriteBooksProvider);
        final isFav = favorites.any((b) => b.key == book.key);

        return GestureDetector(
          onTap: () {
            ref.read(favoriteBooksProvider.notifier).toggleFavorite(book);
            HapticFeedback.lightImpact();
            Feedback.forTap(context);
            context.showToast(
              msg: '${isFav ? 'Removed from' : 'Added to'} favorites',
            );
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.appWhite,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? Colors.red : Colors.black,
              size: 20,
            ),
          ),
        );
      },
    );
  }
}
