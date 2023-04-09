import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/personal_controller.dart';

class PersonalView extends GetView<PersonalController> {
  const PersonalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PersonalView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PersonalView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
