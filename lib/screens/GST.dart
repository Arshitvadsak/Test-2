import 'package:flutter/material.dart';

class GstCalculator extends StatefulWidget {
  @override
  _GstCalculatorState createState() => _GstCalculatorState();
}

class _GstCalculatorState extends State<GstCalculator> {
  double price = 0;
  double gstRate = 0.18;

  void _onPriceChanged(double value) {
    setState(() {
      price = value;
    });
  }

  void _onGstRateChanged(double value) {
    setState(() {
      gstRate = value;
    });
  }

  double _calculateGstAmount() {
    return price * gstRate;
  }

  double _calculateTotalPrice() {
    return price + _calculateGstAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GST Calculator',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: Colors.brown[400],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Price: $price',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: price,
              min: 0,
              max: 1000,
              divisions: 100,
              onChanged: _onPriceChanged,
              activeColor: Colors.brown,
            ),
            Text(
              'GST Rate: ${gstRate * 100.toInt()}%',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: gstRate.toDouble(),
              min: 0.01,
              max: 0.28,
              divisions: 14,
              onChanged: _onGstRateChanged,
              label: '${(gstRate * 100).toInt()}%',
              activeColor: Colors.brown,
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'GST Amount: ${_calculateGstAmount().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Total Price: ${_calculateTotalPrice().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
