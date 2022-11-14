import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier/provider_controller.dart';
import 'package:tuple/tuple.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({super.key});

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(seconds: 1));
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change notifier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Selector<ProviderController, String>(
            selector: (_, controller) => controller.imgAvatar,
            builder: (_, imgAvatar, __) {
              return Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imgAvatar),
                  radius: 60,
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ProviderController>(
                builder: (_, controller, __) {
                  return Text(controller.name);
                },
              ),
              Consumer<ProviderController>(
                builder: (_, controller, __) {
                  return Text(controller.birthDate);
                },
              ),
            ],
          ),
          Selector<ProviderController, Tuple2<String, String>>(
            selector: (_, controller) =>
                Tuple2(controller.birthDate, controller.name),
            builder: (_, tuple, __) {
              return Text('Idade:${tuple.item1} - Nome:${tuple.item2}');
            },
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ProviderController>().alterarNome();
              },
              child: Text('Alterar nome'))
        ]),
      ),
    );
  }
}
