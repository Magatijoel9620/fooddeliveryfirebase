import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_firebase/components/my_button.dart'; // Ensure this is your updated MyButton
import 'package:food_delivery_firebase/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool _isLoading = false; // For MyButton loading state

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Show loading indicator on button
      });

      // Simulate a brief delay (e.g., for a network request in a real app)
      Future.delayed(const Duration(milliseconds: 700), () {
        if (!mounted) return; // Check if the widget is still in the widget tree

        showDialog(
          context: context,
          barrierDismissible: false, // User must interact with dialog
          builder: ((context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            title: const Text('Confirm Payment Details'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  _buildConfirmationRow('Card Number:', cardNumber),
                  _buildConfirmationRow('Expiry Date:', expiryDate),
                  _buildConfirmationRow('Card Holder:', cardHolderName),
                  _buildConfirmationRow('CVV:', cvvCode),
                  const SizedBox(height: 16),
                  const Text(
                    "Proceed with these payment details?",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  if (mounted) {
                    setState(() {
                      _isLoading = false; // Reset loading state
                    });
                  }
                },
                child: Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
              FilledButton( // Using FilledButton for primary action
                style: FilledButton.styleFrom(
                  // backgroundColor: Theme.of(context).colorScheme.primary, // Optional: if MyButton doesn't handle it
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.pushReplacement( // Use pushReplacement to prevent going back to payment
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeliveryProgressPage(),
                    ),
                  );
                  // No need to set _isLoading = false, as we're navigating away.
                },
                child: const Text("Yes, Confirm"),
              ),
            ],
          )),
        );
        // If the dialog is dismissed by other means (e.g. back button if not barrierDismissible),
        // you might want to reset _isLoading here, but barrierDismissible handles it.
      });
    }
  }

  // Helper widget for cleaner confirmation dialog rows
  Widget _buildConfirmationRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: const TextStyle(fontFamily: 'monospace'))), // Monospace for card numbers
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Secure Checkout'),
        backgroundColor: Colors.transparent, // Making AppBar transparent
        elevation: 0, // No shadow for a flatter look if desired
        foregroundColor: colorScheme.onSurface, // Icon and title color based on surface
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Allows content to scroll if it overflows
        padding: const EdgeInsets.all(16.0), // Add padding around the main content
        child: Column(
          children: [
            // Credit Card Widget (Visual Representation)
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {
                // Callback when card brand is detected
              },
              bankName: 'Foodie Bank', // Example bank name
              labelCardHolder: 'CARDHOLDER NAME',
              labelExpiredDate: 'MM/YY',
              cardType: CardType.visa, // Example, can be dynamic
              isChipVisible: true,
              chipColor: Colors.amberAccent,
              obscureCardNumber: true, // Obscure part of the card number for display
              obscureCardCvv: true, // Obscure CVV on the visual card
              cardBgColor: colorScheme.primary.withOpacity(0.9), // Theme the card
              textStyle: TextStyle(color: colorScheme.onPrimary, fontSize: 16),
              height: 190, // Adjust height if needed
              // Customize other properties as available in the package
            ),
            const SizedBox(height: 24),

            // Credit Card Form for Input
            CreditCardForm(
              formKey: formKey,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (CreditCardModel data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                  isCvvFocused = data.isCvvFocused;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction, // Validate as user types
              obscureCvv: true, // Hide CVV input
              obscureNumber: false, // Show card number input (package default)
              inputConfiguration: InputConfiguration(
                cardNumberDecoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.credit_card),
                  labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                  hintStyle: TextStyle(color: colorScheme.onSurfaceVariant.withOpacity(0.7)),
                ),
                expiryDateDecoration: InputDecoration(
                  labelText: 'Expired Date',
                  hintText: 'MM/YY',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.calendar_today),
                  labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                  hintStyle: TextStyle(color: colorScheme.onSurfaceVariant.withOpacity(0.7)),
                ),
                cvvCodeDecoration: InputDecoration(
                  labelText: 'CVV',
                  hintText: 'XXX',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                  hintStyle: TextStyle(color: colorScheme.onSurfaceVariant.withOpacity(0.7)),
                ),
                cardHolderDecoration: InputDecoration(
                  labelText: 'Card Holder Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.person_outline),
                  labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                  hintStyle: TextStyle(color: colorScheme.onSurfaceVariant.withOpacity(0.7)),
                ),

              ),
              // cardNumberKey: const ValueKey('cardNumber'),
              // cardHolderKey: const ValueKey('cardHolderName'),
              // expiryDateKey: const ValueKey('expiryDate'),
              // cvvCodeKey: const ValueKey('cvvCode'),
              // Theme the form text
             // themeColor: colorScheme.primary, // This affects the focused border and cursor
            ),
            const SizedBox(height: 32),

            // Pay Now Button
            MyButton(
              onTap: _isLoading ? null : userTappedPay, // Disable when loading
              text: 'Pay Now',
              isLoading: _isLoading, // Pass loading state
              // You can use the width property if needed:
              // width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: 25), // Bottom padding
          ],
        ),
      ),
    );
  }
}
