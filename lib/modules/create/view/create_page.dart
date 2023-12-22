import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/modules/create/bloc/create_bloc.dart';
import 'package:todo_app/modules/home/view/home_page.dart';
import 'package:todo_app/services/home_service.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateBloc(homeService),
      child: const CreateView(),
    );
  }
}

class CreateView extends StatefulWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  final _formKey = GlobalKey<FormState>();
  final temaCtl = TextEditingController();
  final tapshyrmaCtl = TextEditingController();
  final ubakytCtl = TextEditingController();
  DateTime? ubakyt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить задание'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: temaCtl,
                  decoration: const InputDecoration(
                    hintText: 'Тема',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: tapshyrmaCtl,
                  decoration: const InputDecoration(
                    hintText: 'Информация о задании',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  controller: ubakytCtl,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_month),
                    hintText: ubakyt != null
                        ? DateFormat(
                            'd.MM.yyyy',
                          ).format(ubakyt!)
                        : 'Указывай время',
                  ),
                  onTap: () async {
                    ubakyt = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    setState(() {});
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (temaCtl.text.isNotEmpty &&
                          tapshyrmaCtl.text.isNotEmpty) {
                        context.read<CreateBloc>().add(
                              CreateEvent(
                                todoModel: TodoModel(
                                  tema: temaCtl.text,
                                  tapshyrma: tapshyrmaCtl.text,
                                  ubakyt: DateFormat(
                                    'd.MM.yyyy',
                                  ).format(ubakyt!),
                                ),
                              ),
                            );
                        temaCtl.clear();
                        tapshyrmaCtl.clear();
                        ubakytCtl.clear();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const HomePage(),
                          ),
                          (route) => false,
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 60),
                  ),
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
