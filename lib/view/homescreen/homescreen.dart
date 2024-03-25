// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fakestoreapi/controller/homescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    await Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenProvider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: homescreenProvider.productlist.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          homescreenProvider.productlist[index].image ?? "")),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            homescreenProvider.productlist[index].title ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Text(
                          "\$${homescreenProvider.productlist[index].price ?? ""}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Text(homescreenProvider.productlist[index].category ?? ""),
                    Text(
                      "\$${homescreenProvider.productlist[index].price ?? ""}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Remove",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            children: [
                              Icon(Icons.remove),
                              SizedBox(width: 10),
                              Text("1"),
                              SizedBox(width: 10),
                              Icon(Icons.add),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
