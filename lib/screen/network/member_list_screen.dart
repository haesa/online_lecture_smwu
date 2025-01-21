import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_lecture_smwu/screen/network/member_model.dart';

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({super.key});

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://244b-110-8-126-227.ngrok-free.app'));
  List<MemberModel> dataList = [];
  bool loading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    Response response = await dio.get('/api/v1/member/all');

    /// as: casting
    /// Iterable: repeative data
    /// element: {"email":"abc@naver.com", "description":""}
    // dataList = (response.data as Iterable).map<MemberModel>((element) {
    //   Map<String, String> value = element as Map<String, String>;
    //   return MemberModel(
    //       /// ?? : case null -> give base value
    //       value["email"] ?? "",
    //       value["description"] ?? ""
    //   );
    // }).toList();

    /// short code
    dataList = response.data.map<MemberModel>((e) => MemberModel(email: e["email"] ?? "", description: e["description"] ?? "")).toList();

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
