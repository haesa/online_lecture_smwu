import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_lecture_smwu/screen/state_management/get/get_x_screen.dart';
import 'package:online_lecture_smwu/screen/state_management/notifier/notifier_screen.dart';
import 'package:online_lecture_smwu/screen/state_management/provider/provider_screen.dart';

class StateManagementScreen extends StatelessWidget {
  const StateManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagement')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GetXScreen();
              }));
            },
            child: Text('GetX'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProviderScreen();
              }));
            },
            child: Text('Provider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotifierScreen();
              }));
            },
            child: Text('Notifier'),
          ),
        ],
      ),
    );
  }
}
