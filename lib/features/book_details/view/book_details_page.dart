import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_books/const/colors/app_colors.dart';
import 'package:my_books/data/model/my_books_model.dart';
import 'package:my_books/features/book_details/view/widgets/book_details_row.dart';
import 'package:my_books/features/favourite/view/widgets/favourite_button.dart';
import 'package:my_books/shared/widget/book_image_widget.dart';

@RoutePage()
class BookDetailsPage extends StatelessWidget {
  final Book book;
  final bool isFromFavorite;
  const BookDetailsPage({
    super.key,
    required this.book,
    this.isFromFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return BookDetailsView(book: book, isFromFavorite: isFromFavorite);
  }
}

class BookDetailsView extends StatelessWidget {
  final bool isFromFavorite;
  final Book book;
  const BookDetailsView({
    super.key,
    required this.isFromFavorite,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            leadingWidth: 50,
            leading: GestureDetector(
              onTap: () => context.maybePop(),
              child: Container(
                margin: EdgeInsets.only(left: 16),
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.kprimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: AppColors.appWhite,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: FavourriteButton(book: book),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: BookImageWidget(
                bookId: book.ia,
                coverId: book.coverId ?? 0,
                isFromFavorite: isFromFavorite,
                tagSuffix: isFromFavorite ? 'detail' : 'list',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title ?? 'Unknown Title',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'by ${book.authors?.first.name ?? 'Unknown Author'}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.subject?.take(6).join(', ') ?? 'No description available',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  BookDetailsRow(label: 'Published', value: '${book.firstPublishYear}'),
                  BookDetailsRow(label: 'Language', value: 'English'), // Assuming English
                  BookDetailsRow(label: 'Edition Count', value: '${book.editionCount}'),
                  BookDetailsRow(
                    label: 'Read Online',
                    value: book.availability?.isReadable == true ? 'Yes' : 'No',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
