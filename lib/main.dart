import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:howzit_zilo/localnotification.dart';
import 'package:fluttertoast/fluttertoast.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Howzit'),
        ),body: const Material(
        child: HomePage(),
      ),
      )

    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) :super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  bool isImageVisible = true;
  TextEditingController textController = TextEditingController();

  void toggleImage(){
    setState(() {
      isImageVisible = !isImageVisible;
    });
  }

  @override
  void initState(){
    super.initState();
   LocalNotification.initialize(flutterLocalNotificationsPlugin);

  }

  @override
  void dispose(){
    textController.dispose();
    super.dispose();
  }
  void onButtonPressed(String name){
    if(name.isEmpty){
      Fluttertoast.showToast(msg: "Please enter a name",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR);
      return;
    }else{
      if (isImageVisible){
        toggleImage();
        LocalNotification.showBigTextNotification(title: "Surprise!", body: "Howzit $name!", fln: flutterLocalNotificationsPlugin);
      }
      else{
        toggleImage();
        textController.clear();
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isImageVisible)
          Image.asset(
            'assets/images/howzit.jpg',
            height: 300,
            width: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
           TextField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: 'Whats your name?',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String enteredText = textController.text;
              onButtonPressed(enteredText);
            },
            child: Text(isImageVisible ? 'Click for a surprise':'Reset'),
          ),
        ],
      ),
    );
  }

}
