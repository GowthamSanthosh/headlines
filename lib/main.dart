import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
Map dataResponse={};
List listResponse=[];
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future apiCall() async{
    http.Response response;
    response=await http.get(Uri.parse(''));
    if(response.statusCode==200){
      dataResponse=jsonDecode(response.body);
      listResponse=dataResponse['articles'];
    }
  }
  @override
  void initState() {
    apiCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('H E A D L I N E S '),
      ),
      body: ListView.builder(
          itemCount: listResponse.length,
          itemBuilder: (BuildContext context,index)
          {
          return  SingleChildScrollView(
              child:
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                         Card ( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                             color: Colors.yellowAccent,
                             child: Text(listResponse[index]['source']['name'].toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const Text('Author : ',style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(listResponse[index]['author'].toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('Title             : ',style: TextStyle(fontWeight: FontWeight.bold)),
                          Flexible(child: Text(listResponse[index]['title'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('Description : ',style: TextStyle(fontWeight: FontWeight.bold)),
                          Flexible(child: Text(listResponse[index]['description'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('Url                 : ',style: TextStyle(fontWeight: FontWeight.bold)),
                          Flexible(child: Text(listResponse[index]['url'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('Published at: ',style: TextStyle(fontWeight: FontWeight.bold)),
                          Flexible(child: Text(listResponse[index]['publishedAt'].toString())),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              child: Image.network(listResponse[index]['urlToImage'].toString()),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Colors.black,
                      )
                    ],
                  ),
               );
      }),
    );
  }
}


