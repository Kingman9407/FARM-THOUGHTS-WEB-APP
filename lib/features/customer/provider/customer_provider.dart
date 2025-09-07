import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier {
  bool isAddedEnabled = false;
  bool isAddDeliveryAgent = false;
  bool isViewDetailsEnabled = false;
  bool isEditEnabled = false;
  bool isQrEnable = false;

  final Map<String, bool> _fileUploadedStatus = {};
  final Map<String, String?> _fileNames = {};


  Map<String, String>? _selectedCustomer;

  Map<String, String>? get selectedCustomer => _selectedCustomer;



  void setSelectedCustomer(Map<String, String> Customer) {
    _selectedCustomer = Customer;
    notifyListeners();
  }

  void resetSelectedCustomer() {
    _selectedCustomer = null;
    notifyListeners();
  }

  void setViewDetailsEnable(bool value) {
    isViewDetailsEnabled = value;
    if (value) {
      isAddedEnabled = false;
      isEditEnabled = false;
      isAddDeliveryAgent = false;
      isQrEnable = false;
    }
    notifyListeners();
  }

  void setAddCustomerEnable(bool value) {
    isAddedEnabled = value;
    if (value) {
      isEditEnabled = false;
      isViewDetailsEnabled = false;
      _selectedCustomer = null;
      isAddDeliveryAgent = false;
      isQrEnable = false;

    }
    notifyListeners();
  }

  void setDeliveryAgentEnable(bool value) {
    isAddDeliveryAgent = value;
    if (value) {
      isEditEnabled = false;
      isViewDetailsEnabled = false;
      isAddedEnabled = false;
      isQrEnable = false;
    }
    notifyListeners();
  }

  void setQrEnable(bool value) {
    isQrEnable = value;
    if (value) {
      isEditEnabled = false;
      isViewDetailsEnabled = false;
      isAddedEnabled = false;
      isAddDeliveryAgent = false;
    }
    notifyListeners();
  }

  void setEditEnable(bool value) {
    isEditEnabled = value;
    if (value) {
      isAddedEnabled = false;
      isViewDetailsEnabled = false;
      isAddedEnabled = false;
      isQrEnable = false;
    }
    notifyListeners();
  }



  void ResetAll() {
    isEditEnabled = false;
    isViewDetailsEnabled = false;
    isAddedEnabled = false;
    isAddDeliveryAgent = false;
    isQrEnable = false;

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
  void resetFileStatus(String key) {
    _fileUploadedStatus[key] = false;
    _fileNames[key] = null;
    notifyListeners();
  }


}

