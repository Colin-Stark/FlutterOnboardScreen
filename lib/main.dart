import 'package:flutter/material.dart';

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
      length: 3, vsync: this,
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
                  child: Center(child: Text('First Page of the Onboard Screen')),
                ),
                Container(
                  child: Center(child: Text('Second Page of the Onboard Screen')),
                ),
                Container(
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Text('Third Page of the Onboard Screen'),
                      ),
                      SizedBox( 
                        width: MediaQuery.of(context).size.width - 150,
                        child: TextButton(onPressed: (){}, 
                          child: Text('Get Started'),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            primary: Colors.white,
                          )
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
