import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import './locations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.blue[300],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => context.beamToNamed('/books'),
                  child: Text('Books'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => context.beamToNamed('/articles'),
                  child: Text('Articles'),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.blue),
          if (context.currentBeamLocation.state.uri.path.isEmpty)
            Expanded(
              child: Container(
                child: Center(
                  child: Text('Home'),
                ),
              ),
            )
          else
            Expanded(
              child: Beamer(
                routerDelegate: BeamerRouterDelegate(
                  locationBuilder: (state) {
                    if (state.uri.pathSegments.contains('articles')) {
                      return ArticlesLocation(state);
                    }
                    return BooksLocation(state);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.blue[300],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => context.beamToNamed('/books/authors'),
                  child: Text('Book Authors'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => context.beamToNamed('/books/genres'),
                  child: Text('Book Genres'),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.blue),
          Expanded(
            child: Beamer(
              routerDelegate: BeamerRouterDelegate(
                locationBuilder: (state) => BooksContentLocation(state),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BooksHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books Home'),
      ),
    );
  }
}

class BookAuthorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Authors'),
      ),
    );
  }
}

class BookGenresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Genres'),
      ),
    );
  }
}

class ArticlesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.blue[300],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => context.beamToNamed('/articles/authors'),
                  child: Text('Article Authors'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => context.beamToNamed('/articles/genres'),
                  child: Text('Article Genres'),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.blue),
          Expanded(
            child: Beamer(
              routerDelegate: BeamerRouterDelegate(
                locationBuilder: (state) => ArticlesContentLocation(state),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticlesHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles Home'),
      ),
    );
  }
}

class ArticleAuthorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Authors'),
      ),
    );
  }
}

class ArticleGenresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Genres'),
      ),
    );
  }
}
