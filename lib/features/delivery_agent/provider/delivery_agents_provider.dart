import 'package:flutter/material.dart';

class DeliveryAgentsProvider extends ChangeNotifier {
  bool isAddAgentsEnabled = false;
  bool isViewAgentsDetailsEnabled = false;
  bool isEditAgentsEnabled = false;
  bool isEditNextButtonClicked = false;
  final Map<String, bool> _fileUploadedStatus = {};
  final Map<String, String?> _fileNames = {};

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

  void setViewAgentsDetailsEnabled(bool value) {
    isViewAgentsDetailsEnabled = value;
    if (value) {
      isAddAgentsEnabled = false;
      isEditAgentsEnabled = false;
      isEditNextButtonClicked = false;
    }
    notifyListeners();
  }

  void setEditNextButtonClicked(bool value) {
    isEditNextButtonClicked = value;
    if (value) {
      // When going to assign customer, disable other states
      isAddAgentsEnabled = false;
      isViewAgentsDetailsEnabled = false;
      isEditAgentsEnabled = false;
    }
    notifyListeners();
  }

  void setEditAgentsEnabled(bool value) {
    isEditAgentsEnabled = value;
    if (value) {
      isAddAgentsEnabled = false;
      isViewAgentsDetailsEnabled = false;
      isEditNextButtonClicked = false; // Reset this too when editing
    }
    notifyListeners();
  }

  void setAddAgentsEnabled(bool value) {
    isAddAgentsEnabled = value;
    if (value) {
      isViewAgentsDetailsEnabled = false;
      isEditAgentsEnabled = false;
      isEditNextButtonClicked = false; // Reset this too when adding
      _selectedAgent = null;
    }
    notifyListeners();
  }

  void resetAll() {
    isAddAgentsEnabled = false;
    isViewAgentsDetailsEnabled = false;
    isEditAgentsEnabled = false;
    isEditNextButtonClicked = false;
    _selectedAgent = null;
    notifyListeners();
  }

    bool isFileUploaded(String key) {
      return _fileUploadedStatus[key] ?? false;
    }

    void setFileUploaded(String key, bool value) {
      _fileUploadedStatus[key] = value;
      notifyListeners();
    }



    void setFileName(String key,String name) {
      _fileNames[key] = name;
      notifyListeners();
    }
    String? getFileName(String key) {
      return _fileNames[key];
    }
    void removeFile(String key) {
      _fileUploadedStatus[key] = false;
      _fileNames[key] = null;
      notifyListeners();
    }

}
