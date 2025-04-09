import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_books/const/colors/app_colors.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/features/favourite/controller/favourite_pod.dart';
import 'package:my_books/shared/helper/global_helper.dart';

class FavourriteButton extends StatefulWidget {
  final Book book;
  final bool isFavPage;
  const FavourriteButton({
    super.key,
    required this.book,
    this.isFavPage = false,
  });

  @override
  State<FavourriteButton> createState() => _FavourriteButtonState();
}

class _FavourriteButtonState extends State<FavourriteButton> with GlobalHelper {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final favorites = ref.watch(favoriteBooksNotifierProvider);
        final isFav = favorites.any((b) => b.key == widget.book.key);
        return GestureDetector(
          onTap: () {
            ref.read(favoriteBooksNotifierProvider.notifier).toggleFavorite(widget.book);
            HapticFeedback.lightImpact();
            Feedback.forTap(context);
            if (isFav) {
              showErrorSnack(child: Text('Removed from favorites'));
            } else {
              showSuccessSnack(child: Text('Added to favorites'));
            }
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
              size: widget.isFavPage ? 30 : 20,
            ),
          ),
        );
      },
    );
  }
}
