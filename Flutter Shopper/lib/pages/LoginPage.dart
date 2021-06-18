import 'package:codepur/utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:codepur/utils/Routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = '';
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>(); // (1)thats how we declare a formkey
  login() async {
    {
      if (_formkey.currentState.validate()) // statement to check validation of form key
      {
        setState(() {
          changebutton = true;
          // used to navigate to a diff screen
        });
        await Future.delayed(Duration(milliseconds: 3000)); // this is not animation time
        await Navigator.pushNamed(context, MyRoutes.ActualHomePage);

        setState(() {
          changebutton = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white, // change backgroud of app to match the color of image

      child: Column(
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.contain, // responsible for fit of image on screen
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Welcome $name",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0), // give padding to 2nd col
            child: Form(
              key: _formkey, // (2)refer the key here
              child: Column(
                children: [
                  TextFormField(
                    // use textform field instead of textfield
                    decoration: InputDecoration(
                        // uses decoration property for designing
                        hintText: 'Enter User Name',
                        labelText: 'Username'),

                    validator: (value) {
                      // use validator property of form
                      if (value.isEmpty) {
                        return "cant be empty";
                      }
                      return null;
                    },

                    onChanged: (value) {
                      // for data interpolation to welcome text
                      // textformfield returns a value which can be used
                      setState(() {
                        // declate setstate for any change on screen
                        name = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter Password', labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      // use validator again
                      if (value.length < 6) {
                        return "pass cant be less than 6";
                      }
                      if (value.isEmpty) {
                        return "pass cant be empty";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                      child: InkWell(
                        // inkwell goes well with a widget called Ink and not container or animated
                        //container , Ink bydefault has a ripple prop but continer/animated container doesnt
                        // used to give ripple effect which is not available in gesture detector
                        // to add ripple effect to animated container in an inkwell , we first make the ancestor
                        // of inkwell as MATERIAL Widget, 2. remove the decoration and background color from
                        // our container and give it to material Widget
                        onTap: () {
                          login();
                        },
                        child: AnimatedContainer(
                          // used for animations unlie normal container
                          duration:
                              Duration(seconds: 1), // this is animation time, animation and await
                          // time can be diff , they have no direct corelation
                          child:
                              changebutton // if changebutton is true proceed with text after Qmark
                                  // else with the one after colon
                                  ? (Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ))
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                          alignment: Alignment.center,
                          height: 50.0,
                          width: changebutton
                              ? 50
                              : 150.0, // if change button is true the width will change to 40
                          decoration: BoxDecoration(
                              // animated container takes box decoration prop
                              // for decoration purposes
                              //color: Colors.deepPurple,
                              // shape:
                              //     changebutton ? BoxShape.circle : BoxShape.rectangle,
                              // it has been commented here as we are using Material as ancestor to inkweel
                              // which was not being done earlier. Either ancestor or child only one can
                              // have a decoration

                              ),
                        ),
                      )
                      // ElevatedButton(
                      //   child: Text('Login'),
                      //   style: TextButton.styleFrom(minimumSize: Size(140, 40)),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.HomeRoute);
                      //   },
                      // )
                      )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
