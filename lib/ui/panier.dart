import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/models/cart.dart';
import 'package:untitled1/ui/share/pizzeria_style.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: widget._cart.totalItems(),
                itemBuilder:(context, index){
                  return _buildItem(widget._cart.getCartItem(index));
                }

            ),
          ),
          Row(
            children: [Text('Total '),Text('30€')],
          ),
          Container(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade800)),
                child: Text('Valider le panier'),
                onPressed: (){
                  print('Achat effectué');
                },
              )),
        ],
      ),
    );
  }
  Widget _buildItem(CartItem cartItem)
  {
    return Row(
      children: [
        Column(
          children:
          [
            Text(
              '${cartItem.pizza.title}',
              style: PizzeriaStyle.pageTitleTextStyle,
            ),
            Image.asset(
                'assets/images/pizza/${cartItem.pizza.image}',
                height: 150),
            Text(cartItem.pizza.price.toString()),
            Text("Sous-Total : ${cartItem.pizza.total.toString()} €",
              style: PizzeriaStyle.priceTotalTextStyle,
            )
          ],
        )
      ],
    );
  }
}
