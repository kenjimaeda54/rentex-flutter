import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rentex/utlis/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../model/CarsModel.dart';

Future<List<CarsModel>> fetchCars() async {
  var urlString = TargetPlatform.android == defaultTargetPlatform
      ? "http://10.0.2.2:3000/cars"
      : "http://127.0.0.1:3000/cars";
  final url = Uri.parse(urlString);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final responseDecode = jsonDecode(response.body) as List<dynamic>;
    return responseDecode.map((e) => CarsModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load cars');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String logoHeader = "assets/images/logo.svg";
  late Future<List<CarsModel>> futureCars;

  @override
  initState() {
    super.initState();
    futureCars = fetchCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: ColorsApp.blackDark,
            alignment: Alignment.bottomCenter,
            height: 113,
            child: Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(logoHeader,
                      height: 12, semanticsLabel: 'Logo Header home'),
                  Text(
                    "Total de 12 carros",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: ColorsApp.grayDark200,
                    ),
                  )
                ],
              ),
            ),
          ),
          FutureBuilder<List<CarsModel>>(
              future: futureCars,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Text(
                          snapshot.data?[index].name ?? "",
                          style: TextStyle(
                            color: ColorsApp.blackDark,
                            fontSize: 20,
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return const CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
