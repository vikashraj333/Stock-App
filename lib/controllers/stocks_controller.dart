import 'package:get/get.dart';
import 'package:stock_dashboard/services/stocks_model.dart';
import 'package:stock_dashboard/services/stocks_service.dart';

class StockController extends GetxController {
  var stocks = <Stock>[].obs;
  var isLoading = true.obs;
  var price = ''.obs;
  // State for managing the carousel index for image scrolling
  var carouselIndex = 0.obs;
   // Observable variable to hold the user's photo URL
  var photoUrl = ''.obs;  
  // You can also add other user info like name 
  var displayName = ''.obs;
  var email = ''.obs;
  
  @override
  void onInit() {
    fetchStocks();
    super.onInit();
  }

  // Function to update carousel index
  void updateCarouselIndex(int index) {
    carouselIndex.value = index;
  }
 // Update user info
  void updateUserInfo(String newPhotoUrl, String newName, String newEmail) {
    photoUrl.value = newPhotoUrl;
    displayName.value = newName;
    email.value = newEmail;
  }

// fetch stocks through api
  void fetchStocks() async {
    try {
      isLoading(true);
      var stockList = await StockService().fetchStocks();
      stocks.assignAll(stockList);
    } finally {
      isLoading(false);
    }
  }
// get price for payment
  void setPrice(String newPrice) {
    price.value = newPrice;
  }
}
