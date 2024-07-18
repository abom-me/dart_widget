import 'package:dart_widget/dart_widget.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final textField = TextField(prompt: "prompt");

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(textField.oneline(), "nasr");
    });
  });
}
