import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

import 'api_test.mocks.dart';

@GenerateMocks([WidgetbookApi])
void main() {
  group('API', () {
    late WidgetbookApi widgetbookApi;
    widgetbookApi = MockWidgetbookApi();

    test('Greeting Success', () async {
      when(widgetbookApi.welcomeToWidgetbook(message: 'John Doe'))
          .thenAnswer((_) async => 'Welcome John Doe');
      expect(
        await widgetbookApi.welcomeToWidgetbook(message: 'John Doe'),
        'Welcome John Doe',
      );
    });
  });
}
