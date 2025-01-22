import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MemberRegisterScreen extends StatefulWidget {
  const MemberRegisterScreen({super.key});

  @override
  State<MemberRegisterScreen> createState() => _NetworkRegisterScreenState();
}

class _NetworkRegisterScreenState extends State<MemberRegisterScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    futureBasic();

    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Column(
        children: [
          TextFormField(controller: idController),
          TextFormField(controller: pwController),
          ElevatedButton(
            onPressed: () async {
              /// 회원가입 API 호출
              Dio dio = Dio(BaseOptions(baseUrl: 'https://7210-110-8-126-227.ngrok-free.app'));
              var response = await dio.post('/api/v1/member', data: {
                'email': idController.text,
                'password': pwController.text,
              });

              if (response.statusCode == 201) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('성공')),
                );
              }

              await Future.delayed(const Duration(seconds: 1));
              Navigator.pop(context, true);
            },
            child: Text('로그인'),
          ),
        ],
      ),
    );
  }

  Future<void> futureBasic() async {
    print('시작');
    // await이 있으면 해당 코드가 끝날 때까지 기다린다.
    await Future.delayed(
      Duration(seconds: 2),
      () {
        print('Duration 완료');
      },
    );
    print('종료');
  }
}