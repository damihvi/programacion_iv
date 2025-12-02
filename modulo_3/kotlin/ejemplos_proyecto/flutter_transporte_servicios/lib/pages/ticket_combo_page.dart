import 'package:flutter/material.dart';

class TicketComboPage extends StatefulWidget {
  const TicketComboPage({super.key});

  @override
  State<TicketComboPage> createState() => _TicketComboPageState();
}

class _TicketComboPageState extends State<TicketComboPage> {
  String? _selectedCombo;
  String? _selectedPayment;
  final _quantityController = TextEditingController();
  String _result = '';

  final Map<String, double> _comboPrices = {
    'Combo Básico (5 viajes)': 25.00,
    'Combo Familiar (10 viajes)': 45.00,
    'Combo Premium (20 viajes)': 80.00,
  };

  final Map<String, double> _paymentDiscounts = {
    'Efectivo': 0.0,
    'Tarjeta de Débito': 0.05,
    'Tarjeta de Crédito': 0.03,
  };

  void _calculateTotal() {
    if (_selectedCombo == null || _selectedPayment == null) {
      setState(() {
        _result = 'Por favor seleccione todas las opciones';
      });
      return;
    }

    final quantity = int.tryParse(_quantityController.text);
    if (quantity == null || quantity <= 0) {
      setState(() {
        _result = 'Por favor ingrese una cantidad válida';
      });
      return;
    }

    final basePrice = _comboPrices[_selectedCombo]! * quantity;
    final discount = basePrice * _paymentDiscounts[_selectedPayment]!;
    final total = basePrice - discount;

    setState(() {
      _result = 'Subtotal: \$${basePrice.toStringAsFixed(2)}\n'
          'Descuento: \$${discount.toStringAsFixed(2)}\n'
          'Total: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combos de Boletos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione Combo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedCombo,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tipo de combo',
              ),
              items: _comboPrices.keys.map((combo) {
                return DropdownMenuItem(value: combo, child: Text(combo));
              }).toList(),
              onChanged: (value) => setState(() => _selectedCombo = value),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cantidad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Número de combos',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Método de Pago',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedPayment,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Forma de pago',
              ),
              items: _paymentDiscounts.keys.map((payment) {
                return DropdownMenuItem(value: payment, child: Text(payment));
              }).toList(),
              onChanged: (value) => setState(() => _selectedPayment = value),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateTotal,
              child: const Text('Calcular Total'),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Card(
                color: Colors.blue[50],
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
    _quantityController.dispose();
    super.dispose();
  }
}
