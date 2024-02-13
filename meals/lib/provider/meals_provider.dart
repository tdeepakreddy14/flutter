import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

final mealsProvider = Provider(

  //ref object allows us to read other providers or to perform some operations when the state of our provider will be destroyed.
  (ref) {  
    return dummyMeals;
  },
);
