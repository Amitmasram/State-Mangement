import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    title: Text("Item" + index.toString()),
                    trailing: const Icon(Icons.favorite_outline),
                  );
                }),
          )
        ],
      ),
    );
  }
}
