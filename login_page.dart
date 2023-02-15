import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getstorage/my_home_page.dart';
import 'package:sizer/sizer.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var box = GetStorage( );
  TextEditingController EmailController = TextEditingController();
  TextEditingController  paaswordController = TextEditingController();

  var ishiddenpassword= true;
  final _formkey=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Get Storage"),),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 50,
                        backgroundColor: Colors.black12,
                        child: Icon(Icons.person,size: 100,color: Colors.white,),
                      ),
                      SizedBox(height: 2.h,),

                      TextFormField(
                        controller: EmailController,
                        validator: (val){
                          if(val!.isEmpty){
                            return "enter email or phone ";
                          }
                          else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)){
                            return "enter valid email";
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Enter Email Address",
                          labelText: "Enter Email Address",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),

                      SizedBox(height: 2.h,),

                      TextFormField(
                        obscureText: ishiddenpassword,
                        controller: paaswordController,
                        validator: (val){
                          if(val!.isEmpty){
                            return "enter pass";
                          }
                          else if(val.length<=1){
                            return "enter 10 character";
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: "Password",
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            icon: Icon(ishiddenpassword?Icons.lock:Icons.remove_red_eye,color: Colors.white,),
                            onPressed: (){
                              ishiddenpassword=!ishiddenpassword;
                              setState(() {

                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 1.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forget password?",style: TextStyle(color: Colors.blue),),
                        ],
                      ),

                      SizedBox(height: 3.h,),

                      GestureDetector(
                        onTap: ()async{
                          if(_formkey.currentState!.validate()){
                            print("Done");
                            GetStorage box = GetStorage( );
                            await box.write( 'key', 'value' );
                           await  box.read( 'key');
                            // Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
                            Get.to(MyHomePage());
                          }
                        },
                        child: Container(
                          height: 7.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white),)),
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        
        
      ),
    );
  }
}
