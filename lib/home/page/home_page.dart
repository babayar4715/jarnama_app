import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jarnama_app/app_product/app_product.dart';
import 'package:jarnama_app/model/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> readTodos() {
    return db.collection('products').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: StreamBuilder(
        stream: readTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final List<Product> todos = snapshot.data!.docs
                .map((doc) =>
                    Product.fromJson(doc.data() as Map<String, dynamic>))
                .toList();
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final product = todos[index];

                return Card(
                  color: const Color.fromARGB(255, 159, 159, 159),
                  child: Column(
                    children: [
                      product.images != null
                          ? SizedBox(
                              height: 200,
                              child: PageView.builder(
                                itemCount: product.images!.length,
                                itemBuilder: (context, index) {
                                  final image = product.images![index];
                                  return Image.network(image);
                                },
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          product.userName,
                          style: const TextStyle(fontSize: 20),
                        ),
                        leading: Text(
                          product.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          product.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: Text(
                          product.prices ?? '',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('Error');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppProductPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
