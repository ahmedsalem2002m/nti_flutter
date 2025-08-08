import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Pacifico"),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class Home_2 extends StatelessWidget {
  const Home_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(8),
                width: 300,
                height: 250,
                child: Image.asset("assets/images/eat.jpg"),
              ),
            ),
            Text("Ahmed Salem"),
            TextFormField(
              keyboardType: TextInputType.name,
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                suffixIcon: IconButton(onPressed: (){
                  print("Ali");
                }, icon: Icon(Icons.lock)),
                labelText: "Enter name",
                border: OutlineInputBorder(

                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: Icon(Icons.arrow_back_ios_sharp, color: Colors.green),
      //   title: Text("Home", style: TextStyle(color: Colors.blue)),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Icon(Icons.person),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => HorItem(),
                itemCount: 10,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => VerticalItem(),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalItem extends StatelessWidget {
  const VerticalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.blueGrey, blurRadius: 3, spreadRadius: 7),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(
                  "https://septemberfarmcheese.b-cdn.net/wp-content/uploads/Blogs/Homemade-Pizza/homemade-pizza-monterey-jack-cheese.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "product name",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("description"),
                      Text("02/08/2025", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HorItem extends StatelessWidget {
  const HorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  "https://septemberfarmcheese.b-cdn.net/wp-content/uploads/Blogs/Homemade-Pizza/homemade-pizza-monterey-jack-cheese.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ahmed Salem",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              SizedBox(width: 5),
              CircleAvatar(radius: 8, backgroundColor: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
