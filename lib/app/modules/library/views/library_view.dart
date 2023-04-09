import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  const LibraryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LibraryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LibraryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
