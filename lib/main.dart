import 'package:animatedList/cart.dart';
import 'package:animatedList/explore.dart';
import 'package:animatedList/home.dart';
import 'package:animatedList/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget screen = HomeScreen();
  Color backgroundColor = Colors.indigo;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: screen,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            primaryColor: backgroundColor,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        child: Container(
          margin: EdgeInsets.all(16),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: currentIndex,
                onTap: (int index) {
                  setState(() {
                    currentIndex = index;
                    if (currentIndex == 0) {
                      screen = HomeScreen();
                      backgroundColor = Colors.indigo;
                    } else if (currentIndex == 1) {
                      screen = ExploreScreen();
                      backgroundColor = Colors.amber;
                    } else if (currentIndex == 2) {
                      screen = CartScreen();
                      backgroundColor = Colors.green;
                    } else {
                      screen = ProfileScreen();
                      backgroundColor = Colors.purple;
                    }
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    title: Text(''),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore),
                    title: Text(''),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined),
                    title: Text(''),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    title: Text(''),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
