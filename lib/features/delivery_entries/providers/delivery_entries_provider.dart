import 'package:flutter/material.dart';

class DeliveryEntriesProvider extends ChangeNotifier {
  bool isAddedEnabled = false;
  bool isViewDetailsEnabled = false;
  bool isEditEnabled = false;
  bool isDeliveryAgentEntriesAdded = false;
  bool isDeliveryOtherDetailsEntriesAdded = false;

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

  void setDeliveryAgentEntriesAdded(bool value) {
    isDeliveryAgentEntriesAdded = value;
    if (value) {
      // turn off others
      isAddedEnabled = false;
      isViewDetailsEnabled = false;
      isEditEnabled = false;
    }
    notifyListeners();
  }

  void setDeliveryOtherDetailsEntriesAdded(bool value) {
    isDeliveryOtherDetailsEntriesAdded = value;
    if (value) {
      // turn off others
      isAddedEnabled = false;
      isViewDetailsEnabled = false;
      isEditEnabled = false;
      isDeliveryAgentEntriesAdded = false;
    }
    notifyListeners();
  }


  void resetAllEntries() {
    isAddedEnabled = false;
    isViewDetailsEnabled = false;
    isEditEnabled = false;
    isDeliveryAgentEntriesAdded = false;
    isDeliveryOtherDetailsEntriesAdded = false;
    _selectedAgent = null;
    notifyListeners();
  }
}
