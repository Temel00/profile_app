import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profile_app/firebase_options.dart';
import 'package:profile_app/profile_avatar.dart';
import 'package:profile_app/profile_field.dart';
import 'package:profile_app/profile_field_page.dart';

// Creating a User Object
class User extends ChangeNotifier {
  String firstName;
  String lastName;
  String phone;
  String email;
  String bio;
  String image;

  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.bio,
    required this.image,
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final MaterialColor primaryColor =
      const MaterialColor(0xff4169e1, <int, Color>{
    50: Color.fromRGBO(248, 248, 248, 1),
    100: Color.fromRGBO(198, 210, 246, 1),
    200: Color.fromRGBO(154, 175, 239, 1),
    300: Color.fromRGBO(109, 140, 232, 1),
    400: Color.fromRGBO(65, 105, 225, 1),
    500: Color.fromRGBO(32, 76, 207, 1),
    600: Color.fromRGBO(25, 59, 163, 1),
    700: Color.fromRGBO(19, 44, 119, 1),
    800: Color.fromRGBO(12, 28, 75, 1),
    900: Color.fromRGBO(5, 11, 31, 1),
  });

  @override
  Widget build(BuildContext context) {
    // Building Global App Themes
    return MaterialApp(
      title: "Profile App",
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[50],
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: primaryColor,
            backgroundColor: Colors.white,
            accentColor: Colors.grey[350]),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.notoSansKr(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          displayMedium: GoogleFonts.notoSansKr(
              fontSize: 22, fontWeight: FontWeight.w700, color: primaryColor),
          bodyMedium: GoogleFonts.barlowCondensed(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          labelMedium: GoogleFonts.notoSansKr(
            fontSize: 12,
            height: 2,
            color: Colors.grey[400],
          ),
          bodySmall: GoogleFonts.barlowSemiCondensed(
            fontSize: 18,
            height: 2,
            fontWeight: FontWeight.w600,
          ),
          labelSmall: GoogleFonts.notoSansKr(
            fontSize: 16,
            color: Colors.grey[400],
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// Application Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User user;

  @override
  void initState() {
    super.initState();

    // Initialize a User with values in State
    user = User(
        firstName: 'Micah',
        lastName: 'Smith',
        phone: '208-206-5039',
        email: 'micahsmith@gmail.com',
        bio:
            'Hi my name is Mica Smith. I am from Mesa but go to school in Salt Lake City. I make this drive all the time and have plenty',
        image:
            'https://firebasestorage.googleapis.com/v0/b/profile-demo-53d30.appspot.com/o/headshot_ph.jpg?alt=media&token=3c1658a9-8378-471f-87a4-9f0d8f4fb8fe');
  }

  // Callback function to update user object in state based on field name
  void updateUser(String updateVal1, String updateVal2, String field) {
    setState(() {
      if (field == "name") {
        user.firstName = updateVal1;
        user.lastName = updateVal2;
      }
      if (field == "phone") {
        user.phone = updateVal1;
      }
      if (field == "email") {
        user.email = updateVal1;
      }
      if (field == "bio") {
        user.bio = updateVal1;
      }
      if (field == "image") {
        user.image = updateVal1;
      }
    });
  }

  // Home Screen Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      // Top Margin
      const SizedBox(height: 60),
      // Page Header Text
      Text(
        "Edit Profile",
        style: Theme.of(
          context,
        ).textTheme.displayMedium,
      ),
      const SizedBox(height: 20),
      // Circular Profile Image with Edit Icon
      ProfileAvatar(imageURL: user.image),
      // List View with Name, Phone, Email, and Bio Tiles
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            shrinkWrap: true,
            children: ListTile.divideTiles(
                color: Theme.of(context).colorScheme.secondary,
                context: context,
                tiles: [
                  // Name ListTile navigates to 'name' ProfileFieldPage passing user first and last name
                  ListTile(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileFieldPage(
                            initialValue1: user.firstName,
                            initialValue2: user.lastName,
                            field: "name",
                            updateUserCallback: updateUser,
                          ),
                        ),
                      );
                    },
                    // Forward arrow Icon
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    contentPadding: EdgeInsets.zero,
                    // Name Title and Label
                    title: ProfileField(
                        fieldLabel: "Name",
                        fieldValue: "${user.firstName} ${user.lastName}"),
                  ),
                  // Phone ListTile navigates to 'phone' ProfileFieldPage passing user phone
                  ListTile(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileFieldPage(
                            initialValue1: user.phone,
                            initialValue2: '',
                            field: "phone",
                            updateUserCallback: updateUser,
                          ),
                        ),
                      );
                    },
                    // Forward Arrow Icon
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    contentPadding: EdgeInsets.zero,
                    // Phone Title and Label
                    title: ProfileField(
                        fieldLabel: "Phone", fieldValue: user.phone),
                  ),
                  // Email ListTile navigates to 'email' ProfileFieldPage passing user email
                  ListTile(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileFieldPage(
                            initialValue1: user.email,
                            initialValue2: '',
                            field: "email",
                            updateUserCallback: updateUser,
                          ),
                        ),
                      );
                    },
                    // Forward Arrow Icon
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    contentPadding: EdgeInsets.zero,
                    // Email Title and Label
                    title: ProfileField(
                        fieldLabel: "Email", fieldValue: user.email),
                  ),
                  // Bio ListTile navigates to 'bio' ProfileFieldPage passing user bio
                  ListTile(
                    iconColor: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileFieldPage(
                            initialValue1: user.bio,
                            initialValue2: '',
                            field: "bio",
                            updateUserCallback: updateUser,
                          ),
                        ),
                      );
                    },
                    // Forward Arrow Icon
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    contentPadding: EdgeInsets.zero,
                    // Profile Title and Label
                    title: ProfileField(
                        fieldLabel: "Tell us about yourself",
                        fieldValue: user.bio),
                  ),
                ]).toList(),
          ),
        ),
      ),
    ]));
  }
}

// Loading Widget
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loading...")),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Loading your profile")],
      ),
    );
  }
}

// Application Error Screen
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error Screen")),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "There has been an error",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
