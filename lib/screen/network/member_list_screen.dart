import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({super.key});

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://244b-110-8-126-227.ngrok-free.app'));
  bool loading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    Response response = await dio.get('/api/v1/member/all');
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member List'),
      ),
      body: loading ? CircularProgressIndicator() :
        SingleChildScrollView(
          child: Column(
            children: [
              Text('data 호출 완료'),
            ],
          ),
        ),
    );
  }
}
