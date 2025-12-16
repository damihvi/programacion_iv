import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TicketPurchasePage extends StatefulWidget {
  const TicketPurchasePage({super.key});

  @override
  State<TicketPurchasePage> createState() => _TicketPurchasePageState();
}

class _TicketPurchasePageState extends State<TicketPurchasePage> {
  String purchaseMethod = 'Taquilla';
  String amountText = '';
  String ageText = '';
  String idStatus = 'No';
  String resultText = '';

  void calculateTicketFee() {
    final age = int.tryParse(ageText) ?? 0;
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

    // Verificar si es mayor de edad y tiene identificación
    if (age < 18) {
      setState(() {
        resultText = 'Debe ser mayor de edad (18 años o más)';
      });
      return;
    }

    if (idStatus == 'No') {
      setState(() {
        resultText = 'Debe presentar identificación para comprar boletos';
      });
      return;
    }

    if (amount <= 0) {
      setState(() {
        resultText = 'Ingrese un monto válido';
      });
      return;
    }

    double fee = 0.0;

    if (purchaseMethod == 'Taquilla') {
      fee = 0.0;
    } else if (purchaseMethod == 'App móvil') {
      fee = 0.50;
    } else if (purchaseMethod == 'Web') {
      fee = 1.0;
    }

    final total = amount + fee;

    setState(() {
      resultText =
        'Método: $purchaseMethod\n'
        'Comisión: \$${fee.toStringAsFixed(2)}\n'
        'Total a pagar: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comisión de compra'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Comisión por compra de boletos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Edad',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                ageText = value;
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: idStatus,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Sí',
                  child: Text('Sí, tengo identificación'),
                ),
                DropdownMenuItem(
                  value: 'No',
                  child: Text('No tengo identificación'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  idStatus = value;
                });
              },
            ),

            const SizedBox(height: 16),

            DropdownButton<String>(
              value: purchaseMethod,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Taquilla',
                  child: Text('Compra en taquilla'),
                ),
                DropdownMenuItem(
                  value: 'App móvil',
                  child: Text('Compra por app móvil'),
                ),
                DropdownMenuItem(
                  value: 'Web',
                  child: Text('Compra por página web'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  purchaseMethod = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Valor de boletos (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateTicketFee,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
