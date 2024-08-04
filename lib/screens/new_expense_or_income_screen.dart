import 'package:flutter/material.dart';
import 'package:personal_finances_manager/viewmodels/new_expense_or_income_viewmodel.dart';
import 'package:provider/provider.dart';

class NewExpenseOrIncomeScreen extends StatelessWidget {
  const NewExpenseOrIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Consumer<NewExpenseOrIncomeViewModel>(
        builder: (context, viewModel, _) {
          return Text(viewModel.title);
        }
      )),
      body: Consumer<NewExpenseOrIncomeViewModel>(
        builder: (context, viewModel, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Wrap(
                runSpacing: 20.0,
                children: [
                  DropdownButton<String>(
                    value: viewModel.selectedType,
                    onChanged: (value) {
                      if (value != null) {
                        viewModel.selectedType = value;
                      }
                    },
                    items: viewModel.types.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                      );
                    }).toList()
                  ),
                  TextFormField(
                    controller: viewModel.dateController,
                    decoration: const InputDecoration(
                      labelText: "Date", 
                      suffixIcon: Icon(Icons.calendar_month)
                    ),
                    readOnly: true,
                    onTap: () async {
                      await viewModel.pickDate(context);
                    },
                    validator: (value) => value!.isEmpty ? 'Provide the date' : ''
                  ),
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                        }
                          await viewModel.create();
                      },
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
