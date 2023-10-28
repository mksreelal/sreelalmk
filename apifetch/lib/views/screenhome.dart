import 'package:apifetch/models/post.dart';
import 'package:apifetch/services/Service.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Post>? posts;
  bool _isloading = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    posts = await RemoteSerive().getPosts();
    if (posts != null) {
      _isloading = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hyyy'),
      ),
      body: Visibility(
        visible: _isloading,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20, top: 15),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.outer,
                      blurRadius: 20,
                      color: Color.fromARGB(255, 37, 103, 156))
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(),
                    Text(
                      posts![index].title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 221, 236)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 150),
                      child: Divider(
                        thickness: .6,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      posts![index].body,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
