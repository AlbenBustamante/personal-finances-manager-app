import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finances_manager/viewmodels/turns_viewmodel.dart';
import 'package:provider/provider.dart';

class TurnsScreen extends StatefulWidget {
  const TurnsScreen({super.key});

  @override
  State<TurnsScreen> createState() => _TurnsScreenState();
}

class _TurnsScreenState extends State<TurnsScreen> {
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TurnsViewModel>(context, listen: false).loadTurns();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Turns")),
      body: Consumer<TurnsViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async {}, child: const Text("New Expense / Income")),
              RefreshIndicator(
                key: _refreshKey,
                onRefresh: () async {
                  _refreshKey.currentState?.show();
                  await viewModel.loadTurns();
                },
                child: ListView.builder(
                  itemCount: viewModel.turns.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(DateFormat('dd-MM-yyyy').format(viewModel.turns[index].date))
                    );
                  }
                ))
            ],
          );
        },
      )
    );
  }
}