import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
part 'add_image_state.dart';

class AddImageCubit extends Cubit<AddImageState> {
  AddImageCubit() : super(AddImageInitial());

  final imagePicker = ImagePicker();

  Future pickImageFromGallery() async {
    try {
      var pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      File image;
      String nameImage;
      image = File(pickedImage.path);
      nameImage = basename(pickedImage.path);

      try {
        String url;
        var refStorage = FirebaseStorage.instance.ref('images/$nameImage');
        emit(AddImageLoading());
        await refStorage.putFile(image);
        url = await refStorage.getDownloadURL();
        emit(AddImageSuccess(url: url));
      } catch (e) {
        emit(AddImageFailure());
      }
    } catch (e) {
      emit(AddImageFailure());
    }
  }
}
