import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:profile_app/main.dart';

Widget createHomeScreen() => ChangeNotifierProvider<User>(
      create: (context) => User(
        firstName: 'Micah',
        lastName: 'Smith',
        phone: '208-206-5039',
        email: 'micahsmith@gmail.com',
        bio:
            'Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty',
      ),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );

void main() {
  group('Testing Home Screen', () {
    testWidgets('Testing for correct initial content', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      // Test for Correct Title Text
      final titleFinder = find.text("Edit Profile");
      expect(titleFinder, findsOneWidget);

      // Test for Correct Name label and inital Name value
      final nameFinder = find.text("Name");
      final nameInit = find.widgetWithText(ListTile, "Micah Smith");
      expect(nameFinder, findsOneWidget);
      expect(nameInit, findsOneWidget);

      // Test for Correct Phone label and inital Phone value
      final phoneFinder = find.text("Phone");
      final phoneInit = find.widgetWithText(ListTile, "208-206-5039");
      expect(phoneFinder, findsOneWidget);
      expect(phoneInit, findsOneWidget);

      // Test for Correct Email label and inital Email value
      final emailFinder = find.text("Email");
      final emailInit = find.widgetWithText(ListTile, "micahsmith@gmail.com");
      expect(emailFinder, findsOneWidget);
      expect(emailInit, findsOneWidget);

      // Test for Correct Bio label and inital Bio value
      final bioFinder = find.text("Tell us about yourself");
      final bioInit = find.widgetWithText(ListTile,
          "Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty");
      expect(bioFinder, findsOneWidget);
      expect(bioInit, findsOneWidget);
    });

    testWidgets('Testing for Name Page form fields', (tester) async {
      await tester.pumpWidget(createHomeScreen());

      // Finding the List Tile with the User's name
      final nameInit = find.widgetWithText(ListTile, "Micah Smith");

      // Tap on the ListTile to Navigate to the ProfileFieldPage for Name
      await tester.tap(nameInit);
      await tester.pumpAndSettle();

      // Test to make sure you have a correct ProfileFieldPage Widget
      expect(find.byType(ProfileFieldPage), findsOneWidget);

      // Test for TextFormFields that hold first and last name
      final fNameField = find.widgetWithText(TextFormField, "Micah");
      final lNameField = find.widgetWithText(TextFormField, "Smith");
      expect(fNameField, findsOneWidget);
      expect(lNameField, findsOneWidget);
    });
  });
}
