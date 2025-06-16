import 'package:counter/album/model/album_model.dart';
import 'package:counter/album/repo/fetch_album.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'fetch_album_test.mocks.dart';

/// Generate mocks
@GenerateMocks([http.Client])
void main() {
  late final MockClient mockClient;
  late final AlbumRepository albumRepository;
  late final albumTestJson = '''
[
  {
    "userId": 1,
    "id": 1,
    "title": "quidem molestiae enim"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "sunt qui excepturi placeat culpa"
  }]
''';

  setUp(() {
    mockClient = MockClient();
    albumRepository = AlbumRepository();
  });
  group('AlbumRepository', () {
    test('returns data if the http call completes successfully', () async {
      when(mockClient.get(Uri.parse(ApiEndpoints.albums))).thenAnswer((
        realInvocation,
      ) async {
        return http.Response(albumTestJson, 200);
      });

      expect(await albumRepository.fetchAlbum(), isA<List<AlbumModel>>());
    });
  });
}
