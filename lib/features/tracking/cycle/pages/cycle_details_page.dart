import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/enums/cycle_status.dart';
import '../models/enums/flow_intensity.dart';
import '../models/menstrual_cycle.dart';

class CycleDetailsPage extends StatelessWidget {
  final MenstrualCycle cycle;

  const CycleDetailsPage({
    super.key,
    required this.cycle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails du cycle"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    Icons.monitor_heart,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _status(cycle.status),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(_flowIntensity(cycle.flowIntensity)),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          _InfoTile(
            icon: Icons.calendar_today_outlined,
            title: "Date de début",
            value: _formatDate(cycle.startDate),
          ),

          const SizedBox(height: 16),

          _InfoTile(
            icon: Icons.event_available_outlined,
            title: "Date de fin",
            value: cycle.endDate == null
                ? "Cycle en cours"
                : _formatDate(cycle.endDate!),
          ),

          const SizedBox(height: 16),

          _InfoTile(
            icon: Icons.timelapse_outlined,
            title: "Durée des règles",
            value: cycle.actualPeriodLength == null
                ? "-"
                : "${cycle.actualPeriodLength} jours",
          ),

          const SizedBox(height: 16),

          _InfoTile(
            icon: Icons.water_drop_outlined,
            title: "Flux menstruel",
            value: _flowIntensity(cycle.flowIntensity),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat("dd MMMM yyyy", "fr").format(date);
  }

  String _status(CycleStatus status) {
    switch (status) {
      case CycleStatus.ongoing:
        return "En cours";

      case CycleStatus.completed:
        return "Terminé";
    }
  }

  String _flowIntensity(FlowIntensity? intensity) {
    switch (intensity) {
      case FlowIntensity.light:
        return "Léger";

      case FlowIntensity.medium:
        return "Moyen";

      case FlowIntensity.heavy:
        return "Abondant";

      case null:
        return "-";
    }
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(title),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}