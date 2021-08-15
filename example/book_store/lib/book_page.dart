import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'models.dart';
import 'page_scaffold.dart';

class BookPage extends StatelessWidget {
  final String id;

  const BookPage({required this.id});

  @override
  Widget build(BuildContext context) {
    final book = BooksDatabase().books.firstWhere((book) => book.id == id);
    final state = RouteData.of(context).state;

    return PageScaffold(
      title: 'Book info',
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  book.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (state is String) Text(state),
                SizedBox(height: 20),
                Text(book.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
