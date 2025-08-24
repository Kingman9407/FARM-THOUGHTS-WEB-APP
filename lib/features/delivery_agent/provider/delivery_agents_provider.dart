import 'package:flutter/material.dart';

class DeliveryAgentsProvider extends ChangeNotifier {
  bool isAddedEnabled = false;
  bool isViewDetailsEnabled = false;
  bool isEditEnabled = false;

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
    isViewDetailsEnabled = value;
    if (value) {
      isAddedEnabled = false;
      isEditEnabled = false;
    }
    notifyListeners();
  }

  void setEditEnabled(bool value) {
    isEditEnabled = value;
    if (value) {
      isAddedEnabled = false;
      isViewDetailsEnabled = false;
    }
    notifyListeners();
  }

  void setAddedEnabled(bool value) {
    isAddedEnabled = value;
    if (value) {
      isViewDetailsEnabled = false;
      isEditEnabled = false;
      _selectedAgent = null;
    }
    notifyListeners();
  }

  void resetAll() {
    isAddedEnabled = false;
    isViewDetailsEnabled = false;
    isEditEnabled = false;
    _selectedAgent = null;
    notifyListeners();
  }
}
