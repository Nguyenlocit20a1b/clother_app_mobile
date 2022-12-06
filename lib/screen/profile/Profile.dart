import 'package:clothing_shop/screen/auth/login.dart';
import 'package:clothing_shop/screen/home/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../config/text_string.dart';
import 'Update_profile.dart';
import 'package:clothing_shop/config/app.styles.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrown,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen()),
              );
            }, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tProfile, style: kEncodeSansMedium.copyWith(
          color: kWhite,
        ) ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.bell))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: [
             const SizedBox(
                width: 130,
                height: 130,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:  AssetImage('assets/images/avata.jpg'),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color.fromARGB(255, 255, 191, 0)),
                    child: const Icon(

                      LineAwesomeIcons.camera,
                      color: Colors.black,
                      size: 20,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(tProfileHeading,
                  style: Theme.of(context).textTheme.headline6),
              Text(tProfileSubHeading,
                  style: Theme.of(context).textTheme.bodyText2),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 110,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UpdateProfile()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kBrown,
                      shadowColor: kBrown,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    tEditProfile,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Billing Details",
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "User Management",
                icon: LineAwesomeIcons.user_check,
                onPress: () {},
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "Information",
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onPress,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromARGB(255, 121, 121, 121).withOpacity(0.1)),
          child: Icon(
            icon,
            color: Color.fromARGB(255, 6, 143, 255),
          ),
        ),
        title: Text(this.title,
            style:
            Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
        trailing: endIcon
            ? Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromARGB(255, 121, 121, 121).withOpacity(0.1),
            ),
            child: const Icon(LineAwesomeIcons.angle_right,
                size: 18, color: Color.fromARGB(255, 6, 143, 255)))
            : null);
  }
}
