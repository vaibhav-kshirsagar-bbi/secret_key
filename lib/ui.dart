import 'package:flutter/material.dart';
import 'package:web_demo/logic.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController? secretKey= TextEditingController();
  TextEditingController? initVector= TextEditingController();

  String secretKeyOutput='';
  String initVectorOutput='';



  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
          )
      ),

      child: Container(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,

              child: Card(

                shadowColor: Colors.black12,
                elevation: 10,
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide.none
                ),

                color: Colors.white,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 200,),

                      // Center(
                      //   child: Text(
                      //     "Sign in",
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //
                      //     ),
                      //   ),
                      // ),

                      SizedBox(height: 50,),

                      Text(
                        "Secret key",
                        style: TextStyle(
                          color: Colors.black,

                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                          controller: secretKey,
                          onChanged: (value){

                            setState(() {});

                          },
                          decoration:  InputDecoration(
                            hintText: "Enter Secret key",
                            //errorText: RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$').hasMatch(secretKey!.text.toString()) || secretKey!.text.toString()==""? null : "Enter valid Email" ,
                            hintStyle: TextStyle(

                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                          )
                      ),


                      SizedBox(height: 10,),

                      Text(
                        "output : $secretKeyOutput",
                        style: TextStyle(
                          color: Colors.black,

                        ),
                      ),

                      SizedBox(height: 30,),

                      Text(
                        "Init Vector",
                        style: TextStyle(
                          color: Colors.black,

                        ),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                          controller: initVector,
                          onChanged: (value){
                            setState(() {});
                          },
                          decoration:  InputDecoration(
                            hintText: "Enter Init Vector",
                            //errorText: RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(initVector!.text.toString()) || initVector!.text.toString()=="" ? null : "password must contain 1 lower,upper,special\nand numeric",

                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                              borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                            ),
                          )
                      ),


                      SizedBox(height: 10,),

                      Text(
                        "output : $initVectorOutput",
                        style: TextStyle(
                          color: Colors.black,

                        ),
                      ),

                      SizedBox(height: 40,),

                      Center(
                        child: SizedBox(

                          width: MediaQuery.of(context).size.width,

                          child: Card(
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.lightBlueAccent,
                            child: TextButton(
                                onPressed: (){

                                  calculate();

                                },
                                child: Text(
                                  ' Submit ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,

                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void calculate() {

    secretKeyOutput=initVectorOutput='';

    if(secretKey!.text!=null && secretKey!.text!='')
      secretKeyOutput = getSecretKey(secretKey!.text);

    if(initVector!.text!=null && initVector!.text!='')
      initVectorOutput = getInitVector(initVector!.text);

    setState(() {});

  }
}
