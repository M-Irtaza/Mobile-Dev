import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/global/global.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:shared_preferences/shared_preferences.dart';

import '../mainScreens/home_screen.dart';

class RegistrationTabPage extends StatefulWidget {
  @override
  State<RegistrationTabPage> createState() => _RegistrationTabPageState();
}

class _RegistrationTabPageState extends State<RegistrationTabPage> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String downloadImageUrl = "";

  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();

  getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imgXFile;
    });
  }

  formValidation() async {
    if (imgXFile == null) {
      Fluttertoast.showToast(msg: "Please select an image");
    } else {
      if (passwordTextEditingController.text ==
          confirmPasswordTextEditingController.text) {
        if (nameTextEditingController.text.isNotEmpty &&
            emailTextEditingController.text.isNotEmpty &&
            passwordTextEditingController.text.isNotEmpty &&
            confirmPasswordTextEditingController.text.isNotEmpty) {
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          fStorage.Reference storageRef = fStorage.FirebaseStorage.instance
              .ref()
              .child("userImages")
              .child(fileName);

          fStorage.UploadTask uploadTask =
              storageRef.putFile(File(imgXFile!.path));

          fStorage.TaskSnapshot taskSnapshot =
              await uploadTask.whenComplete(() {});
          await taskSnapshot.ref.getDownloadURL().then((urlImage) {
            downloadImageUrl = urlImage;
          });

          saveInfoToDatabase();
        } else {
          Fluttertoast.showToast(msg: "Please complete the form.");
        }
      } else {
        Fluttertoast.showToast(msg: "Passwords don't match");
      }
    }
  }

  saveInfoToDatabase() async {
    //authenticate the user
    User? currentUser;

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailTextEditingController.text.trim(),
            password: passwordTextEditingController.text.trim())
        .then((auth) {
      currentUser = auth.user;
    }).catchError((errorMessage) {
      Fluttertoast.showToast(msg: "Error : \n $errorMessage");
    });

    if (currentUser != null) {
      //save info to database and save info locally using shared preferences

      saveToFirebaseAndLocal(currentUser!);
    }
  }

  saveToFirebaseAndLocal(User currentUser) async {
    //to firestore
    FirebaseFirestore.instance.collection("users").doc(currentUser.uid).set({
      "uid": currentUser.uid,
      "email": currentUser.email,
      "name": nameTextEditingController.text.trim(),
      "photoUrl": downloadImageUrl,
      "status": "approved",
      "userCart": ["initialValue"],
    });

    //to local storage

    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email!);
    await sharedPreferences!
        .setString("name", nameTextEditingController.text.trim());
    await sharedPreferences!.setString("photoUrl", downloadImageUrl);
    await sharedPreferences!.setStringList("userCart", ["initialValue"]);

    Navigator.push(context, MaterialPageRoute(builder: (c) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // get or capture image with phone data
              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.20,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      imgXFile == null ? null : FileImage(File(imgXFile!.path)),
                  child: imgXFile == null
                      ? Icon(
                          Icons.add_photo_alternate,
                          color: Colors.grey,
                          size: MediaQuery.of(context).size.width * 0.20,
                        )
                      : null,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //input form fields

              //name
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      textEditingController: nameTextEditingController,
                      iconData: Icons.person,
                      hintText: "Name",
                      isObsecure: false,
                      enabled: true,
                    ),

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

                    //confirm password
                    CustomTextField(
                      textEditingController:
                          confirmPasswordTextEditingController,
                      iconData: Icons.lock,
                      hintText: "Confirm Password",
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
                  formValidation();
                },
                child: const Text(
                  "SignUP",
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
      ),
    );
  }
}
