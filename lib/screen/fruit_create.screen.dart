import 'package:flutter/material.dart';
import '../domain/fruit.dart';
import '../util/snnipets.dart';

class FruitCreateScreen extends StatefulWidget {
  final Function(Fruit) onPressed;

  const FruitCreateScreen({super.key, required this.onPressed});

  @override
  State<FruitCreateScreen> createState() => _FruitCreateScreenState();
}

class _FruitCreateScreenState extends State<FruitCreateScreen> {
  late TextEditingController _name;
  late TextEditingController _price;

  @override
  void initState() {
    _name = TextEditingController();
    _price = TextEditingController();
    super.initState();
  }

  _clearFields() {
    _name.clear();
    _price.clear();
  }

  _onPressed(){
    widget.onPressed(Fruit(_name.text, _price.text));
    _clearFields();
    closeRoute(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastrar Fruta")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _name,
              decoration: inputDecoration(label: "Informe o nome"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextFormField(
                controller: _price,
                decoration: inputDecoration(label: "Informe o valor"),
              ),
            ),
            ElevatedButton(
                onPressed:_onPressed,
                child: const Text("Cadastrar"))
          ],
        ),
      ),
    );
  }
}
