import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:counter/album/model/album_model.dart';
import 'package:http/http.dart' as http;

///*WARNING: Keep baseUrl in a seperate file while working on production*
///
class ApiEndpoints {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String albums = '$_baseUrl/albums';
}

class AlbumRepository {
  AlbumRepository();

  /// Fetches a list of albums from the JSONPlaceholder API.
  ///
  /// Usese the provided [client] to make the HTTP request to the API.
  /// The [client] parameter should be an instance of `http.Client`.
  ///
  /// Returns a [Future] that completes with a list of [AlbumModel] if the request
  /// is successful (status code 200)
  ///
  /// Throws"
  /// - [Exception] with message 'Could not fetch' if the response status code is not 200
  /// - [Error] if any other error occurs during the request or parsing
  ///
  /// Example:
  /// ```dart
  /// final client = http.Client();
  /// try{
  ///   final albums = await fetchAlbums(client);
  /// } finally() {
  ///   client.close();
  /// }
  /// ```
  Future<List<AlbumModel>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse(ApiEndpoints.albums))
        .timeout(Duration(seconds: 10));
    try {
      if (response.statusCode == 200) {
        ///If the server did return 200
        ///Then parse the JSON
        final List<dynamic> albumList = await jsonDecode(response.body);
        return albumList.map((e) => AlbumModel.fromJson(e)).toList();
      } else {
        // throw Exception('Could not fetch');
        throw http.ClientException(
          'Failed to load albums (Status: ${response.statusCode})',
          Uri.parse(ApiEndpoints.albums),
        );
      }
    } on TimeoutException {
      throw TimeoutException('Request time out after 10 seconds');
    } on SocketException {
      throw Exception('No Internet connection');
    } on FormatException {
      throw Exception('Invalid JSON response');
    } on http.ClientException {
      rethrow; //Re-throw HTTP-specific errors
    } catch (e) {
      throw Exception('Unexpected errr: $e');
    }
  }
}
