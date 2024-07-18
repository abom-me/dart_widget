import 'package:dart_widget/dart_widget.dart';

Future<void> main() async {
  String? name = TextField(
      prompt: "Enter Your Name",
      hint: "ex: abom.me",
      validator: (String value) {
        if (value.length < 3) {
          throw ValidationErrors("Name must be at least 3 characters long");
        }
        return true;
      }).oneline();

  String? pass = TextField(
      prompt: "Enter your Password",
      validator: (String value) {
        if (value.length < 6) {
          throw ValidationErrors("Password must be at least 6 characters long");
        }
        return true;
      }).password();

  String? desc = TextField(prompt: "Enter your Description").multiline();

  final circle = CircleLoading(
    loadingText: "Please wait",
    onDoneText: "Thank you for waiting",
  );
  circle.start();
  await Future.delayed(Duration(seconds: 5), () {
    circle.stop();
  });

  print("Your name is: $name");
  print("Your password is: $pass");
  print("Your Description is: $desc");
}
