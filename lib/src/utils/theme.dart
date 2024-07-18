import 'package:tint/tint.dart';

/// [Function] takes a [String] and returns a [String].
///
/// Used for styling texts in the [Theme].
typedef StyleFunction = String Function(String);

class Theme {
  StyleFunction promoText;
  StyleFunction hintText;
  StyleFunction successText;
  StyleFunction errorText;
  String valueText;
  StyleFunction defaultText;
  StyleFunction passwordText;
  Theme({
    required this.promoText,
    required this.hintText,
    required this.successText,
    required this.errorText,
    required this.valueText,
    required this.defaultText,
    required this.passwordText,
  });

  static final Theme defaultTheme = Theme(
    promoText: (text) => text.cyan(),
    hintText: (text) => " ($text)".yellow(),
    successText: (text) => "✅ $text".green(),
    errorText: (text) => "❌ $text".red(),
    valueText: "‣ ".yellow(),
    defaultText: (text) => text.replaceAll("@", "").white(),
    passwordText: (text) => "🔒 $text".white(),
  );
}
