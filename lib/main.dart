import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Images in Flutter'),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://kb.rspca.org.au/wp-content/uploads/2018/11/golder-retriever-puppy.jpeg',
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Image.asset('assets/images/profile.jpg'),
          Image(
            image: AssetImage('assets/images/profile.jpg'),
          ),
        ],
      ),
    ),
  ));
}
