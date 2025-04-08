import 'package:flutter/material.dart';
import 'package:my_books/const/colors/app_colors.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/features/books/view/widgets/count_widget.dart';
import 'package:my_books/features/favourite/view/widgets/favourite_button.dart';
import 'package:my_books/shared/widget/book_image_widget.dart';

class FavoriteBookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const FavoriteBookCard({
    super.key,
    required this.book,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      // height: 120,
      decoration: BoxDecoration(
        color: AppColors.appWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey900.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(2, 16),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: BookImageWidget(
                  bookId: book.ia,
                  coverId: book.coverId ?? 0,
                  height: 100,
                  width: 70,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            book.title ?? 'Unknown Title',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person,
                                color: AppColors.grey400,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              Text(
                                book.authors?.first.name ?? 'Unknown Author',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.grey600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CountWidget(
                          icon: Icon(
                            Icons.calendar_month,
                            color: Colors.blue,
                            size: 15,
                          ),
                          text: '${book.firstPublishYear ?? "Unknown"}',
                        ),
                        const SizedBox(width: 8),
                        CountWidget(
                          icon: Icon(
                            Icons.menu_book,
                            color: Colors.green,
                            size: 15,
                          ),
                          text: '${book.editionCount ?? "Unknown"}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FavourriteButton(book: book, isFavPage: true),
            ],
          ),
        ),
      ),
    );
  }
}
