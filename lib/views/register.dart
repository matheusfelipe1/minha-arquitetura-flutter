import 'dart:io';

import 'package:archteture/viewModels/register_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _controller = Modular.get<RegisterStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Observer(builder: (_) {
        return _controller.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _name,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Informe seu nome"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Informe seu e-mail"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Observer(builder: (_) {
                    return _controller.loadingImage
                        ? const CircularProgressIndicator()
                        : _controller.user.path != null
                            ? Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                child: ClipOval(
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.file(
                                    File(_controller.user.path ?? ""),
                                    fit: BoxFit.cover,
                                  ),
                                ))
                            : Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      onPressed: () => _controller.getImage(
                                          _name.text, _email.text),
                                      icon: const Icon(
                                        Icons.photo_camera,
                                        color: Colors.white,
                                        size: 60,
                                      )),
                                ));
                  })
                ],
              );
      }),
      bottomSheet: Observer(builder: (_) {
        return _controller.loading ? const SizedBox() : InkWell(
          onTap: _controller.user.name == null || _controller.user.email == null
              ? null
              : () => _controller.register(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 47,
              color: _controller.user.name == null || _controller.user.email == null
                  ? Colors.grey
                  : Colors.blue,
              child: const Center(
                  child: Text(
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 17),
              )),
            ),
          ),
        );
      }),
    );
  }
}
