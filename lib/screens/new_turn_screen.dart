import 'package:flutter/material.dart';
import 'package:personal_finances_manager/viewmodels/new_turn_viewmodel.dart';
import 'package:provider/provider.dart';

class NewTurnScreen extends StatelessWidget {
  const NewTurnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text("New turn")),
      body: Consumer<NewTurnViewModel>(
        builder: (context, viewModel, _) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Wrap(
                runSpacing: 20.0,
                children: [
                  TextFormField(
                    controller: viewModel.dateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Date",
                      suffixIcon: Icon(Icons.calendar_month)
                    ),
                    onTap: () async {
                      await viewModel.pickDate(context);
                    },
                  ),
                  TextFormField(
                    controller: viewModel.initialHourController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Start Hour",
                      suffixIcon: Icon(Icons.access_time_rounded)
                    ),
                    onTap: () async {
                      await viewModel.pickInitialHour(context);
                    },
                  ),
                  TextFormField(
                    controller: viewModel.initialBreakHourController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Start Break Hour",
                      suffixIcon: Icon(Icons.access_time_rounded)
                    ),
                    onTap: () async {
                      await viewModel.pickInitialBreakHour(context);
                    },
                  ),
                  TextFormField(
                    controller: viewModel.finalBreakHourController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "End Break Hour",
                      suffixIcon: Icon(Icons.access_time_rounded)
                    ),
                    onTap: () async {
                      await viewModel.pickFinalBreakHour(context);
                    },
                  ),
                  TextFormField(
                    controller: viewModel.finalHourController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "End Hour",
                      suffixIcon: Icon(Icons.access_time_rounded)
                    ),
                    onTap: () async {
                      await viewModel.pickFinalHour(context);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await viewModel.create();
                      }
                    }, 
                    child: const Text("Register Turn")
                  )
                ],
              ),
            )
          );
        }
      )
    );
  }
}