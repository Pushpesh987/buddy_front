import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/theme.dart';
import '../../models/create_workshop_model.dart';
import '../../viewmodel/workshop_create_notifier.dart';
import '../widgets/workshop_textfield.dart';
import 'package:buddy_front/core/theme/app_pallete.dart';

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
  final _entryFeeController = TextEditingController();
  final _instructorInfoController = TextEditingController();
  final _tagsController = TextEditingController();
  final _participantLimitController = TextEditingController();
  final _registrationLinkController = TextEditingController();

  String? _selectedDate;

  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();

  bool _isFormValid = false;

  File? _selectedImage;

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

  String _getWorkshopStatus(String? selectedDate) {
    if (selectedDate == null) return 'Upcoming';

    final selectedDateTime = DateTime.parse(selectedDate);
    final today = DateTime.now();

    final todayAtMidnight = DateTime(today.year, today.month, today.day);

    if (selectedDateTime.isAtSameMomentAs(todayAtMidnight)) {
      return 'Ongoing';
    } else if (selectedDateTime.isAfter(todayAtMidnight)) {
      return 'Upcoming';
    } else {
      return 'Completed';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate) + 'T00:00:00Z';
      });
      _checkFormValidity();
    }
  }

  void _checkFormValidity() {
    final isFormValid = _titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _entryFeeController.text.isNotEmpty &&
        _selectedDate != null &&
        _hoursController.text.isNotEmpty &&
        _minutesController.text.isNotEmpty &&
        _instructorInfoController.text.isNotEmpty &&
        _tagsController.text.isNotEmpty &&
        _participantLimitController.text.isNotEmpty &&
        _registrationLinkController.text.isNotEmpty;

    setState(() {
      _isFormValid = isFormValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final createWorkshopNotifier = ref.watch(workshopCreateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Workshop Event'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              WorkshopTextfield(
                controller: _titleController,
                labelText: 'Event Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Event Title is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
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
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: WorkshopTextfield(
                    controller: TextEditingController(text: _selectedDate),
                    labelText: 'Date',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is required';
                      }
                      return null;
                    },
                    onChanged: (_) => _checkFormValidity(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
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
              WorkshopTextfield(
                controller: _entryFeeController,
                labelText: 'Entry Fee (INR)',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entry Fee is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 30),
              Text(
                'Duration of the Workshop',
                style: AppTheme.titleMediumStyle.copyWith(
                  color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: WorkshopTextfield(
                      controller: _hoursController,
                      labelText: 'Hours',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Hours are required';
                        }
                        return null;
                      },
                      onChanged: (_) => _checkFormValidity(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: WorkshopTextfield(
                      controller: _minutesController,
                      labelText: 'Minutes',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Minutes are required';
                        }
                        return null;
                      },
                      onChanged: (_) => _checkFormValidity(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _instructorInfoController,
                labelText: 'Instructor Info',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Instructor Info is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
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
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _participantLimitController,
                labelText: 'Participant Limit',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Participant Limit is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              WorkshopTextfield(
                controller: _registrationLinkController,
                labelText: 'Registration Link',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Registration Link is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Select Workshop Image'),
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
                        final duration =
                            '${_hoursController.text.padLeft(2, '0')}:${_minutesController.text.padLeft(2, '0')}:00';

                        final workshopEvent = CreateWorkshopModel(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          date: _selectedDate,
                          location: _locationController.text,
                          entryFee: int.tryParse(_entryFeeController.text) ?? 0,
                          duration: duration,
                          instructorInfo: _instructorInfoController.text,
                          tags: _tagsController.text,
                          participantLimit: int.tryParse(_participantLimitController.text) ?? 0,
                          registrationLink: _registrationLinkController.text,
                          status: _getWorkshopStatus(_selectedDate),
                        );

                        try {
                          await createWorkshopNotifier.createWorkshop(workshopEvent, imageFile: _selectedImage);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Event created successfully!')),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error creating event: $e')),
                          );
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
                    'Create Workshop Event',
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
