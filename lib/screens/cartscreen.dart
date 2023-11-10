import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/src/badge.dart' as badge;
import '../cart.dart';
import '../cart_provider.dart';
import '../db.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {

DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 160, 217),
        title: Text('Cart items',
        style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),),
        centerTitle: true,
        actions: [
          Center(
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
          
          SizedBox(width: 20.0,),
        ],
        ),
      body: Column(children: [
        FutureBuilder(
          future: cart.getData(),
          builder: (context, AsyncSnapshot<List<Cart>>snapshot){
            if(snapshot.hasData){
              return Expanded(
                child: ListView.builder(
                itemCount: snapshot.data!.length,
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
                        image: AssetImage(snapshot.data![index].image.toString()),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data![index].productName.toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 4, 4),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                          ),),

                        InkWell(
                          onTap: () {
                           dbHelper!.delete(snapshot.data![index].id!);
                           cart.removerCounter();
                           cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice.toString()));
                          },
                          child: Icon(Icons.delete)),
                                ],
                              ),
                            
                          SizedBox(height: 5,),
                          Text(snapshot.data![index].unitTag.toString(),
                          style: TextStyle(
                            color: Color.fromARGB(255, 23, 235, 62),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                          ),),
                          SizedBox(height: 5,),
                          Text('Rs' + ' '+ snapshot.data![index].initialPrice.toString(),
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
                );
            }
           return Text(' ');
        },
        ),
        Consumer <CartProvider>(builder: (context,value,child){
                return Visibility(
                  visible: value.getTotalPrice().toStringAsFixed(2) == '0.00' ? false : true,
                  child: Column(
                    children: [
                        ReusableWidget(title: 'Total', value: 'Rs '+value.getTotalPrice().toStringAsFixed(2))
                    ],
                  ),
                );
              })
      ]),
    );
  }
}
class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: Theme.of(context).textTheme.headlineSmall,),
          Text(value.toString(),style: Theme.of(context).textTheme.headlineSmall,),
        ],
      ),
    );
  }
} 