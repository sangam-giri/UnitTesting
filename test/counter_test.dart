import 'package:counter/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Test start, increment, decrement', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('Count must be decreased', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
