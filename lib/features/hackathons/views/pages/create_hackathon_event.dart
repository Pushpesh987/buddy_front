import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../controllers/create_hackathon_event_controller.dart';
import '../../models/create_hackathon_model.dart';
import '../../viewmodels/hackathon_create_notifier.dart';
import '../widgets/hackathon_button.dart';
import '../widgets/hackathon_textfield.dart';

class CreateHackathonEvent extends ConsumerStatefulWidget {
  const CreateHackathonEvent({super.key});

  @override
  _CreateHackathonEventState createState() => _CreateHackathonEventState();
}

class _CreateHackathonEventState extends ConsumerState<CreateHackathonEvent> {
  final _controller = CreateHackathonEventController();
  final _formKey = GlobalKey<FormState>();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  bool _isLoading = false;

  Future<void> _selectDate(BuildContext context, String type) async {
    DateTime initialDate = type == 'startDate'
        ? DateTime.now().add(Duration(days: 1))
        : DateTime.parse(_controller.startDate!).add(Duration(days: 1));

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: initialDate,
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        if (type == 'startDate') {
          _controller.startDate = _dateFormat.format(selectedDate);
        } else if (type == 'registrationDeadline') {
          _controller.registrationDeadline = _dateFormat.format(selectedDate);
        }
      });
    }
  }

  void _handleCreateHackathon() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      CreateHackathonModel newHackathon = CreateHackathonModel(
        title: _controller.title,
        theme: _controller.theme,
        description: _controller.description,
        date: _controller.startDate,
        location: _controller.location,
        entryFee: _controller.entryFee,
        prizePool: _controller.prizePool,
        registrationDeadline: _controller.registrationDeadline,
        organizerName: _controller.organizerName,
        organizerContact: _controller.organizerContact,
        tags: _controller.tags,
        status: 'Upcoming',
        attendeeCount: _controller.attendeeCount,
      );

      final notifier = ref.read(hackathonCreateNotifierProvider.notifier);

      try {
        await notifier.createHackathon(newHackathon, imageFile: _controller.selectedImage);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Hackathon created successfully!')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating hackathon: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
              HackathonTextfield(
                controller: TextEditingController(text: _controller.title),
                labelText: 'Hackathon Title',
                onChanged: (value) => _controller.title = value,
                validator: (value) => value?.isEmpty ?? true ? 'Hackathon Title is required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.theme),
                labelText: 'Theme',
                onChanged: (value) => _controller.theme = value,
                validator: (value) => value?.isEmpty ?? true ? 'Theme is required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.description),
                labelText: 'Description',
                maxLines: 3,
                onChanged: (value) => _controller.description = value,
                validator: (value) => value?.isEmpty ?? true ? 'Description is required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.location),
                labelText: 'Location',
                onChanged: (value) => _controller.location = value,
                validator: (value) => value?.isEmpty ?? true ? 'Location is required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.tags),
                labelText: 'Tags',
                onChanged: (value) => _controller.tags = value,
                validator: (value) => value?.isEmpty ?? true ? 'Tags are required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.entryFee),
                labelText: 'Entry Fee',
                onChanged: (value) => _controller.entryFee = value,
                validator: (value) => value?.isEmpty ?? true ? 'Entry Fee is required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.prizePool),
                labelText: 'Prize Pool',
                onChanged: (value) => _controller.prizePool = value,
                validator: (value) => value?.isEmpty ?? true ? 'Prize Pool is required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.organizerContact),
                labelText: 'Organizer Contact',
                onChanged: (value) => _controller.organizerContact = value,
                validator: (value) => value?.isEmpty ?? true ? 'Organizer Contact is required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.attendeeCount),
                labelText: 'Attendee Count',
                onChanged: (value) => _controller.attendeeCount = value,
                validator: (value) => value?.isEmpty ?? true ? 'Attendee Count is required' : null,
              ),
              const SizedBox(height: 16),
              HackathonTextfield(
                controller: TextEditingController(text: _controller.organizerName),
                labelText: 'Organizer Name',
                onChanged: (value) => _controller.organizerName = value,
                validator: (value) => value?.isEmpty ?? true ? 'Organizer Name is required' : null,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context, 'startDate'),
                child: AbsorbPointer(
                  child: HackathonTextfield(
                    controller: TextEditingController(text: _controller.startDate ?? ''),
                    labelText: 'Start Date',
                    keyboardType: TextInputType.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _controller.startDate == null ? null : () => _selectDate(context, 'registrationDeadline'),
                child: AbsorbPointer(
                  child: HackathonTextfield(
                    controller: TextEditingController(text: _controller.registrationDeadline ?? ''),
                    labelText: 'Registration Deadline',
                    keyboardType: TextInputType.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_controller.selectedImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image.file(
                    _controller.selectedImage!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: HackathonButton(
                  buttonText: _controller.selectedImage == null ? 'Select Image' : 'Image Selected',
                  onTap: () => _controller.pickImage(() {
                    setState(() {});
                  }),
                ),
              ),
              const SizedBox(height: 16),
              HackathonButton(
                buttonText: _isLoading ? null : 'Create Hackathon',
                isLoading: _isLoading,
                onTap: _isLoading ? null : _handleCreateHackathon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
