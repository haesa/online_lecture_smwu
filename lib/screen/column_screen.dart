import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
      ),
      body: Container(
        width: 300,
        color: Colors.grey,
        child: Column(
          // 현업에서는 start, center, end, spaceBetween 많이 사용
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          // stretch: 가능한 교차축 사이즈를 최대한으로 크게 함
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container 3개 추가
            // 가로 세로 100, color 각각 선호하는 컬러 추가
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
