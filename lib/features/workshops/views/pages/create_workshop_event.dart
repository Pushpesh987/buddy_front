import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../controller/workshop_controller.dart';
import '../../viewmodel/workshop_create_notifier.dart';

class CreateWorkshopEvent extends ConsumerStatefulWidget {
  const CreateWorkshopEvent({super.key});

  @override
  ConsumerState<CreateWorkshopEvent> createState() => _CreateWorkshopEventState();
}

class _CreateWorkshopEventState extends ConsumerState<CreateWorkshopEvent> {
  final WorkshopController _workshopController = WorkshopController();

  // Controllers for form fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController instructorInfoController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();
  final TextEditingController registrationLinkController = TextEditingController();
  final TextEditingController entryFeeController = TextEditingController();
  final TextEditingController participantLimitController = TextEditingController();

  String? selectedDate;
  File? imageFile;

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = '${DateFormat('yyyy-MM-dd').format(pickedDate)}T00:00:00Z';
      });
    }
  }

  Future<void> _pickImage() async {
    final file = await _workshopController.pickImage();
    setState(() {
      imageFile = file;
    });
  }

  Future<void> _submitWorkshop() async {
    final workshop = _workshopController.buildWorkshop(
      title: titleController.text,
      description: descriptionController.text,
      selectedDate: selectedDate,
      location: locationController.text,
      hours: hoursController.text,
      minutes: minutesController.text,
      instructorInfo: instructorInfoController.text,
      tags: tagsController.text,
      registrationLink: registrationLinkController.text,
      entryFee: entryFeeController.text,
      participantLimit: int.tryParse(participantLimitController.text) ?? 0,
    );

    final notifier = ref.read(workshopCreateNotifierProvider.notifier);

    try {
      await notifier.createWorkshop(workshop, imageFile: imageFile);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Workshop event created successfully!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating event: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Workshop')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: hoursController,
                    decoration: const InputDecoration(labelText: 'Hours'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: minutesController,
                    decoration: const InputDecoration(labelText: 'Minutes'),
                  ),
                ),
              ],
            ),
            TextField(
              controller: instructorInfoController,
              decoration: const InputDecoration(labelText: 'Instructor Info'),
            ),
            TextField(
              controller: tagsController,
              decoration: const InputDecoration(labelText: 'Tags'),
            ),
            TextField(
              controller: registrationLinkController,
              decoration: const InputDecoration(labelText: 'Registration Link'),
            ),
            TextField(
              controller: entryFeeController,
              decoration: const InputDecoration(labelText: 'Entry Fee'),
            ),
            TextField(
              controller: participantLimitController,
              decoration: const InputDecoration(labelText: 'Participant Limit'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectDate,
              child: const Text('Select Date'),
            ),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitWorkshop,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
