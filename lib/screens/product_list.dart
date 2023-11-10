import 'package:flutter/material.dart';
import 'package:badges/src/badge.dart' as badge;
import 'package:provider/provider.dart';
import 'package:sale_app/cart.dart';
import 'package:sale_app/cart_provider.dart';
import 'package:sale_app/db.dart';
import 'package:sale_app/screens/cartscreen.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();

}

class _ProductsState extends State<Products> {
  DBHelper? dbHelper = DBHelper();
  List<String> ProductName = ['Sunscreen','Moisterizer','Cleanser','Face wash','Lip bam','Eyeliner','Perfume','Straightener','Mascara','Blush'];
  List<String> Productoffer = ['40% off','30% off','55% off','40% off','60% off','40% off','30% off','55% off','40% off','60% off'];
  List<int> productPrice = [400,250,300,170,200,175,800,650,150,250];
  List<String> productImage =['assets/images/sunscr.avif',
                              'assets/images/moist.jpg',
                              'assets/images/clean.avif',
                              'assets/images/face.jpg',
                              'assets/images/lip.jpeg',
                              'assets/images/eyeli.jpg',
                              'assets/images/per.jpeg',
                              'assets/images/str.jpg',
                              'assets/images/masc.avif',
                              'assets/images/blush.jpg'];
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 160, 217),
        title: Text('GlowNest',
        style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => CartScreen() ));
            },
            child: Center(
              child: badge.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child){
                    return Text(value.getCounter().toString(), style: TextStyle(color: Colors.white),);
                  },
                 
                  ),
                child: Icon(Icons.shopping_bag_outlined,
                size: 30,),
                
              
              ),
            ),
          ),
          
          SizedBox(width: 20.0,),
        ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ProductName.length,
                itemBuilder: (context,index){
                return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(height: 150,
                        width: 150,
                        image: AssetImage(productImage[index].toString()),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text(ProductName[index].toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 4, 4),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                          ),),
                          SizedBox(height: 5,),
                          Text(Productoffer[index].toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 235, 62),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                          ),),
                          SizedBox(height: 5,),
                          Text('Rs' + ' '+ productPrice[index].toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 1, 1, 1),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                          ),),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container( 
                                  width: 120,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 206, 135, 178),
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 251, 251, 251),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                        onTap: ()  {
                                              dbHelper!.insert(
                                                Cart(id: index, 
                                                productId: index.toString(), 
                                                productName: ProductName[index].toString(), 
                                                initialPrice: productPrice[index],
                                                productPrice: productPrice[index],
                                                quantity: 1,
                                                unitTag: Productoffer[index].toString(), 
                                                image: productImage[index].toString(),)
                                                
                                              ).then((value) {
                                                print('Product is added to cart');
                                                cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                                cart.addCounter();

                                              }).onError((error, stackTrace){
                                                print(error.toString());
                                              });
                                                        },
                                    ),
                                  ),
                                                          ),
                          ),
                          
                            ],
                          ),
                        ),
                        
                        
                        
                      ],),
                    ],
                    ),
                ),
                );
              }), 
              ),
              
          ]),
    );
  }
}
