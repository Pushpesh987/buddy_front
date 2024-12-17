import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../models/create_workshop_model.dart';
import '../viewmodel/workshop_create_notifier.dart';

Future<void> selectDate(BuildContext context, Function(String) onDateSelected) async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now().add(const Duration(days: 1)),
    firstDate: DateTime.now().add(const Duration(days: 1)),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    final formattedDate = '${DateFormat('yyyy-MM-dd').format(pickedDate)}T00:00:00Z';
    onDateSelected(formattedDate);
  }
}

Future<File?> pickImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return File(image.path);
  }
  return null;
}

String? validateDuration(String hoursText, String minutesText) {
  final hours = int.tryParse(hoursText);
  final minutes = int.tryParse(minutesText);

  if (hours == null || minutes == null) {
    return 'Please enter valid numbers for hours and minutes.';
  }
  if (minutes >= 60) {
    return 'Minutes cannot be greater than or equal to 60.';
  }
  return null;
}

Future<void> submitWorkshop(
  BuildContext context,
  WidgetRef ref,
  TextEditingController titleController,
  TextEditingController descriptionController,
  String? selectedDate,
  TextEditingController locationController,
  TextEditingController hoursController,
  TextEditingController minutesController,
  TextEditingController instructorInfoController,
  TextEditingController tagsController,
  TextEditingController registrationLinkController,
  TextEditingController entryFeeController,
  TextEditingController participantLimitController,
  File? imageFile,
) async {
  final workshopEvent = CreateWorkshopModel(
    title: titleController.text,
    description: descriptionController.text,
    date: selectedDate,
    location: locationController.text,
    duration: '${hoursController.text}:${minutesController.text}',
    instructorInfo: instructorInfoController.text,
    tags: tagsController.text,
    status: getWorkshopStatus(selectedDate),
    registrationLink: registrationLinkController.text,
    entryFee: entryFeeController.text,
    participantLimit: int.tryParse(participantLimitController.text) ?? 0,
  );

  final createWorkshopNotifier = ref.read(workshopCreateNotifierProvider.notifier); // Use ref for Riverpod provider

  try {
    await createWorkshopNotifier.createWorkshop(workshopEvent, imageFile: imageFile);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Workshop event created successfully!')));
    Navigator.pop(context); // Pop after successful creation
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error creating event: $e')));
  }
}

String getWorkshopStatus(String? selectedDate) {
  if (selectedDate == null) return 'Upcoming';

  final selectedDateTime = DateTime.parse(selectedDate);
  final today = DateTime.now();

  if (selectedDateTime.isAtSameMomentAs(DateTime(today.year, today.month, today.day))) {
    return 'Ongoing';
  } else if (selectedDateTime.isAfter(today)) {
    return 'Upcoming';
  } else {
    return 'Completed';
  }
}
