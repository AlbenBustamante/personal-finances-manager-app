import 'package:flutter/material.dart';
import 'package:personal_finances_manager/viewmodels/new_expense_viewmodel.dart';
import 'package:provider/provider.dart';

class NewExpenseScreen extends StatelessWidget {
  const NewExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New expense")),
      body: Consumer<NewExpenseViewModel>(
        builder: (context, viewModel, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Form(
              child: Wrap(
                runSpacing: 20.0,
                children: [
                  TextFormField(
                    controller: viewModel.descriptionController,
                    decoration: const InputDecoration(labelText: "Description"),
                    validator: (value) => value!.isEmpty ? 'Provide a description' : '',
                  ),
                  TextFormField(
                    controller: viewModel.valueController,
                    decoration: const InputDecoration(labelText: "Value"),
                    validator: (value) => value!.isEmpty ? 'Provide the value' : '',
                  ),
                  TextFormField(
                    controller: viewModel.categoryController,
                    decoration: const InputDecoration(labelText: "Category"),
                    validator: (value) => value!.isEmpty ? 'Provide a category' : '',
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add expense")
                    )
                  )
                ],
              )
            )
          );
        },
      )
    );
  }
}
