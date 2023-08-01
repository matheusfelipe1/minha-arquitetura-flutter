import 'package:archteture/shared/widgets/cardtile.dart';
import 'package:archteture/viewModels/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  final _controller = Modular.get<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(builder: (_) {
                return _controller.initSearch
                    ? InkWell(
                        onTap: _controller.tapSearc,
                        child: const Icon(Icons.cancel),
                      )
                    : InkWell(
                        onTap: _controller.tapSearc,
                        child: const Icon(Icons.search),
                      );
              }))
        ],
        title: Observer(builder: (_) {
          return !_controller.initSearch
              ? const Text("App Example")
              : Container(
                  height: 37,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 229, 229),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      onChanged: (value) {
                        _controller.filter(value);
                      },
                      style: const TextStyle(
                          color: Color.fromARGB(255, 37, 37, 37)),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Pesquise",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 68, 68, 68))),
                    ),
                  ),
                );
        }),
      ),
      body: Container(
        child: Observer(builder: (_) {
          return _controller.users.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _controller.users.length,
                  itemBuilder: (context, i) {
                    final data = _controller.users[i];
                    return CardTile(data: data, controller: _controller,);
                  });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed('register'),
        child: const Icon(Icons.person_add),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
