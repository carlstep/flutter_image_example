import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Images in Flutter'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                )
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.all(14),
            elevation: 10,
            child: Image.network(
                'https://kb.rspca.org.au/wp-content/uploads/2018/11/golder-retriever-puppy.jpeg'),
          ),
          SizedBox(
            height: 30,
          ),
          CachedNetworkImage(
            errorWidget: (context, url, error) => const Icon(
              Icons.error_outlined,
              size: 100,
              color: Colors.red,
            ),
            placeholder: (context, url) {
              return const Image(
                image: AssetImage('assets/images/placeholder.png'),
              );
            },
            imageUrl:
                'https://kb.rspca.org.au/wp-content/uploads/2018/11/golder-retriever-puppy.jpeg',
          ),
          Image.network(
            'https://kb.rspca.org.au/wp-content/uploads/2018/11/golder-retriever-puppy.jpeg',
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Image.asset('assets/images/profile.jpg'),
          const Image(
            image: AssetImage('assets/images/profile.jpg'),
          ),
        ],
      ),
    ),
  ));
}
