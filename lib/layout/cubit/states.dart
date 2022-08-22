import 'package:la_vie/models/products/products_model.dart';

abstract class LavieStates {}

class InitialLavieStates extends LavieStates {}

class LavieChangeBottomNavState extends LavieStates {}

class GetProductsDataLoadingState extends LavieStates {}

class GetProductsDataSuccessState extends LavieStates {}

class GetProductsDataErrorState extends LavieStates {}

class GetPlantsDataLoadingState extends LavieStates {}

class GetPlantsDataSuccessState extends LavieStates {}

class GetPlantsDataErrorState extends LavieStates {}

class GetSeedsDataLoadingState extends LavieStates {}

class GetSeedsDataSuccessState extends LavieStates {}

class GetSeedsDataErrorState extends LavieStates {}

class GetToolsDataLoadingState extends LavieStates {}

class GetToolsDataSuccessState extends LavieStates {}

class GetToolsDataErrorState extends LavieStates {}