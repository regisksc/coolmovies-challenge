import 'package:coolmovies/main.dart' as app;
import 'package:coolmovies/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    '''
    WHEN app launches
    SHOULD show ListMoviesPage
    SHOULD have provider fetch current user
    SHOULD have provider fetch movies from repository
    ''',
    (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final multiProvider = find.byKey(const Key('globalProvider'));
      final pageHeader = find.byType(ListMoviesPageHeader);
      final moviesList = find.byType(MoviesList);

      expect(multiProvider, findsOneWidget);
      expect(pageHeader, findsOneWidget);
      expect(moviesList, findsOneWidget);
    },
  );
}
