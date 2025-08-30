import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier{
  bool isAddedEnabled = false;
  bool isAddDeliveryAgent = false;
  bool isViewDetailsEnabled = false;
  bool isEditEnabled = false;

  Map<String, String>? _selectedCustomer;

  Map<String, String>? get selectedCustomer => _selectedCustomer;

  void setSelectedCustomer (Map<String,String> Customer){
    _selectedCustomer = Customer;
        notifyListeners();
  }
  void resetSelectedCustomer() {
    _selectedCustomer = null;
    notifyListeners();
  }
  void  setViewDetailsEnable(bool value){
    isViewDetailsEnabled = value;
    if (value){
      isAddedEnabled=false;
      isEditEnabled=false;
      isAddDeliveryAgent=false;

    }
    notifyListeners();

  }
  void setAddCustomerEnable(bool value){
    isAddedEnabled = value;
    if(value){
      isEditEnabled = false;
      isViewDetailsEnabled =false;
      _selectedCustomer = null;
      isAddDeliveryAgent=false;


    }
    notifyListeners();
  }
  void setDeliveryAgentEnable(bool value){
    isAddDeliveryAgent = value;
    if (value){
      isEditEnabled = false;
      isViewDetailsEnabled =false;
      isAddedEnabled = false;

    }
    notifyListeners();
  }


}
