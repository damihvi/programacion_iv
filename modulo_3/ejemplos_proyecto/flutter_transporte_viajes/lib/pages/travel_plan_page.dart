import 'package:flutter/material.dart';

class TravelPlanPage extends StatefulWidget {
  const TravelPlanPage({super.key});

  @override
  State<TravelPlanPage> createState() => _TravelPlanPageState();
}

class _TravelPlanPageState extends State<TravelPlanPage> {
  String? _selectedPlan;
  String? _selectedSeason;
  final _budgetController = TextEditingController();
  String _result = '';

  final Map<String, String> _plans = {
    'Plan Económico': 'Incluye transporte básico y hospedaje sencillo',
    'Plan Estándar': 'Transporte confortable y hotel 3 estrellas',
    'Plan Premium': 'Transporte ejecutivo y hotel 5 estrellas',
    'Plan Todo Incluido': 'Transporte VIP, hotel de lujo y tours',
  };

  final Map<String, double> _seasonMultipliers = {
    'Temporada Baja': 0.8,
    'Temporada Media': 1.0,
    'Temporada Alta': 1.5,
    'Temporada Especial': 2.0,
  };

  void _calculatePlan() {
    if (_selectedPlan == null || _selectedSeason == null) {
      setState(() {
        _result = 'Por favor seleccione todas las opciones';
      });
      return;
    }

    final budget = double.tryParse(_budgetController.text);
    if (budget == null || budget <= 0) {
      setState(() {
        _result = 'Por favor ingrese un presupuesto válido';
      });
      return;
    }

    final seasonMultiplier = _seasonMultipliers[_selectedSeason]!;
    final adjustedCost = budget * seasonMultiplier;
    
    String recommendation = '';
    if (adjustedCost < 5000) {
      recommendation = 'Se recomienda el Plan Económico';
    } else if (adjustedCost < 10000) {
      recommendation = 'Se recomienda el Plan Estándar';
    } else if (adjustedCost < 20000) {
      recommendation = 'Se recomienda el Plan Premium';
    } else {
      recommendation = 'Se recomienda el Plan Todo Incluido';
    }

    setState(() {
      _result = 'Plan seleccionado: $_selectedPlan\n'
          '${_plans[_selectedPlan]}\n\n'
          'Temporada: $_selectedSeason\n'
          'Presupuesto base: \$${budget.toStringAsFixed(2)}\n'
          'Costo ajustado: \$${adjustedCost.toStringAsFixed(2)}\n\n'
          '$recommendation';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan de Viaje'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione Plan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedPlan,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tipo de plan',
              ),
              items: _plans.keys.map((plan) {
                return DropdownMenuItem(value: plan, child: Text(plan));
              }).toList(),
              onChanged: (value) => setState(() => _selectedPlan = value),
            ),
            const SizedBox(height: 20),
            const Text(
              'Temporada',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedSeason,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Época del año',
              ),
              items: _seasonMultipliers.keys.map((season) {
                return DropdownMenuItem(value: season, child: Text(season));
              }).toList(),
              onChanged: (value) => setState(() => _selectedSeason = value),
            ),
            const SizedBox(height: 20),
            const Text(
              'Presupuesto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Presupuesto disponible',
                prefixText: '\$',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculatePlan,
              child: const Text('Evaluar Plan'),
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
    _budgetController.dispose();
    super.dispose();
  }
}
