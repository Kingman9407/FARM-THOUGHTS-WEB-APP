import 'package:flutter/material.dart';

class DeliveryAgentsProvider with ChangeNotifier {
  bool _isAddedEnabled = false;
  bool _isEditEnabled = false;
  bool _isDeleteEnabled = false;
  bool _isViewDetailsEnabled = false;

  // Getters
  bool get isAddedEnabled => _isAddedEnabled;
  bool get isEditEnabled => _isEditEnabled;
  bool get isDeleteEnabled => _isDeleteEnabled;
  bool get isViewDetailsEnabled => _isViewDetailsEnabled;

  // Toggles
  void toggleAddedEnabled() {
    _isAddedEnabled = !_isAddedEnabled;
    notifyListeners();
  }

  void toggleEditEnabled() {
    _isEditEnabled = !_isEditEnabled;
    notifyListeners();
  }

  void toggleDeleteEnabled() {
    _isDeleteEnabled = !_isDeleteEnabled;
    notifyListeners();
  }

  void toggleViewDetailsEnabled() {
    _isViewDetailsEnabled = !_isViewDetailsEnabled;
    notifyListeners();
  }

  // Setters
  void setAddedEnabled(bool value) {
    _isAddedEnabled = value;
    notifyListeners();
  }

  void setEditEnabled(bool value) {
    _isEditEnabled = value;
    notifyListeners();
  }

  void setDeleteEnabled(bool value) {
    _isDeleteEnabled = value;
    notifyListeners();
  }

  void setViewDetailsEnabled(bool value) {
    _isViewDetailsEnabled = value;
    notifyListeners();
  }

  // Reset everything at once
  void resetAll() {
    _isAddedEnabled = false;
    _isEditEnabled = false;
    _isDeleteEnabled = false;
    _isViewDetailsEnabled = false;
    notifyListeners();
  }
}
