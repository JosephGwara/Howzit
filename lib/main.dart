import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:howzit_zilo/localnotification.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) :super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  void initState(){
    super.initState();
   LocalNotification.initialize(flutterLocalNotificationsPlugin);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin :Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3ac3cb), Color(0xFFf85187)])),
    child: Scaffold(backgroundColor: Colors.transparent,
    appBar: AppBar(
    backgroundColor: Colors.blue.withOpacity(0.5),
    ),
    body: Center(
    child:Container(
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20)
    ),
    width: 200,
    height: 80,
    child: ElevatedButton(
    onPressed: (){
      LocalNotification.showBigTextNotification(title: "Message Title", body: "Your long body", fln: flutterLocalNotificationsPlugin);
    },child: const Text("SAY Hello"),
    ),
    )
    ),
    )
    );
  }

}
