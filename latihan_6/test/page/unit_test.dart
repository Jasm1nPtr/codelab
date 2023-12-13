import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:latihan_6/unit_testing/controllers/fetchpost.dart';
import 'package:latihan_6/unit_testing/models/post.dart';

void main() {
  group('fetchPosts', () {
    test('returns a Posts if the http call completes successfully', () async {
      final client = MockClient((request) async {
        // Mocking the http response
        return http.Response(
          '{"userId": 1, "id": 1, "title": "Test Title", "body": "Test Body"}',
          200,
        );
      });

      // Calling the function under test
      final result = await fetchPosts(client);

      // Expecting the result to be a Posts object
      expect(result, isA<Posts>());
      expect(result.userId, 1);
      expect(result.id, 1);
      expect(result.title, 'Test Title');
      expect(result.body, 'Test Body');
    });

    test('throws an exception if the http call completes with an error',
        () async {
      final client = MockClient((request) async {
        // Mocking the http response with an error status code
        return http.Response('Not Found', 404);
      });

      // Calling the function under test
      expect(() => fetchPosts(client), throwsException);
    });
  });
}
