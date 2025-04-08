import 'package:flutter/material.dart';
import 'package:my_books/const/colors/app_colors.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/features/books/view/widgets/count_widget.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const BookCard({
    super.key,
    required this.book,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'book_cover_${book.ia}',
                  child: Image.network(
                    'https://covers.openlibrary.org/b/id/${book.coverId}-L.jpg',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title ?? 'Unknown Title',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
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
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  book.authors?.first.name ?? 'Unknown Author',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.grey600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Row(
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
