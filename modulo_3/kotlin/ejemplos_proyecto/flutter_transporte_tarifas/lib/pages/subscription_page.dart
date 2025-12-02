import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  String subscriptionType = 'Estudiante';
  String amountText = '';
  String resultText = '';

  void calculateSubscription() {
    final amount = double.tryParse(amountText.replaceAll(',', '.')) ?? 0.0;

    if (amount <= 0) {
      setState(() {
        resultText = 'Ingrese un monto válido';
      });
      return;
    }

    double rate = 0.0;

    if (subscriptionType == 'Estudiante') {
      rate = 5.0;
    } else if (subscriptionType == 'Adulto') {
      rate = 3.0;
    } else if (subscriptionType == 'Adulto mayor') {
      rate = 7.0;
    }

    final benefit = amount * rate / 100;
    final total = amount + benefit;

    setState(() {
      resultText =
        'Tipo: $subscriptionType\n'
        'Beneficio mensual: ${rate.toStringAsFixed(1)} %\n'
        'Beneficio ganado: \$${benefit.toStringAsFixed(2)}\n'
        'Valor total con beneficio: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suscripción mensual'),
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
              'Calcular beneficio de suscripción (1 mes)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButton<String>(
              value: subscriptionType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Estudiante',
                  child: Text('Suscripción estudiantil'),
                ),
                DropdownMenuItem(
                  value: 'Adulto',
                  child: Text('Suscripción adulto'),
                ),
                DropdownMenuItem(
                  value: 'Adulto mayor',
                  child: Text('Suscripción adulto mayor'),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  subscriptionType = value;
                });
              },
            ),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Monto de suscripción (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountText = value;
              },
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateSubscription,
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
