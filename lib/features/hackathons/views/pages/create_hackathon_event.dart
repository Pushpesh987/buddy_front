import 'package:buddy_front/features/hackathons/models/create_hackathon_model.dart';
import 'package:buddy_front/features/projects/views/widgets/project_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:buddy_front/core/theme/app_pallete.dart';

import '../../viewmodels/hackathon_create_notifier.dart';

class CreateProjectEvent extends ConsumerStatefulWidget {
  const CreateProjectEvent({super.key});

  @override
  _CreateProjectEventState createState() => _CreateProjectEventState();
}

class _CreateProjectEventState extends ConsumerState<CreateProjectEvent> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _themeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _tagsController = TextEditingController();

  String? _startDate;
  String? _registrationDeadline;

  bool _isFormValid = false;

  File? _selectedImage;

  // Helper function to determine the status based on the dates
  String _getHackathonStatus(String? startDate, String? registrationDeadline) {
    if (startDate == null || registrationDeadline == null) {
      return 'Upcoming'; // If any of the dates is null, assume the hackathon is upcoming
    }

    final now = DateTime.now();
    final start = DateTime.parse(startDate);
    final registrationDeadlineDate = DateTime.parse(registrationDeadline);

    if (now.isBefore(start)) {
      return 'Upcoming'; // Start date is in the future, so it's an upcoming hackathon
    } else if (now.isBefore(registrationDeadlineDate)) {
      return 'Ongoing'; // The registration deadline hasn't passed yet, it's ongoing
    } else {
      return 'Completed'; // The registration deadline has passed, so it's completed
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      _checkFormValidity();
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _startDate = DateFormat('yyyy-MM-dd').format(pickedDate) + 'T00:00:00Z';
      });
      _checkFormValidity();
    }
  }

  Future<void> _selectRegistrationDeadline(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _registrationDeadline = DateFormat('yyyy-MM-dd').format(pickedDate) + 'T00:00:00Z';
      });
      _checkFormValidity();
    }
  }

  void _checkFormValidity() {
    final isFormValid = _titleController.text.isNotEmpty &&
        _themeController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _tagsController.text.isNotEmpty &&
        _startDate != null &&
        _registrationDeadline != null;

    setState(() {
      _isFormValid = isFormValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Hackathon'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ProjectTextfield(
                controller: _titleController,
                labelText: 'Hackathon Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Hackathon Title is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              ProjectTextfield(
                controller: _themeController,
                labelText: 'Theme',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Theme is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              ProjectTextfield(
                controller: _descriptionController,
                labelText: 'Description',
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectStartDate(context),
                child: AbsorbPointer(
                  child: ProjectTextfield(
                    controller: TextEditingController(text: _startDate),
                    labelText: 'Start Date',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Start Date is required';
                      }
                      return null;
                    },
                    onChanged: (_) => _checkFormValidity(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectRegistrationDeadline(context),
                child: AbsorbPointer(
                  child: ProjectTextfield(
                    controller: TextEditingController(text: _registrationDeadline),
                    labelText: 'Registration Deadline',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Registration Deadline is required';
                      }
                      return null;
                    },
                    onChanged: (_) => _checkFormValidity(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ProjectTextfield(
                controller: _locationController,
                labelText: 'Location',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Location is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              ProjectTextfield(
                controller: _tagsController,
                labelText: 'Tags',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tags are required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Select Hackathon Image'),
              ),
              if (_selectedImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.file(
                    _selectedImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isFormValid
                    ? () async {
                        final hackathonStatus = _getHackathonStatus(_startDate, _registrationDeadline);
                        final newHackathon = CreateHackathonModel(
                          title: _titleController.text,
                          theme: _themeController.text,
                          description: _descriptionController.text,
                          date: _startDate,
                          location: _locationController.text,
                          media: _selectedImage?.path,
                          registrationDeadline: _registrationDeadline,
                          tags: _tagsController.text,
                          status: hackathonStatus, // Adding the status here
                        );

                        final hackathonCreateNotifier = ref.read(hackathonCreateNotifierProvider.notifier);

                        try {
                          await hackathonCreateNotifier.createHackathon(newHackathon, imageFile: _selectedImage);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Hackathon Created Successfully')));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Error creating hackathon: $e')));
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.yellowColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Create Hackathon',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
