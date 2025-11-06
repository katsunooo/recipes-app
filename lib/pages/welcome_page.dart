import 'package:flutter/material.dart';
import 'package:recipes_for_sweets_app/design/color.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int hour = now.hour;

    String getTime(hour) {
      if (hour >= 5 && hour < 12) {
        return 'Доброе утро';
      } else if (hour >= 12 && hour < 17) {
        return 'Добрый день';
      } else if (hour >= 17 && hour < 22) {
        return 'Добрый вечер';
      } else {
        return 'Доброй ночи';
      }
    }

    String timeHello = getTime(hour);

    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Center(
                child: Text(
                  timeHello,
                  style: TextStyle(color: primaryColor, fontSize: 50, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(height: 150,),
            Image.asset(
              'assets/icon-cake.png',
              height: 200,
              width: 200,
              color: primaryColor,
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'К рецептам',
                    style: TextStyle(color: whiteColor, fontSize: 40),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            SizedBox(height: 10,),
            Text(
              "Твоя личная книга рецептов",
              style: TextStyle(
                color: primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
