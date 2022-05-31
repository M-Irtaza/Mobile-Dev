import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/global/global.dart';
import 'package:e_commerce/mainScreens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/loading_dialog.dart';

class LoginTabPage extends StatefulWidget {
  @override
  State<LoginTabPage> createState() => _LoginTabPageState();
}

class _LoginTabPageState extends State<LoginTabPage> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  validateForm(){
    if(emailTextEditingController.text.isNotEmpty && passwordTextEditingController.text.isNotEmpty){
      //allow user to loign
      loginNow();
    }else{
      Fluttertoast.showToast(msg: "Login Failed");
    }
  }

  loginNow() async{
    showDialog(context: context, builder: (c){
            return LoadingDialogWidget(message: "Checking credentials..",);
          });
    User? currentUser;

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailTextEditingController.text.trim(), 
            password: passwordTextEditingController.text.trim())
        .then((auth) {
      currentUser = auth.user;
    }).catchError((errorMessage) {
       Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error : \n $errorMessage");
    });

    if (currentUser != null){
      checkifRecordExist(currentUser!);
    }else{

    }
  }
  checkifRecordExist(User currentUser) async {
    await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get().then((record) async {
       if(record.exists) {
         if (record.data()!["status"] == "approved")  {
            await sharedPreferences!.setString("uid", record.data()!["uid"]); 
            await sharedPreferences!.setString("email", record.data()!["email"]); 
            await sharedPreferences!.setString("name", record.data()!["name"]);
            await sharedPreferences!.setString("photoUrl", record.data()!["photoUrl"]);

            List<String> userCartList = record.data()!["userCart"].cast<String>();
            await sharedPreferences!.setStringList("userCart", userCartList);

            Navigator.push(context, MaterialPageRoute(builder: (c) => HomeScreen()));
        
         }

         else {
         FirebaseAuth.instance.signOut();
         Navigator.pop(context);
         Fluttertoast.showToast(msg: "BLOCKED by admin");
       }
       }
       else {
         FirebaseAuth.instance.signOut();
         Navigator.pop(context);
         Fluttertoast.showToast(msg: "record does not exist");
       }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image.asset(
              "assets/pictures/login.png",
              height: MediaQuery.of(context).size.height * 0.40,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  //email
                  CustomTextField(
                    textEditingController: emailTextEditingController,
                    iconData: Icons.email,
                    hintText: "Email",
                    isObsecure: false,
                    enabled: true,
                  ),

                  //password
                  CustomTextField(
                    textEditingController: passwordTextEditingController,
                    iconData: Icons.lock,
                    hintText: "Password",
                    isObsecure: true,
                    enabled: true,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purpleAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
              onPressed: () {
                validateForm();
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
