import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_lecture_smwu/screen/network/member_detail_screen.dart';
import 'package:online_lecture_smwu/screen/network/member_model.dart';

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({super.key});

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://7210-110-8-126-227.ngrok-free.app'));
  List<MemberModel> dataList = [];
  bool loading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    Response response = await dio.get('/api/v1/member/all');
    await Future.delayed(Duration(seconds: 1));

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
    dataList = response.data
        .map<MemberModel>(
            (e) => MemberModel(email: e["email"] ?? "", description: e["description"] ?? ""))
        .toList();

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member List'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : memberListView(),
    );
  }

  // 1. ListView
  Widget memberListView() {
    return ListView.builder(
      itemCount: dataList.length,
      padding: EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MemberDetailScreen(email: dataList[index].email, dio: dio);
            }));
          },
          child: item(dataList[index]),
        );
      },
    );
  }

  // 2. SingleChildScrollView
  Widget memberSingle() {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(dataList.length, (index) {
            return item(dataList[index]);
          })
        ],
      ),
    );
  }

  Widget item(MemberModel member) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '이메일 : ${member.email}',
            style: TextStyle(fontSize: 15),
          ),
          Text(
            '설명 : ${member.description}',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
