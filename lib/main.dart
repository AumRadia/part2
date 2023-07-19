import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyntraApp());
}

class MyntraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myntra Insider',
      theme: _myMyntraTheme(),
      home: MyntraHomePage(),
    );
  }

  ThemeData _myMyntraTheme() {
    return ThemeData(
      primaryColor: Color(0xFFAF103D), // Myntra Gray
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ).bodyMedium, titleTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ).titleLarge,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFEB3C3F), // Myntra Red
          textStyle: TextStyle(fontSize: 18.0),
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF6D6D6D)),
    );
  }
}

class MyntraHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Myntra Insider'),
      ),
      body: MyntraInsiderBody(),
    );
  }
}

class MyntraInsiderBody extends StatelessWidget {
  static bool isLoggedIn = false; // Replace false with your actual login status

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('lib/assets/images.jpg', fit: BoxFit.cover),
                ), // Placeholder image or your custom image
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Exclusive Offers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Container(
                  height: 200.0,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                    ),
                    itemCount: 5, // Replace with the actual number of exclusive offers
                    itemBuilder: (context, index, realIndex) {
                      return Card(
                        child: Image.asset('lib/assets/images.jpg'), // Placeholder image or your custom image
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'New Arrivals',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // Replace with the actual number of new arrivals
                    itemBuilder: (context, index) {
                      return Card(
                        child: Image.asset('lib/assets/images.jpg'), // Placeholder image or your custom image
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                // Add more content here to make it bigger and scrollable
                _buildSection('Section 1', 'Content for Section 1'),
                _buildSection('Section 2', 'Content for Section 2'),
                _buildSection('Section 3', 'Content for Section 3'),
                // ...
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
        BottomBanner(),
      ],
    );
  }

  Widget _buildSection(String title, String content) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            content,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class BottomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink, // Customize the banner color as needed
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add login functionality here
          },
          child: Text('Log In', style: TextStyle(fontSize: 18.0)),
        ),
      ),
    );
  }
}
