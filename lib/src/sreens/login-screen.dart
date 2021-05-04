import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_stateful/src/api/auth_api.dart';
import 'package:login_stateful/src/mixing/validation_mixing.dart';
import 'package:login_stateful/src/sreens/second_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixing {
  final formKey  = GlobalKey<FormState>();
  String? email;
  String? password;
  String? gender;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Container (
            // height: 200,
            // width: 500,
            color: Colors.white,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(50),
            child: Form (
              key: formKey,
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildEmailField(),
                    buildPasswordField(),
                    //Sizebox le space create garcha
                    SizedBox(height: 16),
                    buildGenderField(),
                    SizedBox(height: 16),
                    buildSubmitButton(),
                ],

              ),

            ),
          ),
        ),
      ),

    );

     }
  Widget buildEmailField () {
     return TextFormField(
       onSaved: (String? val) {
         email = val;
       },
       keyboardType: TextInputType.emailAddress,
       validator: validateEmail,
       decoration: InputDecoration (
         labelText: " Your email",
         hintText: "email@gmail.com",
           border: OutlineInputBorder (

       )
       ),
     );
  }

   Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top:16),
      child: TextFormField (
          onSaved: (String? val) {
            email = val;
          },
        obscureText: true,
          validator: validatePassword,

      decoration: InputDecoration (
        labelText: "Your Password",
        hintText: "*****",
        border: OutlineInputBorder ()

      )
      ),
    );
   }

   Widget buildGenderField() {
    return DropdownButtonFormField(
      onChanged: (String? val) {},
      onSaved: ( String?val) {
        gender = val;
      },
      validator: validateGender,
      items: [
        DropdownMenuItem ( child: Text ("Male"),value: "Male",),
        DropdownMenuItem ( child: Text ("Female"),value: "Female",),
        DropdownMenuItem ( child: Text ("Other"),value: "Other",),
        DropdownMenuItem ( child: Text ("Rather Not Say"),value: "Rather Not Say"),
      ],
          decoration: InputDecoration (
            hintText: "Your Gender",
            labelText: "Select your gender",
            border: OutlineInputBorder()
          ),
    );
   }

   Widget buildSubmitButton() {
    // return RaisedButton(
    //   onPressed: () {},
    //   child: Text ("Submit"),
    //   color: Colors.blue,
    //   textColor: Colors.white,
    // );

     return SizedBox(
       width: double.infinity,
       child: ElevatedButton(
         onPressed: isLoading? null:(){
           // formKey.currentState.reset();
            onSubmitButtonClick();
         },
         child: isLoading ?CircularProgressIndicator() :Text ("submit the form data "),
         // style: ButtonStyle(
         //   padding: MaterialStateProperty.all (EdgeInsets.all (16),),
         //   backgroundColor: MaterialStateProperty.all(Colors.green),
         // ),

         //Tala ko jasari ni garna milcha.short cut without material property
         style: ElevatedButton.styleFrom(
           padding: EdgeInsets.all(16),
           primary: Colors.green
         ),
       ),
     );
   }

   Future<void> onSubmitButtonClick() async {
     bool validInput = formKey.currentState!.validate();
     if(validInput) {
       print("Email $email password $password and gender $gender");
       formKey.currentState!.save();
       print("2>Email $email password $password and gender $gender");
       setState(() {
         isLoading = true;
       });

     //  todo the submit the data
     //  button check gareko disabele ko gareko true or false
       var response =  await authApi.signup(email!, password!, gender!);

       setState(() {
         isLoading =false;
       });


     ///checking  if user is failed or not
       if (response ==null) {
         ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
         messenger.showSnackBar(
           SnackBar(content: Text("Sign up failed"))
         );
       } else {
       //todo navigate to the other page
       //  euta screen ba ata arko ma jana
         var data = await Navigator.of(context).push(
           MaterialPageRoute(
               builder:(BuildContext context){
                 return SecondScreen(email:email!);
               }
           )
         );
         print("data from second screen $data");
       }
     }
   }
}
