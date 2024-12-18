import 'package:buddy_front/features/hackathons/views/widgets/hackathon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:buddy_front/features/hackathons/viewmodels/hackathon_create_notifier.dart';
import '../../../events/view/pages/event_page.dart';
import '../../controllers/create_project_event_controller.dart';

class CreateProjectEvent extends ConsumerStatefulWidget {
  const CreateProjectEvent({super.key});

  @override
  _CreateProjectEventState createState() => _CreateProjectEventState();
}

class _CreateProjectEventState extends ConsumerState<CreateProjectEvent> {
  final _controller = CreateProjectEventController();
  final _formKey = GlobalKey<FormState>();

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
              HackathonTextfield(
                controller: TextEditingController(text: _controller.title),
                labelText: 'Hackathon Title',
                onChanged: (value) => _controller.title = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Hackathon Title is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.theme),
                labelText: 'Theme',
                onChanged: (value) => _controller.theme = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Theme is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.description),
                labelText: 'Description',
                maxLines: 4,
                onChanged: (value) => _controller.description = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  final DateTime now = DateTime.now();
                  final DateTime tomorrow = now.add(Duration(days: 1));
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: tomorrow,
                    firstDate: tomorrow,
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    _controller.selectStartDate(pickedDate);
                    setState(() {});
                  }
                },
                child: AbsorbPointer(
                  child: HackathonTextfield(
                    controller: TextEditingController(text: _controller.startDate),
                    labelText: 'Start Date',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Start Date is required';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  if (_controller.startDate == null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Please select a Start Date first')));
                    return;
                  }

                  final DateTime startDate = DateTime.parse(_controller.startDate!);
                  final DateTime minRegistrationDeadline = startDate.add(Duration(days: 2));

                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: minRegistrationDeadline,
                    firstDate: minRegistrationDeadline,
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    if (pickedDate.isAtSameMomentAs(startDate)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration Deadline cannot be the same as Start Date')));
                    } else {
                      _controller.selectRegistrationDeadline(pickedDate);
                      setState(() {});
                    }
                  }
                },
                child: AbsorbPointer(
                  child: HackathonTextfield(
                    controller: TextEditingController(text: _controller.registrationDeadline),
                    labelText: 'Registration Deadline',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Registration Deadline is required';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.location),
                labelText: 'Location',
                onChanged: (value) => _controller.location = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Location is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.tags),
                labelText: 'Tags',
                onChanged: (value) => _controller.tags = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tags are required';
                  }
                  return null;
                },
              ),
              // Add new fields below
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.entryFee),
                labelText: 'Entry Fee',
                keyboardType: TextInputType.number,
                onChanged: (value) => _controller.entryFee = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entry Fee is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.prizePool),
                labelText: 'Prize Pool',
                keyboardType: TextInputType.number,
                onChanged: (value) => _controller.prizePool = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Prize Pool is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.organizerContact),
                labelText: 'Organizer Contact',
                keyboardType: TextInputType.phone,
                onChanged: (value) => _controller.organizerContact = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Organizer Contact is required';
                  }
                  if (value.length != 10 || !RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.attendeeCount),
                labelText: 'Attendee Count',
                keyboardType: TextInputType.number,
                onChanged: (value) => _controller.attendeeCount = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Attendee Count is required';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid integer';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.organizerName),
                labelText: 'Organizer Name',
                onChanged: (value) => _controller.organizerName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Organizer Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _controller.pickImage(() => setState(() {}));
                },
                child: const Text('Select Image'),
              ),
              if (_controller.selectedImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.file(
                    _controller.selectedImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _controller.isFormValid
                    ? () async {
                        final newHackathon = _controller.buildHackathon();
                        final hackathonCreateNotifier = ref.read(hackathonCreateNotifierProvider.notifier);

                        try {
                          await hackathonCreateNotifier.createHackathon(
                            newHackathon,
                            imageFile: _controller.selectedImage,
                          );

                          // Show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Hackathon Created Successfully')),
                          );

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EventPage(initialIndex: 1),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error creating hackathon: $e')),
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
