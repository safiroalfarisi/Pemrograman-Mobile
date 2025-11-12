import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ambil list of plans dari provider
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          // Cari plan yang sesuai di list (update setiap ada perubahan)
          final currentPlan = plans.firstWhere(
                (p) => p.name == plan.name,
            orElse: () => plan,
          );

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        // ambil plan terbaru (bukan dari widget, tapi dari notifier)
        Plan? currentPlan = planNotifier.value
            .firstWhere((p) => p.name == plan.name, orElse: () => plan);

        int planIndex = planNotifier.value.indexWhere((p) => p.name == plan.name);
        if (planIndex == -1) return; // jika tidak ditemukan, keluar

        // tambahkan task baru
        List<Task> updatedTasks =
        List<Task>.from(currentPlan.tasks)..add(const Task());

        // update daftar plan di notifier
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final plans = planNotifier.value;
          final planIndex = plans.indexWhere((p) => p.name == plan.name);
          if (planIndex == -1) return;

          final currentPlan = plans[planIndex];
          final updatedTasks = List<Task>.from(currentPlan.tasks)
            ..[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );

          planNotifier.value = List<Plan>.from(plans)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          final plans = planNotifier.value;
          final planIndex = plans.indexWhere((p) => p.name == plan.name);
          if (planIndex == -1) return;

          final currentPlan = plans[planIndex];
          final updatedTasks = List<Task>.from(currentPlan.tasks)
            ..[index] = Task(
              description: text,
              complete: task.complete,
            );

          planNotifier.value = List<Plan>.from(plans)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
        },
      ),
    );
  }
}
