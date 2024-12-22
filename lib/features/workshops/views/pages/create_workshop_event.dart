import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../controller/workshop_controller.dart';
import '../../viewmodel/workshop_create_notifier.dart';
import '../widgets/app_button.dart';
import '../widgets/workshop_textfield.dart';

class CreateWorkshopEvent extends ConsumerStatefulWidget {
  const CreateWorkshopEvent({super.key});

  @override
  ConsumerState<CreateWorkshopEvent> createState() => _CreateWorkshopEventState();
}

class _CreateWorkshopEventState extends ConsumerState<CreateWorkshopEvent> {
  final WorkshopController _workshopController = WorkshopController();
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
  final TextEditingController dateController = TextEditingController();

  File? imageFile;

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text = formattedDate;
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
      selectedDate: dateController.text.isNotEmpty ? '${dateController.text}T00:00:00Z' : null,
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
            WorkshopTextfield(
              controller: titleController,
              labelText: 'Title',
            ),
            const SizedBox(height: 16),
            WorkshopTextfield(
              controller: descriptionController,
              labelText: 'Description',
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            WorkshopTextfield(
              controller: locationController,
              labelText: 'Location',
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: WorkshopTextfield(
                    controller: hoursController,
                    labelText: 'Hours',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WorkshopTextfield(
                    controller: minutesController,
                    labelText: 'Minutes',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            WorkshopTextfield(
              controller: instructorInfoController,
              labelText: 'Instructor Info',
            ),
            const SizedBox(height: 16),
            WorkshopTextfield(
              controller: tagsController,
              labelText: 'Tags',
            ),
            const SizedBox(height: 16),
            WorkshopTextfield(
              controller: registrationLinkController,
              labelText: 'Registration Link',
            ),
            const SizedBox(height: 16),
            WorkshopTextfield(
              controller: entryFeeController,
              labelText: 'Entry Fee',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            WorkshopTextfield(
              controller: participantLimitController,
              labelText: 'Participant Limit',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _selectDate,
              child: AbsorbPointer(
                child: WorkshopTextfield(
                  controller: dateController,
                  labelText: 'Select Date',
                  keyboardType: TextInputType.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Display selected image above the button
            imageFile != null
                ? Image.file(
                    imageFile!,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const SizedBox.shrink(), // If no image, display nothing
            const SizedBox(height: 16),
            WorkshopButton(
              buttonText: 'Pick Image',
              onTap: _pickImage,
            ),
            const SizedBox(height: 16),
            WorkshopButton(
              buttonText: 'Submit',
              onTap: _submitWorkshop,
            ),
          ],
        ),
      ),
    );
  }
}
