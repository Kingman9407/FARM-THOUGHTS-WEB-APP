import 'package:farm_thoughts_web_app/commons/widgets/k_text_form_field.dart';
import 'package:farm_thoughts_web_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddVendorForm extends StatefulWidget {
  final VoidCallback onClose;
  final Function(Map<String, String>) onAddVendor;

  const AddVendorForm({
    super.key,
    required this.onClose,
    required this.onAddVendor,
  });

  @override
  State<AddVendorForm> createState() => _AddVendorFormState();
}

class _AddVendorFormState extends State<AddVendorForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController pickupTimeController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    priceController.dispose();
    pickupTimeController.dispose();
    imageUrlController.dispose();
    super.dispose();
  }

  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    priceController.clear();
    pickupTimeController.clear();
    imageUrlController.clear();
  }

  void _handleAddVendor() {
    if (_formKey.currentState!.validate()) {
      final vendorData = {
        'name': nameController.text.trim(),
        'phone': phoneController.text.trim(),
        'price': '₹${priceController.text.trim()}',
        'pickupTime': pickupTimeController.text.trim(),
        'imageUrl': imageUrlController.text.trim().isEmpty
            ? 'http://via.placeholder.com/350x150'
            : imageUrlController.text.trim(),
      };

      widget.onAddVendor(vendorData);
      _clearForm();
      widget.onClose();
    }
  }

  void _handleCancel() {
    _clearForm();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(left: 8.0, right: 16.0, bottom: 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add New Vendor',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Form fields
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Vendor Name Field
                    KTextFormField(
                      label: 'Vendor Name',
                      hintText: 'Enter vendor name',
                      controller: nameController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16),

                    // Phone Number Field
                    KTextFormField(
                      label: 'Phone Number',
                      hintText: 'Enter phone number',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16),

                    // Price Field
                    KTextFormField(
                      label: 'Price (Per Ltr)',
                      hintText: 'Enter price (₹)',
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16),

                    // Pickup Time Field
                    KTextFormField(
                      label: 'Pickup Time',
                      hintText: 'e.g., 9:00 AM',
                      controller: pickupTimeController,
                      isRequired: true,
                    ),
                    const SizedBox(height: 16),

                    // Image URL Field (Optional)
                    KTextFormField(
                      label: 'Image URL',
                      hintText: 'Enter image URL',
                      controller: imageUrlController,
                      isRequired: false,
                    ),
                    const SizedBox(height: 24),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: _handleCancel,
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _handleAddVendor,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: const Text(
                              'Add Vendor',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
