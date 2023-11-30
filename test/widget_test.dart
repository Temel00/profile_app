import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:profile_app/main.dart';
import 'package:profile_app/profile_field_page.dart';

Widget createHomeScreen() => ChangeNotifierProvider<User>(
      create: (context) => User(
          firstName: 'Micah',
          lastName: 'Smith',
          phone: '208-206-5039',
          email: 'micahsmith@gmail.com',
          bio:
              'Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty',
          image:
              'https://firebasestorage.googleapis.com/v0/b/profile-demo-53d30.appspot.com/o/headshot_ph.jpg?alt=media&token=3c1658a9-8378-471f-87a4-9f0d8f4fb8fe'),
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
      final phoneTile = find.widgetWithText(ListTile, "208-206-5039");
      expect(phoneFinder, findsOneWidget);
      expect(phoneTile, findsOneWidget);

      // Test for Correct Email label and inital Email value
      final emailFinder = find.text("Email");
      final emailTile = find.widgetWithText(ListTile, "micahsmith@gmail.com");
      expect(emailFinder, findsOneWidget);
      expect(emailTile, findsOneWidget);

      // Test for Correct Bio label and inital Bio value
      final bioFinder = find.text("Tell us about yourself");
      final bioTile = find.widgetWithText(ListTile,
          "Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty");
      expect(bioFinder, findsOneWidget);
      expect(bioTile, findsOneWidget);
    });
  });
  group('Testing ProfileFieldPages', () {
    testWidgets(
        'Testing correct conditional form field and user input for Name Page',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());

      // Finding the List Tile with the User's name
      final nameTile = find.widgetWithText(ListTile, "Micah Smith");

      // Tap on the ListTile to Navigate to the ProfileFieldPage for Name
      await tester.tap(nameTile);
      await tester.pumpAndSettle();

      // Test to make sure you have a correct ProfileFieldPage Widget
      expect(find.byType(ProfileFieldPage), findsOneWidget);

      // Test for TextFormFields that hold first and last name
      final fNameField = find.widgetWithText(TextFormField, "Micah");
      final lNameField = find.widgetWithText(TextFormField, "Smith");
      expect(fNameField, findsOneWidget);
      expect(lNameField, findsOneWidget);

      // Add new text to both first and last name fields
      await tester.enterText(fNameField, "first test");
      await tester.enterText(lNameField, "last test");

      // Find and tap the update button
      final updateButton = find.widgetWithText(ElevatedButton, "Update");
      await tester.tap(updateButton);
      await tester.pumpAndSettle();

      // Find new Tile based on updated first and last name text
      final newNameTile = find.widgetWithText(ListTile, "first test last test");
      expect(newNameTile, findsOneWidget);
    });

    // Testing for Phone Page
    testWidgets(
        'Testing correct conditional form field and user input for Phone Page',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());

      // Finding the List Tile with the User's phone
      final phoneTile = find.widgetWithText(ListTile, "208-206-5039");

      // Tap on the ListTile to Navigate to the ProfileFieldPage for Phone
      await tester.tap(phoneTile);
      await tester.pumpAndSettle();

      // Test to make sure you have a correct ProfileFieldPage Widget
      expect(find.byType(ProfileFieldPage), findsOneWidget);

      // Test for TextFormField that holds phone
      final phoneField = find.widgetWithText(TextFormField, "208-206-5039");
      expect(phoneField, findsOneWidget);

      // Add text to the phone form field
      await tester.enterText(phoneField, "phone field test");

      // Grab the updateButton and Tap it
      final updateButton = find.widgetWithText(ElevatedButton, "Update");
      await tester.tap(updateButton);
      await tester.pumpAndSettle();

      // Find the tile with new phone text
      final newPhoneTile = find.widgetWithText(ListTile, "phone field test");
      expect(newPhoneTile, findsOneWidget);
    });

    // Testing for Email Page
    testWidgets(
        'Testing correct conditional form field and user input for Email Page',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());

      // Finding the List Tile with the User's email
      final emailTile = find.widgetWithText(ListTile, "micahsmith@gmail.com");

      // Tap on the ListTile to Navigate to the ProfileFieldPage for Email
      await tester.tap(emailTile);
      await tester.pumpAndSettle();

      // Test to make sure you have a correct ProfileFieldPage Widget
      expect(find.byType(ProfileFieldPage), findsOneWidget);

      // Test for TextFormField that holds email
      final emailField =
          find.widgetWithText(TextFormField, "micahsmith@gmail.com");
      expect(emailField, findsOneWidget);

      // Add text to the email form field
      await tester.enterText(emailField, "email field test");

      // Grab the updateButton and Tap it
      final updateButton = find.widgetWithText(ElevatedButton, "Update");
      await tester.tap(updateButton);
      await tester.pumpAndSettle();

      // Find the tile with new email text
      final newEmailTile = find.widgetWithText(ListTile, "email field test");
      expect(newEmailTile, findsOneWidget);
    });

    // Testing for Bio Page
    testWidgets(
        'Testing correct conditional form field and user input for Bio Page',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());

      // Finding the List Tile with the User's bio
      final bioTile = find.widgetWithText(ListTile,
          "Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty");

      // Tap on the ListTile to Navigate to the ProfileFieldPage for Bio
      await tester.tap(bioTile);
      await tester.pumpAndSettle();

      // Test to make sure you have a correct ProfileFieldPage Widget
      expect(find.byType(ProfileFieldPage), findsOneWidget);

      // Test for TextFormField that holds bio
      final bioField = find.widgetWithText(TextFormField,
          "Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty");
      expect(bioField, findsOneWidget);

      // Add text to the bio form field
      await tester.enterText(bioField, "bio field test");

      // Grab the updateButton and Tap it
      final updateButton = find.widgetWithText(ElevatedButton, "Update");
      await tester.tap(updateButton);
      await tester.pumpAndSettle();

      // Find the tile with new bio text
      final newBioTile = find.widgetWithText(ListTile, "bio field test");
      expect(newBioTile, findsOneWidget);
    });
  });
}
