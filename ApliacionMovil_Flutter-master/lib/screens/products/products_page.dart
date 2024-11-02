import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/services/product_service.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product>? _products;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
    });
    final productService = ProductService();
    final products = await productService.fetchProducts();
    setState(() {
      _products = products;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadProducts,
              child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 8.0, left: 10, right: 10),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                        child: Center(child: Text("CATALOGO DE PRODUCTOS", textAlign: TextAlign.center,style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                        child: Center(child: Text("Compra y cultiva tus propias plantas")),
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          crossAxisSpacing: 20, 
                          mainAxisSpacing: 20,
                          mainAxisExtent: 300),
                        itemCount: _products?.length ?? 0,
                        itemBuilder: (context, index) {
                          final product = _products![index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFf2f2f2),
                              border: Border.all(color: Color(0xFF81C76B), width: 2, style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Center(
                                    child: Text(
                                      product.title.toUpperCase(),
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>{},
                                    child: Image.network(
                                      product.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF81C76B),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    child: Center(child: Text("COMPRAR", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800),)),
                                  ),
                                )
                                
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
