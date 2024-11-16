import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider extends ChangeNotifier {
  EditProfileProvider() {
    nameController.text = currentUser?.displayName ?? '';
    emailController.text = currentUser?.email ?? '';
  }

  XFile? selectedImage;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool loading = false;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  bool get _hasChangedName => nameController.text != currentUser?.displayName;

  bool get _hasChangedEmail => emailController.text != currentUser?.email;

  bool get hasChanges => _hasChangedName || _hasChangedEmail || selectedImage != null;

  Future<void> onNameEditingComplete(String? name) async {
    notifyListeners();
  }

  Future<void> onEmailEditingComplete(String? email) async {
    notifyListeners();
  }

  Future<void> selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = image;
      notifyListeners();
    }
  }

  Future<void> saveChanges() async {
    loading = true;
    notifyListeners();

    if (selectedImage != null) {
      final imageName = selectedImage!.path.split('/').last;
      final ref = FirebaseStorage.instance.ref('/users/${currentUser?.uid}/$imageName');
      final task = await ref.putData(await selectedImage!.readAsBytes());
      final url = await task.ref.getDownloadURL();
      await currentUser?.updatePhotoURL(url);
      selectedImage = null;
    } else if (_hasChangedName) {
      await currentUser?.updateDisplayName(nameController.text);
    } else if (_hasChangedEmail) {
      await currentUser?.verifyBeforeUpdateEmail(emailController.text);
    }
    loading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
