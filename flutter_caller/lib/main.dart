import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caller/features/clients/data/datasources/remote/client_remote_data_source.dart';
import 'package:flutter_caller/features/clients/data/datasources/remote/client_repository_impl.dart';
import 'package:flutter_caller/features/clients/domain/usercases/add_client.dart';
import 'package:flutter_caller/features/clients/domain/usercases/delete_client.dart';
import 'package:flutter_caller/features/clients/domain/usercases/get_clients.dart';
import 'package:flutter_caller/features/clients/domain/usercases/update_client.dart';
import 'package:flutter_caller/features/clients/presentation/clients_list_screen.dart';
import 'package:flutter_caller/features/clients/presentation/clients_view_model.dart';
import 'package:flutter_caller/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firestore = FirebaseFirestore.instance;
  final remoteDataSource = ClientRemoteDataSourceImpl(firestore);
  final clientRepository = ClientRepositoryImpl(remoteDataSource);

  runApp(MyApp(repository: clientRepository));
}

class MyApp extends StatelessWidget {
  final ClientRepositoryImpl repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ClientsViewModel(
            getClients: GetClients(repository),
            addClient: AddClient(repository),
            updateClient: UpdateClient(repository),
            deleteClient: DeleteClient(repository),
          )..init(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Clients App',
        // theme: ThemeData.dark(),
        home: const ClientsListScreen(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       // home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       home: const ClientsScreen(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
