import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/todo_model.dart';

class HomeService {
  Future<void> setData(TodoModel todoModel) async {
    final db = FirebaseFirestore.instance;
    await db.collection('todos').add(todoModel.toJson());
  }

  Future<List<TodoModel>> getData() async {
    final db = FirebaseFirestore.instance;
    final todoList = <TodoModel>[];
    await db.collection('todos').get().then(
      (docSnapshot) {
        for (var doc in docSnapshot.docs) {
          final todoModel = TodoModel.fromJson(doc.data(), doc.id);
          todoList.add(todoModel);
        }
        return todoList;
      },
    );
    return todoList;
  }

  Future<void> deleteData(String doc) async {
    final db = FirebaseFirestore.instance;
    await db.collection('todos').doc(doc).delete();
  }
}

final homeService = HomeService();
