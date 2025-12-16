import 'package:flutter/material.dart';

class OrderTotalPage extends StatefulWidget {
  const OrderTotalPage({super.key});

  @override
  State<OrderTotalPage> createState() => _OrderTotalPageState();
}

class _OrderTotalPageState extends State<OrderTotalPage> {
  final _ticket1Controller = TextEditingController();
  final _ticket2Controller = TextEditingController();
  final _ticket3Controller = TextEditingController();
  String? _selectedDiscount;
  String _result = '';

  final Map<String, double> _discounts = {
    'Sin descuento': 0.0,
    'Estudiante (10%)': 0.10,
    'Adulto Mayor (15%)': 0.15,
    'Promoción Especial (20%)': 0.20,
  };

  void _calculateTotal() {
    final ticket1 = double.tryParse(_ticket1Controller.text) ?? 0;
    final ticket2 = double.tryParse(_ticket2Controller.text) ?? 0;
    final ticket3 = double.tryParse(_ticket3Controller.text) ?? 0;

    if (_selectedDiscount == null) {
      setState(() {
        _result = 'Por favor seleccione un tipo de descuento';
      });
      return;
    }

    final subtotal = ticket1 + ticket2 + ticket3;
    final discount = subtotal * _discounts[_selectedDiscount]!;
    final total = subtotal - discount;

    setState(() {
      _result = 'Subtotal: \$${subtotal.toStringAsFixed(2)}\n'
          'Descuento: \$${discount.toStringAsFixed(2)}\n'
          'Total: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total de Orden'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Boleto 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ticket1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Precio del boleto 1',
                prefixText: '\$',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Boleto 2',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ticket2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Precio del boleto 2',
                prefixText: '\$',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Boleto 3',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ticket3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Precio del boleto 3',
                prefixText: '\$',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Descuento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedDiscount,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Seleccione descuento',
              ),
              items: _discounts.keys.map((discount) {
                return DropdownMenuItem(value: discount, child: Text(discount));
              }).toList(),
              onChanged: (value) => setState(() => _selectedDiscount = value),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateTotal,
              child: const Text('Calcular Total'),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Card(
                color: Colors.orange[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _result,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ticket1Controller.dispose();
    _ticket2Controller.dispose();
    _ticket3Controller.dispose();
    super.dispose();
  }
}
