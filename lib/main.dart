import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboard()
    );
  }
}

class Onboard extends StatefulWidget {
  const Onboard({ Key? key }) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with SingleTickerProviderStateMixin {

  TabController? onboardPages;

  @override
  void initState() {
    super.initState();
    onboardPages = TabController(
      length: 3, 
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: TabBarView(
              controller: onboardPages,
              children: [
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Lottie.network(
                            'https://assets7.lottiefiles.com/packages/lf20_YnsM0o.json',
                            alignment: Alignment.center,
                          ), 
                        ),
                        Align(alignment: Alignment.bottomCenter,
                        child: Text("Welcome to the world of junk food, we are here to serve",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,),),)
                      ],
                    )
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Lottie.asset(
                          'assets/packagehand.zip',
                          alignment: Alignment.center
                        ),
                      ),
                      Align(alignment: Alignment.bottomCenter,
                        child: Text("Let us deliver your food to you in a neatly packed package.",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,),),)
                    ],
                  )
                ),
                Container(
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Lottie.asset('assets/receipt.json'),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          "View your transaction receipt, Payments Made and many more on the app",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SizedBox( 
                          width: MediaQuery.of(context).size.width - 150,
                          child: TextButton(onPressed: (){}, 
                            child: Text('Get Started'),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              primary: Colors.white,
                            )
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              ]
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1/4,
            child: TabPageSelector(
              controller: onboardPages,
              color: Colors.white,
              selectedColor: Colors.red,
            ),
          )
        ],
      )
    );
  }
}


// ERRORS YOU MIGHT FACE
// YOU DIDNT ADD "WITH SINGLETICKERPROVIDERMIX" SO IT IS SHOWING YOU 
// LENGTH DOES NOT MATCH
// SIZING PROBLEM
