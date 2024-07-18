part of '../dart_widget.dart';

class ValidationErrors implements Exception {
  final String message;

  ValidationErrors(this.message);
}

class TextField {
  final String _prompt;
  final String? _hint;
  final bool? _showText;

  /// The [validator] function is used to validate the input.
  final bool Function(String)? _validator;

  /// Constructs a [TextField] component with the default theme.
  /// [prompt] is the text to be displayed to the user.
  /// [hint] is the text to be displayed to the user as a hint.
  /// [showText] is a boolean value that determines whether to print the input text after user done.
  /// [validator] is a function to check if the text is validate or not NOTE: not working with the [password].

  TextField({
    required String prompt,
    String? hint,
    bool? showText,
    bool Function(String)? validator,
  })  : _prompt = prompt,
        _showText = showText,
        _hint = hint,
        _validator = validator;

  final Theme _theme = Theme.defaultTheme;
  final _console = Console();

  /// [oneline] This method is used to get a single line of text from the user.
  String? oneline() {
    stdout.write(
        '${_theme.defaultText(_prompt)}${_hint != null ? _theme.hintText(_hint) : ''}${_theme.valueText}');
    String? input = stdin.readLineSync();
    input = input?.isEmpty == true && _hint != null ? _hint : input;
    if (_validator != null) {
      try {
        if (!_validator(input!)) {
          throw ValidationErrors(
              _theme.errorText('Please throw ValidationErrors() for $input'));
        }
      } catch (e) {
        if (e is ValidationErrors) {
          print(_theme.errorText(e.message));
          return oneline();
        } else {
          print(_theme.errorText(e.toString()));
          return null;
        }
      }
    }
    if (_showText == true) {
      print(_theme.successText(input!));
    }
    return input;
  }





  /// [multiline] This method is used to get multiple lines of text from the user.
  String? multiline() {
    print(_theme.hintText("Press ENTER twice to Done"));
    print(
        '${_theme.defaultText(_prompt)}${_hint != null ? _theme.hintText(_hint) : ' '}${_theme.valueText}');
    String input = '';
    while (true) {
      final line = stdin.readLineSync();
      if (line == null || line.isEmpty) {
        break;
      }
      input += '$line\n';
    }
    if (_validator != null) {
      try {
        if (!_validator(input)) {
          throw ValidationErrors(
              _theme.errorText('Please throw ValidationErrors() for $input'));
        }
      } catch (e) {
        if (e is ValidationErrors) {
          print(_theme.errorText(e.message));
          return multiline();
        } else {
          print(_theme.errorText(e.toString()));
          return null;
        }
      }
    }
    return input;
  }

  /// [password] This method is used to get a password from the user the text will be hidden.
String? password()  {
    _console.hideCursor();
    stdout.write('${_theme.passwordText(_prompt)}${_hint != null ? _theme.hintText(_hint) : ''}: ');

    var passwordText = StringBuffer();
    stdin.echoMode = false;
    stdin.lineMode = false;

    try {
      while (true) {
        int charCode = stdin.readByteSync();

        if (charCode == 10 || charCode == 13) { // Enter key
          stdout.write('\n');

          break;
        } else if (charCode == 127) { // Backspace key
          if (passwordText.isNotEmpty) {
            stdout.write('\b \b'); // Move back, write space, move back again
            passwordText.writeCharCode(charCode);
          }
        } else {
          stdout.write('*'); // Mask input
          passwordText.writeCharCode(charCode);
        }
      }
    } finally {
      stdin.echoMode = true;
      stdin.lineMode = true;
      _console.showCursor();
    }

    if (_validator != null) {
      try {
        if (!_validator(passwordText.toString())) {
          throw ValidationErrors(
              _theme.errorText('Please throw ValidationErrors() for $passwordText'));
        }
      } catch (e) {
        if (e is ValidationErrors) {
          print(_theme.errorText(e.message));
          return password();
        } else {
          print(_theme.errorText(e.toString()));
          return null;
        }
      }
    }
    return passwordText.toString();
  }
}
