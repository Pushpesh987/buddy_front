import 'package:buddy_front/features/projects/views/widgets/project_textfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:buddy_front/core/theme/app_pallete.dart';

import '../../models/create_project_model.dart';
import '../../viewmodels/profile_create_notifier.dart';

class CreateProjectEvent extends ConsumerStatefulWidget {
  const CreateProjectEvent({super.key});

  @override
  _CreateProjectEventState createState() => _CreateProjectEventState();
}

class _CreateProjectEventState extends ConsumerState<CreateProjectEvent> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _tagsController = TextEditingController();
  final _sponsorsController = TextEditingController();
  final _projectLinkController = TextEditingController();
  final _goalsController = TextEditingController();
  final _domainController = TextEditingController();

  String? _startDate;
  String? _endDate;

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

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _endDate = DateFormat('yyyy-MM-dd').format(pickedDate) + 'T00:00:00Z';
      });
      _checkFormValidity();
    }
  }

  void _checkFormValidity() {
    final isFormValid = _titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _startDate != null &&
        _endDate != null &&
        _tagsController.text.isNotEmpty &&
        _sponsorsController.text.isNotEmpty &&
        _projectLinkController.text.isNotEmpty &&
        _goalsController.text.isNotEmpty &&
        _domainController.text.isNotEmpty;

    setState(() {
      _isFormValid = isFormValid;
    });
  }

  String _getWorkshopStatus(String? selectedDate) {
    if (selectedDate == null) return 'Upcoming';

    final selectedDateTime = DateTime.parse(selectedDate);
    final today = DateTime.now();

    final todayAtMidnight = DateTime(today.year, today.month, today.day);

    if (selectedDateTime.isAtSameMomentAs(todayAtMidnight)) {
      return 'Ongoing';
    } else {
      return 'Completed';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Project'),
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
                labelText: 'Project Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Project Title is required';
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
                onTap: () => _selectEndDate(context),
                child: AbsorbPointer(
                  child: ProjectTextfield(
                    controller: TextEditingController(text: _endDate),
                    labelText: 'End Date',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'End Date is required';
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
              const SizedBox(height: 16),
              ProjectTextfield(
                controller: _sponsorsController,
                labelText: 'Sponsors',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sponsors are required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              ProjectTextfield(
                controller: _projectLinkController,
                labelText: 'Project Link',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Project Link is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              ProjectTextfield(
                controller: _goalsController,
                labelText: 'Goals',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Goals are required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 16),
              ProjectTextfield(
                controller: _domainController,
                labelText: 'Domain',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Domain is required';
                  }
                  return null;
                },
                onChanged: (_) => _checkFormValidity(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Select Project Image'),
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
                        final newProject = CreateProjectModel(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          startDate: _startDate,
                          endDate: _endDate,
                          location: _locationController.text,
                          media: _selectedImage?.path,
                          tags: _tagsController.text,
                          sponsors: _sponsorsController.text,
                          projectLink: _projectLinkController.text,
                          goals: _goalsController.text,
                          domain: _domainController.text,
                          status: _getWorkshopStatus(_startDate),
                        );

                        final profileCreateNotifier = ref.read(profileCreateNotifierProvider.notifier);

                        try {
                          await profileCreateNotifier.createProjects(newProject, imageFile: _selectedImage);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Project Created Successfully')));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Error creating project: $e')));
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
                    'Create Project Event',
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
