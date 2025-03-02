import 'package:flutter/material.dart';

class CheckoutProgress extends StatelessWidget {
  final int currentStep;

  const CheckoutProgress({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Row(
            children: [
              _buildStep("Your Cart", "Payment Details", "Confirmation", "Order Placed", index, currentStep),
              if (index < 3) _buildLine(index, currentStep), // Don't add a line after the last step
            ],
          );
        }),
      ),
    );
  }

  Widget _buildStep(String label1, String label2, String label3, String label4, int stepIndex, int currentStep) {
    bool isActive = stepIndex <= currentStep;
    List<String> labels = [label1, label2, label3, label4];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isActive ? Colors.orange : Colors.grey[300],
          child: isActive
              ? const Icon(Icons.check, color: Colors.white, size: 14)
              : null,
        ),
        const SizedBox(height: 6),
        Text(labels[stepIndex], style: TextStyle(fontSize: 12, color: isActive ? Colors.black : Colors.grey)),
      ],
    );
  }

  Widget _buildLine(int stepIndex, int currentStep) {
    bool isActive = stepIndex < currentStep;
    return Container(
      width: 63, // Adjust width to make it closer
      height: 2,
      color: isActive ? Colors.orange : Colors.grey[300],
    );
  }
}
