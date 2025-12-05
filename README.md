- d folder has inheritance, enum, some basic pictures structure, private instance 
- sample folder has list tile of fruits 
- async folder has two counter app and async streams files
- program is assignment 1 part with calculator dart etc
- theoryclass2 has movies tile format file and build image column/row view(8 pics roblox meme)
- sqlitedemo has db, queries, and navigations
- jsondemocontinue contains navigations and fetching json file
- apicode contains fetching http restful api from json website and yaml edited with http: any 
- diceapp has dices app, drowpdown, volume
- secondfirebase contains all firebase works
- sampledemo contains datepicker, image capture, and apps launcher like phone call

  ### Issues Fix
  ```gradle
  - if version compile options try :
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    } 
```code
String? validateCredentials(String email, String password) {
  // ---------- EMAIL CHECK ----------
  // Must contain one '@'
  if (!email.contains('@')) {
    return 'Email must contain @';
  }

  int atIndex = email.indexOf('@');
  int lastAtIndex = email.lastIndexOf('@');

  // Multiple @ signs
  if (atIndex != lastAtIndex) {
    return 'Email cannot contain more than one @';
  }

  // @ cannot be first or last
  if (atIndex == 0 || atIndex == email.length - 1) {
    return 'Invalid email format';
  }

  // Must contain '.' after '@'
  String domain = email.substring(atIndex + 1);
  if (!domain.contains('.')) {
    return 'Email must contain a dot (.) in the domain';
  }

  // Domain cannot start or end with '.'
  if (domain.startsWith('.') || domain.endsWith('.')) {
    return 'Invalid email domain format';
  }

  // ---------- PASSWORD CHECK ----------
  if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }

  return null; // Valid
}
final result = validateCredentials("test@example.com", "mypassword");

if (result != null) {
  print(result);
} else {
  print("Valid!");
}
