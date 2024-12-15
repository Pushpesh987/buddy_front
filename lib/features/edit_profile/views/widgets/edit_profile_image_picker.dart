import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:buddy_front/core/theme/app_pallete.dart';

class EditProfileImagePicker extends StatefulWidget {
  final double size;
  final String defaultImagePath;
  final String uploadIconPath;
  final ValueChanged<File?> onImagePicked;
  final String? imageUrl;
  final bool enabled;

  const EditProfileImagePicker({
    super.key,
    required this.size,
    required this.defaultImagePath,
    required this.uploadIconPath,
    required this.onImagePicked,
    this.imageUrl,
    this.enabled = true,
  });

  @override
  State<EditProfileImagePicker> createState() => _EditProfileImagePickerState();
}

class _EditProfileImagePickerState extends State<EditProfileImagePicker> {
  XFile? _image;

  Future<void> _pickImage() async {
    if (!widget.enabled) return;

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
      widget.onImagePicked(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
            shape: BoxShape.circle,
            border: Border.all(color: AppPalette.whiteColor, width: 10),
            image: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(widget.imageUrl!),
                    fit: BoxFit.cover,
                  )
                : (_image != null
                    ? DecorationImage(
                        image: FileImage(File(_image!.path)),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage(widget.defaultImagePath),
                        fit: BoxFit.cover,
                      )),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppPalette.yellowColor,
                border: Border.all(
                  color: AppPalette.whiteColor,
                  width: 5,
                ),
              ),
              child: SvgPicture.asset(
                widget.uploadIconPath,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  widget.enabled ? AppPalette.blackColor : AppPalette.greyUnselectedItemColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
