# dart_widget:


###  A Dart package help you to add command functions like the Widget in Flutter, for example, you can add a widget to the CircleLoading, TextField, and more. 

------------------
## # 👨‍💻 *Developed  by:*

<img alt="profile" src="https://abom.me/packages/profile.png" width="50" height="50"  style=" border-radius: 100%"/>

**Nasr Al-Rahbi [@abom_me](https://twitter.com/abom_me)**

## 👨🏻‍💻 Find me in  :
[![Twitter](https://img.shields.io/badge/Twitter-%231DA1F2.svg?logo=Twitter&logoColor=white)](https://twitter.com/abom_me)
[![Instagram](https://img.shields.io/badge/Instagram-%23E4405F.svg?logo=Instagram&logoColor=white)](https://instagram.com/abom.me)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?logo=linkedin&logoColor=white)](https://linkedin.com/in/nasr-al-rahbi-08a573245)
[![Stack Overflow](https://img.shields.io/badge/-Stackoverflow-FE7A16?logo=stack-overflow&logoColor=white)](https://stackoverflow.com/users/19994059/nasr-al-rahbi)

---------------
<br>

- Text Field
  * Password Field
  * One Line Field
  * Multi Line Field
  
- Circle Loading


## Setup

Pubspec changes:

```
      dependencies:
        dart_widget: <last_version>
```
Sample example:

```dart
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
    print(name);
}
```

### TextField Password Field
```dart

import 'package:dart_widget/dart_widget.dart';
Future<void> main() async {
  String? password = TextField(
      prompt: "Enter Your Password",
      hint: "ex: 123456",
      validator: (String value) {
        if (value.length < 6) {
          throw ValidationErrors("Password must be at least 6 characters long");
        }
        return true;
      }).password();
    print(password);
}
```

### TextField Multi Line Field
```dart

import 'package:dart_widget/dart_widget.dart';
Future<void> main() async {
  String? desc = TextField(prompt: "Enter your Description").multiline();
    print(desc);
}
```

### Circle Loading
```dart
import 'package:dart_widget/dart_widget.dart';
Future<void> main() async {

  final circle = CircleLoading(
    loadingText: "Please wait",
    onDoneText: "Thank you for waiting",
  );
  circle.start();
  await Future.delayed(Duration(seconds: 5), () {
    circle.stop();
  });
}
```
