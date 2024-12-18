import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../models/create_workshop_model.dart';

class WorkshopController {
  Future<File?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image != null ? File(image.path) : null;
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

  CreateWorkshopModel buildWorkshop({
    required String title,
    required String description,
    required String? selectedDate,
    required String location,
    required String hours,
    required String minutes,
    required String instructorInfo,
    required String tags,
    required String registrationLink,
    required String entryFee,
    required int participantLimit,
  }) {
    return CreateWorkshopModel(
      title: title,
      description: description,
      date: selectedDate,
      location: location,
      duration: '$hours:$minutes',
      instructorInfo: instructorInfo,
      tags: tags,
      status: getWorkshopStatus(selectedDate),
      registrationLink: registrationLink,
      entryFee: entryFee,
      participantLimit: participantLimit,
    );
  }
}
