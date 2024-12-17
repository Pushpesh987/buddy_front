import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../functions/workshop_function.dart';
import '../widgets/workshop_textfield.dart';
import 'package:buddy_front/core/theme/app_pallete.dart';
import 'dart:io';

class CreateWorkshopEvent extends ConsumerStatefulWidget {
  const CreateWorkshopEvent({super.key});

  @override
  _CreateWorkshopEventState createState() => _CreateWorkshopEventState();
}

class _CreateWorkshopEventState extends ConsumerState<CreateWorkshopEvent> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _tagsController = TextEditingController();
  final _entryFeeController = TextEditingController();
  final _instructorInfoController = TextEditingController();
  final _registrationLinkController = TextEditingController();
  final _participantLimitController = TextEditingController();

  String? _selectedDate;
  File? _imageFile;

  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();

  // ignore: unused_field
  bool _isFormValid = false;
  String? _durationError;

  // Call the functions from workshop_functions.dart
  Future<void> _selectDate(BuildContext context) async {
    await selectDate(context, (pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _checkFormValidity();
      });
    });
  }

  Future<void> _pickImage() async {
    final selectedImage = await pickImage();
    if (selectedImage != null) {
      setState(() {
        _imageFile = selectedImage;
      });
    }
  }

  void _checkFormValidity() {
    setState(() {
      _isFormValid =
          _titleController.text.isNotEmpty && _selectedDate != null && _descriptionController.text.isNotEmpty;
    });
  }

  void _checkDurationValidity() {
    setState(() {
      _durationError = validateDuration(_hoursController.text, _minutesController.text);
    });
  }

  Future<void> _submitWorkshop(WidgetRef ref) async {
    if (_formKey.currentState?.validate() ?? false) {
      await submitWorkshop(
        context, // Pass context for SnackBar and navigation
        ref, // Pass ref for Riverpod provider access
        _titleController,
        _descriptionController,
        _selectedDate,
        _locationController,
        _hoursController,
        _minutesController,
        _instructorInfoController,
        _tagsController,
        _registrationLinkController,
        _entryFeeController,
        _participantLimitController,
        _imageFile, // Image file if selected
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Workshop Event')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WorkshopTextfield(
                controller: _titleController,
                labelText: 'Event Title',
                validator: (value) => value!.isEmpty ? 'Event Title is required' : null,
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _descriptionController,
                labelText: 'Description',
                validator: (value) => value!.isEmpty ? 'Description is required' : null,
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _locationController,
                labelText: 'Location',
                validator: (value) => value!.isEmpty ? 'Location is required' : null,
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _tagsController,
                labelText: 'Tags',
                validator: (value) => value!.isEmpty ? 'Tags are required' : null,
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _entryFeeController,
                labelText: 'Entry Fee',
                validator: (value) => value!.isEmpty ? 'Entry Fee is required' : null,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _instructorInfoController,
                labelText: 'Instructor Info',
                validator: (value) => value!.isEmpty ? 'Instructor Info is required' : null,
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _registrationLinkController,
                labelText: 'Registration Link',
                validator: (value) => value!.isEmpty ? 'Registration Link is required' : null,
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _participantLimitController,
                labelText: 'Participant Limit',
                validator: (value) => value!.isEmpty ? 'Participant Limit is required' : null,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: WorkshopTextfield(
                    controller: TextEditingController(text: _selectedDate),
                    labelText: 'Date',
                    validator: (value) => value!.isEmpty ? 'Date is required' : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: WorkshopTextfield(
                      controller: _hoursController,
                      labelText: 'Hours',
                      validator: (value) => value!.isEmpty ? 'Hours are required' : null,
                      onChanged: (_) => _checkDurationValidity(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: WorkshopTextfield(
                      controller: _minutesController,
                      labelText: 'Minutes',
                      validator: (value) => value!.isEmpty ? 'Minutes are required' : null,
                      onChanged: (_) => _checkDurationValidity(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              if (_durationError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _durationError!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.yellowColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Center(
                  child: Text(
                    'Pick an Image',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              if (_imageFile != null) ...[
                const SizedBox(height: 10),
                Text('Selected image: ${_imageFile!.path.split('/').last}'),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Pass ref to the submitWorkshop function
                    _submitWorkshop(ref);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.yellowColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Center(
                  child: Text(
                    'Create Workshop Event',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
