import 'package:flutter/widgets.dart';
import 'package:my_books/shared/widget/cache_image_network_widget.dart';

class BookImageWidget extends StatelessWidget {
  final String? bookId;
  final int coverId;
  final bool isFromFavorite;
  final double? height;
  final double? width;
  final String tagSuffix;
  const BookImageWidget({
    super.key,
    this.bookId,
    required this.coverId,
    this.isFromFavorite = false,
    this.height = 180,
    this.width,
    this.tagSuffix = '',
  });

  @override
  Widget build(BuildContext context) {
    final tag = 'book_cover_${bookId ?? coverId}_$tagSuffix';
    return isFromFavorite
        ? CacheNetworkImageWidget(
            imageUrl: 'https://covers.openlibrary.org/b/id/$coverId-L.jpg',
            height: height,
            width: width ?? double.infinity,
            fit: BoxFit.cover,
          )
        : Hero(
            tag: tag,
            child: CacheNetworkImageWidget(
              imageUrl: 'https://covers.openlibrary.org/b/id/$coverId-L.jpg',
              height: height,
              width: width ?? double.infinity,
              fit: BoxFit.cover,
            ),
          );
  }
}
