import 'package:flutter/material.dart';
import 'package:galacticos_shop/models/product_entry.dart';
import 'package:galacticos_shop/widgets/left_drawer.dart';
import 'package:galacticos_shop/widgets/product_entry_card.dart';
import 'package:galacticos_shop/screens/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductListPage extends StatefulWidget {
  const MyProductListPage({super.key});

  @override
  State<MyProductListPage> createState() => _MyProductListPageState();
}

class _MyProductListPageState extends State<MyProductListPage> {
  Future<List<ProductEntry>> fetchMyProducts(CookieRequest request) async {
    final response = await request.get(
      'http://127.0.0.1:8000/get-products/?filter=my',
    );

    var data = response;

    List<ProductEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(
          ProductEntry(
            model: "main.product",
            pk: d['id'],
            fields: Fields(
              user: d['user_id'],
              name: d['name'],
              price: d['price'],
              description: d['description'],
              thumbnail: d['thumbnail'],
              category: d['category'],
              isFeatured: d['is_featured'],
              stock: d['stock'],
              brand: d['brand'] ?? "",
              rating: d['rating']?.toDouble(),
            ),
          ),
        );
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMyProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Column(
                children: [
                  Text(
                    'You haven\'t added any products yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: snapshot.data![index]),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
