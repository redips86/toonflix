import 'package:flutter/material.dart';
import 'package:toonflix/services/api_services.dart';

import '../models/webtoon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Center(
          child: Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: FutureBuilder(future: webtoons,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return const Text("There is data!");
        }
        return const Text("Loading...");

      },)
      ,
    );
  }
}