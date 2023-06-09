import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_tracking_portal/login/provider/login_provider.dart';

import '../core/constants/color_constants.dart';
import '../core/widgets/app_button_widget.dart';
import '../core/widgets/input_widget.dart';
import '../customer_admin_screens/home_screen/customer_admin_home.dart';
import '../home_screen.dart';
import '../product_admin_screens/providers/customer_provider.dart';
import 'components/slider_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  bool isLoading = false;
  bool isShow = false;
  bool check = false;
  final _firestoreInstance = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var tweenLeft =
      Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0)).chain(CurveTween(curve: Curves.ease));
  var tweenRight =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(2, 0)).chain(CurveTween(curve: Curves.ease));

  AnimationController? _animationController;

  var _isMoved = false;

  bool isChecked = false;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: Colors.white,
                child: const SliderWidget(),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                color: bgColor,
                child: Center(
                  child: Card(
                    //elevation: 5,
                    color: bgColor,
                    child: Container(
                      padding: const EdgeInsets.all(42),
                      width: MediaQuery.of(context).size.width / 3.6,
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            "asset/images/logo.png",
                            height: 200,
                            width: 200,
                          ),
                          const SizedBox(height: 5.0),
                          //Flexible(
                          //  child: _loginScreen(context),
                          //),
                          Flexible(
                            child: Stack(
                              children: [
                                SlideTransition(
                                  position: _animationController!.drive(tweenRight),
                                  child: Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
                                    //todo:Login function call here
                                    _loginScreen(context),
                                  ]),
                                ),
                                SlideTransition(
                                  position: _animationController!.drive(tweenLeft),
                                  child: Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
                                    //todo:regester function call here
                                    _registerScreen(context),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _registerScreen(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },

              topLabel: "Name",

              hintText: "Enter Name",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            const SizedBox(height: 8.0),
            InputWidget(
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },

              topLabel: "Email",

              hintText: "Enter E-mail",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            const SizedBox(height: 8.0),
            InputWidget(
              topLabel: "Password",
              obscureText: true,
              hintText: "Enter Password",
              onSaved: (String? uPassword) {},
              onChanged: (String? value) {},
              validator: (String? value) {
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            AppButton(
              type: ButtonType.PRIMARY,
              text: "Sign Up",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text("Remember Me")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_isMoved) {
                        _animationController!.reverse();
                      } else {
                        _animationController!.forward();
                      }
                      _isMoved = !_isMoved;
                    },
                    child: Text("Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w400, color: greenColor)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _loginScreen(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);
    var customerProvider = Provider.of<CustomerProvider>(context);
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 0.0,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputWidget(
              kController: emailController,
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              onChanged: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },

              topLabel: "Email",

              hintText: "Enter E-mail",
              // prefixIcon: FlutterIcons.chevron_left_fea,
            ),
            const SizedBox(height: 8.0),
            InputWidget(
              kController: passwordController,
              topLabel: "Password",
              obscureText: true,
              hintText: "Enter Password",
              onSaved: (String? uPassword) {},
              onChanged: (String? value) {},
              validator: (String? value) {
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            AppButton(
              type: ButtonType.PRIMARY,
              text: "Sign ",
              onPressed: () async {
                await signInWithEmailPassword(emailController.text.toString(), passwordController.text.toString(),
                        loginProvider, customerProvider)
                    .then((value) => print(''));
              },
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text("Remember Me")
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forget Password?",
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greenColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet?",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_isMoved) {
                        _animationController!.reverse();
                      } else {
                        _animationController!.forward();
                      }
                      _isMoved = !_isMoved;
                    },
                    child: Text("Sign up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w400, color: greenColor)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<User?> signInWithEmailPassword(
      String email, String password, LoginProvider loginProvider, CustomerProvider customerProvider) async {
    // this condition use for product admin login
    if (email == 'padmin@gmail.com' && password == 'padmin@202') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
    // else check other user if user not product admin
    else {
      // these are providers used for gsetting data

      //  var branchProvider = Provider.of<BranchProvider>(context, listen: false);
      await Firebase.initializeApp();
      User? user;
      // this function use for sign in by using firebase auth
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        user = userCredential.user;
        // if user exist in fireauth and then check what is the role of crunnt user role in fireauth
        if (user != null) {
          String userid = user.uid;
          _firestoreInstance.collection('Users').doc(userid).get().then((DocumentSnapshot docs) {
            final data = docs.data() as Map<String, dynamic>;
            String role = data['userRole'];
            String customerId = data['customerId'].toString();
            String userName = data['userName'];

            // these setter function usered for setting userer related data
            customerProvider.setcustomerId(customerId);
            customerProvider.setmyList(
                [DataModel(adminName: data['userName'].toString(), customerId: data['customerId'].toString())]);
            User? user = FirebaseAuth.instance.currentUser;
            String currentUserId = user!.uid.toString();

            loginProvider.setLoginUserName(userName);
            loginProvider.setCurrentUserId(currentUserId);
            if (role == 'admin') {
              loginProvider.setLoginUserRole('Customer Admin');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerAdminHomeScreen()),
              );
            } else if (role == 'branch_admin') {

              loginProvider.setLoginUserRole('Branch Admin');

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const BranchAdminHomeScreen()),
              // );
            }
          });
        }
        //bnkdbkbdkbdkbckbc
        //                       showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return const AlertDialog(
        //         title: Text("Login "),
        //         content: Text("Incorrect email & password"),
        //       );
        //     },
        //   );
        // user = userCredential.user;

        // if (user != null) {
        //   uid = user.uid;
        //   userEmail = user.email;

        //   SharedPreferences prefs = await SharedPreferences.getInstance();
        //   await prefs.setBool('auth', true);
        // }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided.');
        } else {
          print(e.toString());
        }
      }

      return user;
    }
    return null;
  }
}
