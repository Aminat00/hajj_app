import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hajj_app/features/dashboard/presentation/screen/signin_screen.dart';
import 'package:hajj_app/models/agenda_task.dart';
import 'package:hajj_app/services/user_service.dart';

class AgendaScreen extends StatefulWidget {
  static final GlobalKey<_AgendaScreenState> globalKey = GlobalKey();
  final Function? callback;

  AgendaScreen({Key? key, this.callback}) : super(key: globalKey);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  bool get isLoggedIn => user.value != null;
  late Future<List<AgendaTask>?> _futureAgenda;
  final ValueNotifier<User?> user = ValueNotifier(FirebaseAuth.instance.currentUser);

  @override
  void didChangeDependencies() {
    refresh();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<User?>(
        valueListenable: user,
        builder: (context, user, _) {
          return user != null ? _agendaList() : _notLoggedWidget();
        });
  }

  refresh() {
    user.value = FirebaseAuth.instance.currentUser;
    if (isLoggedIn) {
      _futureAgenda = Future(() => null);
      _futureAgenda = UserService.fetchAgenda(user.value!.uid);
    }
    setState(() {});
  }

  _agendaList() {
    return FutureBuilder(
      future: _futureAgenda,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const Icon(Icons.error_outline),
                Text("Error fetching data: ${snapshot.error}"),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          var originalResponse = snapshot.data as List<AgendaTask>;
          var response = List.of(originalResponse);
          response.sort((a, b) => a.favourite ? 1 : -1);
          response.sort((a, b) => b.done ? 1 : -1);
          response = List.from(response.reversed);
          return ListView.builder(
            itemCount: response.length,
            itemBuilder: (context, index) {
              AgendaTask task = response[index];
              return _taskTile(
                onDismiss: (direction) {
                  setState(() {
                    UserService.removeTask(
                        user.value!.uid, originalResponse.indexOf(response[index]));
                    response.removeAt(index);
                    refresh();
                  });
                },
                onDone: (value) {
                  response[index].done = !response[index].done;
                  UserService.updateTask(
                    userId: user.value!.uid,
                    index: originalResponse.indexOf(response[index]),
                    task: response[index],
                  );
                  setState(() {});
                },
                onFavourite: () {
                  response[index].favourite = !response[index].favourite;
                  UserService.updateTask(
                    userId: user.value!.uid,
                    index: originalResponse.indexOf(response[index]),
                    task: response[index],
                  );
                  setState(() {});
                },
                index: index,
                task: task,
              );
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  _notLoggedWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Only logged users can use agenda screen',
          textScaleFactor: 1.5,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            ).then((value) {
              refresh();
              widget.callback?.call();
              setState(() {});
              AgendaScreen.globalKey.currentState!.refresh();
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Log in',
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  _taskTile({
    required Function(DismissDirection) onDismiss,
    required Function(bool?) onDone,
    required Function onFavourite,
    required int index,
    required AgendaTask task,
  }) {
    return Dismissible(
      key: ValueKey<int>(index),
      direction: DismissDirection.endToStart,
      onDismissed: onDismiss,
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete_outline,
            size: 36,
            color: Colors.white,
          ),
        ),
      ),
      child: ListTile(
        tileColor: Colors.white,
        leading: Transform.scale(
          scale: 1.4,
          child: Checkbox(
            fillColor: MaterialStateProperty.all(Colors.teal),
            shape: const CircleBorder(),
            value: task.done,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onChanged: onDone,
          ),
        ),
        title: Text(
          task.header,
          style: TextStyle(decoration: task.done ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(
          task.body,
          style: TextStyle(decoration: task.done ? TextDecoration.lineThrough : null),
        ),
        trailing: GestureDetector(
          onTap: () => onFavourite.call(),
          child: AnimatedSwitcher(
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              duration: const Duration(milliseconds: 200),
              child: Icon(
                task.favourite ? Icons.star : Icons.star_outline,
                size: 26,
                key: ValueKey<bool>(task.favourite),
                color: Colors.teal,
              )),
        ),
      ),
    );
  }
}
