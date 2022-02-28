import 'package:get/state_manager.dart';
import 'package:task/Models/products_model.dart';
import 'package:task/WebServices/web_services.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  var productList = <Data>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      isLoading(true);
      Map<String,dynamic> mapResponse = await WebServices.getProducts();
      ProductsModel model = ProductsModel.fromJson(mapResponse);
      productList.value = model.data!;
      isLoading(false);
    } catch(e) {
      isLoading(false);
      return Future.error(e);
    }
  }
}