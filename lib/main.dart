import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('One Piece Characters'),
        ),
        body: CustomScrollView(
          slivers: [
            CustomSliverGrid(
              characters: [
                Product(
                  id: 1,
                  name: 'Monkey D. Luffy',
                  role: 'Captain',
                  image: '4.jpg',
                ),
                Product(
                  id: 2,
                  name: 'Roronoa Zoro',
                  role: 'Swordsman',
                  image: '3.jpg',
                ),
                Product(
                  id: 3,
                  name: 'Nami',
                  role: 'Navigator',
                  image: '2.jpg',
                ),
                Product(
                  id: 4,
                  name: 'Usopp',
                  role: 'Sniper',
                  image: '1.jpg',
                ),
                // เพิ่มตัวละคร One Piece อื่น ๆ ตามต้องการ
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Product> characters;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ProductItem(character: characters[index]);
          },
          childCount: characters.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.73,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String role;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.role,
    required this.image,
  });
}

class ProductItem extends StatelessWidget {
  final Product character;

  ProductItem({required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // แก้ไขเป็น character.name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              character.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // แก้ไขเป็น character.role
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              character.role,
              style: TextStyle(fontSize: 16),
            ),
          ),
          // ราคาไม่ใช้ในกรณีนี้ คุณสามารถลบได้
        ],
      ),
    );
  }
}
