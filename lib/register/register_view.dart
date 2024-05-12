

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampleapp/app_router/router.dart';
import 'package:sampleapp/dashboard/DashboardView.dart';
import 'package:sampleapp/register/register_view_model.dart';
import 'package:stacked/stacked.dart';

import '../databasehelper/DatabaseHelper.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<RegisterViewModel>.reactive(
        viewModelBuilder: () => RegisterViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('Register'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    TextFormField(
                     // keyboardType: TextInputType.,
                      controller: viewModel.objUserNmlcontroller,
                      decoration: InputDecoration(
                        labelText: 'User name',
                        hintText: 'Enter your name',
                      ),
                      validator: (value) {
                        // if (value?.isEmpty ?? true) {
                        //   return 'Please enter your email';
                        // }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: viewModel.objEmailcontroller,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
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
                      onPressed: () async {
                        // Perform login logic here
                        // Get.to(const RegisterView());
                       viewModel.addUser();
                        },
                      child: Text('Register'),
                    ),
                  ],
                ),
              ),
            )
          );

        });
  }
}
