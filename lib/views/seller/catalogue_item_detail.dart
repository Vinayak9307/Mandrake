import 'package:flutter/material.dart';
import 'package:mandrake/utils/global_colors.dart';

class CatalogueItemDetail extends StatefulWidget {
  const CatalogueItemDetail({super.key});

  @override
  State<CatalogueItemDetail> createState() => _CatalogueItemDetailState();
}

class _CatalogueItemDetailState extends State<CatalogueItemDetail> {
  late TextEditingController controler;

  @override
  void initState() {
    super.initState();
    controler = TextEditingController();
  }

  @override
  void dispose() {
    controler.dispose();
    super.dispose();
  }

  String price = "22";
  String Quantity = "22";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Edit Details',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.format_list_numbered_outlined,
                    size: 30,
                  ),
                  subtitle: Text(Quantity,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text('Quantity'),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      final Quantity = await _onEditPressed(1);
                      if (Quantity == null || Quantity.isEmpty) return;
                      setState(() => this.Quantity = Quantity);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.price_change_outlined,
                    size: 30,
                  ),
                  subtitle: Text(price,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text('Price'),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      final price = await _onEditPressed(2);
                      if (price == null || price.isEmpty) return;
                      setState(() => this.price = price);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _onEditPressed(var index) async => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: index == 1 ? Text('Quantity') : Text('Price'),
            content: TextField(
              keyboardType: TextInputType.number,
              controller: controler,
              autofocus: true,
              decoration: index == 1
                  ? InputDecoration(hintText: "Enter new quantity")
                  : InputDecoration(hintText: "Enter new price"),
            ),
            actions: [TextButton(onPressed: submit, child: Text('Submit'))],
          ));

  void submit() {
    Navigator.of(context).pop(controler.text);
    controler.clear();
  }
}
