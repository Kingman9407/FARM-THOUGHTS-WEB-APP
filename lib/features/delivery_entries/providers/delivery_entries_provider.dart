import 'package:flutter/material.dart';

class DeliveryEntriesProvider extends ChangeNotifier {
  bool isAddedEnabled = false;
  bool isViewDetailsEnabled = false;
  bool isEditEnabled = false;
  bool isDeliveredAgentsAdded = false;

  void setDeliveredAgentsAdded(bool value) {
    isDeliveredAgentsAdded = value;
    if (value) {
      isAddedEnabled = false;
      isViewDetailsEnabled = false;
      isEditEnabled = false;
      _selectedAgent = null;
    }
    notifyListeners();
  }

  Map<String, String>? _selectedAgent;

  Map<String, String>? get selectedEntries => _selectedAgent;

  void setSelectedEntries(Map<String, String> agent) {
    _selectedAgent = agent;
    notifyListeners();
  }

  void resetSelectedEntries() {
    _selectedAgent = null;
    notifyListeners();
  }

  void setViewEntriesDetailsEnabled(bool value) {
    isViewDetailsEnabled = value;
    if (value) {
      isAddedEnabled = false;
      isEditEnabled = false;
    }
    notifyListeners();
  }

  void setEditEntriesEnabled(bool value) {
    isEditEnabled = value;
    if (value) {
      isAddedEnabled = false;
      isViewDetailsEnabled = false;
    }
    notifyListeners();
  }

  void setAddedEntriesEnabled(bool value) {
    isAddedEnabled = value;
    if (value) {
      isViewDetailsEnabled = false;
      isEditEnabled = false;
      _selectedAgent = null;
    }
    notifyListeners();
  }

  void resetAllEntries() {
    isAddedEnabled = false;
    isViewDetailsEnabled = false;
    isEditEnabled = false;
    _selectedAgent = null;
    isDeliveredAgentsAdded = false;
    notifyListeners();
  }
}
