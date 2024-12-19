import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:buddy_front/core/theme/app_pallete.dart';

import '../../models/create_post.dart';
import '../../viewmodel/home_vm/create_post_notifier.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _contentController = TextEditingController();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'Enter post content',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppPalette.blackColor,
                  backgroundColor: AppPalette.yellowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 20),
              if (_selectedImage != null)
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.file(
                        File(_selectedImage!.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Selected Image: ${_selectedImage!.name}'),
                  ],
                ),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final createPostState = ref.watch(postCreateNotifierProvider);

                  return ElevatedButton(
                    onPressed: createPostState.isLoading
                        ? null
                        : () async {
                            final newPost = CreatePost(
                              content: _contentController.text,
                              // Add any other fields required for the post
                            );
                            try {
                              await ref.read(postCreateNotifierProvider.notifier).createPost(newPost,
                                  imageFile: _selectedImage != null ? File(_selectedImage!.path) : null);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Post Created!')),
                              );
                              Navigator.pop(context);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Error: $e')),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPalette.yellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: createPostState.isLoading ? const CircularProgressIndicator() : const Text('Create Post'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
