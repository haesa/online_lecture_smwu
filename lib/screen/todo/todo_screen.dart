import 'package:flutter/material.dart';
import 'package:online_lecture_smwu/screen/todo/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController controller = TextEditingController();
  List<TodoModel> todoList = [
    TodoModel(name: 'test', complete: false),
    TodoModel(name: 'test2', complete: false),
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo-List'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(controller: controller),
                  ),
                  TextButton(
                    onPressed: () {
                      if (controller.text.isEmpty) return;
                      if (todoList.any((element) => controller.text == element.name)) return;

                      todoList.add(TodoModel(name: controller.text, complete: false));
                      controller.text = '';
                      setState(() {});
                    },
                    child: Text('등록'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return item(todoList[index], index);
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Colors.grey);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(TodoModel todoModel, int index) {
    return Row(
      children: [
        Checkbox(
          key: Key(todoModel.name),
          value: todoModel.complete,
          onChanged: (value) {
            todoModel.complete = value!;
            setState(() {});
          },
        ),
        Expanded(
          child: Text(todoModel.name),
        ),
        IconButton(
          onPressed: () {
            /// 1번: todoModel에 있는 정보를 사용해서 삭제
            // todoList.removeWhere((element) => element.name == todoModel.name);
            // setState(() {});

            /// 2번: index를 사용해서 삭제
            // todoList.removeAt(index);
            // setState(() {});

            todoList.remove(todoModel);
            setState(() {});
          },
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}


