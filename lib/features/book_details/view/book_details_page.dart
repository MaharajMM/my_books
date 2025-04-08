import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:my_books/data/model/my_books_model.dart';

@RoutePage()
class BookDetailsPage extends StatelessWidget {
  final Book book;
  const BookDetailsPage({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return BookDetailsView(book: book);
  }
}

class BookDetailsView extends StatelessWidget {
  final Book book;
  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
