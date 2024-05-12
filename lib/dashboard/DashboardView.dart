

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sampleapp/dashboard/DashboardViewModel.dart';
import 'package:sampleapp/register/register_view.dart';
import 'package:stacked/stacked.dart';

import '../login/LoginViewModel.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('DashBoard'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                   Text("Welcome - ${viewModel.strNm}"),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Perform login logic here
                       viewModel.logout();
                      },
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
            )
          );

        });
  }
}


