

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampleapp/mpin/MPINViewModel.dart';
import 'package:sampleapp/register/register_view.dart';
import 'package:stacked/stacked.dart';


class MPINView extends StatelessWidget {
  const MPINView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<MPINViewModel>.reactive(
        viewModelBuilder: () => MPINViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('MPIN/Password'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   Text("Welcome back ${viewModel.usernm} \n Please enter your mpin/password"),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      controller: viewModel.objPasswordcontroller,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                      validator: (value) {
                        // if (value.isEmpty) {
                        //   return 'Please enter your password';
                        // } else if (value.length < 6) {
                        //   return 'Password must be at least 6 characters';
                        // }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Perform login logic here
                        viewModel.getAccount();
                      },
                      child: Text('Login'),
                    ),
                    SizedBox(height: 20),

                  ],
                ),
              ),
            )
          );

        });
  }
}


