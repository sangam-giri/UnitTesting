# Example Project
This project contains an example of unit test on a basic method and APIs

### Packages Used
- mokito (mockito used for creating test dependencies)
- build_runner (used for code generation)

### Commands 
- Code Generation
```
dart run build_runner build --delete-conflicting-outputs
```
- Testing (unit)
```
flutter test/<test_file>.dart
```
- Testing (Group)
```
flutter test --plain-name "<Group Name>"
```
