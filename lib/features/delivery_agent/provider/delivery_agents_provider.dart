import 'package:flutter/material.dart';

class DeliveryAgentsProvider extends ChangeNotifier {
  bool isAddedEntriesEnabled = false;
  bool isViewEntriesDetailsEnabled = false;
  bool isEditEntriesEnabled = false;

  Map<String, String>? _selectedAgent;

  Map<String, String>? get selectedAgent => _selectedAgent;

  void setSelectedAgent(Map<String, String> agent) {
    _selectedAgent = agent;
    notifyListeners();
  }

  void resetSelectedAgent() {
    _selectedAgent = null;
    notifyListeners();
  }

  void setViewDetailsEnabled(bool value) {
    isViewEntriesDetailsEnabled = value;
    if (value) {
      isAddedEntriesEnabled = false;
      isEditEntriesEnabled = false;
    }
    notifyListeners();
  }

  void setEditEnabled(bool value) {
    isEditEntriesEnabled = value;
    if (value) {
      isAddedEntriesEnabled = false;
      isViewEntriesDetailsEnabled = false;
    }
    notifyListeners();
  }

  void setAddedEnabled(bool value) {
    isAddedEntriesEnabled = value;
    if (value) {
      isViewEntriesDetailsEnabled = false;
      isEditEntriesEnabled = false;
      _selectedAgent = null;
    }
    notifyListeners();
  }

  void resetAll() {
    isAddedEntriesEnabled = false;
    isViewEntriesDetailsEnabled = false;
    isEditEntriesEnabled = false;
    _selectedAgent = null;
    notifyListeners();
  }
}
