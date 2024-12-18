import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:buddy_front/features/hackathons/models/create_hackathon_model.dart';

class CreateProjectEventController {
  File? selectedImage;
  String? startDate;
  String? registrationDeadline;

  String? title;
  String? theme;
  String? description;
  String? location;
  String? tags;

  // New fields
  String? entryFee;
  String? prizePool;
  String? organizerContact;
  String? attendeeCount;
  String? organizerName;

  bool isFormValid = false;

  String getHackathonStatus(String? startDate, String? registrationDeadline) {
    if (startDate == null || registrationDeadline == null) {
      return 'Upcoming';
    }

    final now = DateTime.now();
    final start = DateTime.parse(startDate);
    final registrationDeadlineDate = DateTime.parse(registrationDeadline);

    if (now.isBefore(start)) {
      return 'Upcoming';
    } else if (now.isBefore(registrationDeadlineDate)) {
      return 'Ongoing';
    } else {
      return 'Completed';
    }
  }

  Future<void> pickImage(Function updateStateCallback) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      updateStateCallback();
      checkFormValidity();
    }
  }

  Future<void> selectStartDate(DateTime pickedDate) async {
    startDate = '${DateFormat('yyyy-MM-dd').format(pickedDate)}T00:00:00Z';
    checkFormValidity();
  }

  Future<void> selectRegistrationDeadline(DateTime pickedDate) async {
    registrationDeadline = '${DateFormat('yyyy-MM-dd').format(pickedDate)}T00:00:00Z';
    checkFormValidity();
  }

  void checkFormValidity() {
    isFormValid = title != null &&
        theme != null &&
        description != null &&
        location != null &&
        tags != null &&
        startDate != null &&
        registrationDeadline != null &&
        entryFee != null &&
        prizePool != null &&
        organizerContact != null &&
        attendeeCount != null &&
        organizerName != null;
  }

  CreateHackathonModel buildHackathon() {
    return CreateHackathonModel(
      title: title!,
      theme: theme!,
      description: description!,
      date: startDate,
      location: location!,
      registrationDeadline: registrationDeadline,
      tags: tags!,
      status: getHackathonStatus(startDate, registrationDeadline),
      entryFee: entryFee,
      prizePool: prizePool,
      organizerContact: organizerContact,
      attendeeCount: attendeeCount,
      organizerName: organizerName,
    );
  }
}
