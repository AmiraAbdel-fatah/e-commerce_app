import 'package:e_commerce/data/models/ProductsResponseDm.dart';
import 'package:e_commerce/domain/entities/GetCartResponseEntity.dart';

/// status : "success"
/// numOfCartItems : 8
/// cartId : "67b47b40851e223def98613c"
/// data : {"_id":"67b47b40851e223def98613c","cartOwner":"674afbf7803e888e0563d778","products":[{"count":1,"_id":"67b47b40851e223def98613d","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","quantity":225,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ebc6dc1175abc65ca0b9"},"price":191},{"count":29,"_id":"67b48596851e223def9903de","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"},"price":149},{"count":8,"_id":"67b49124851e223def99f6e7","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428e997dc1175abc65ca0a1"},"price":149},{"count":1,"_id":"67b49358851e223def9a2e59","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"},"price":149},{"count":1,"_id":"67b49576851e223def9a6fd0","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e7ecdc1175abc65ca090","title":"Woman Bordeaux Long Sleeve Blouse BORDEAUX","quantity":228,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402411833-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.2,"id":"6428e7ecdc1175abc65ca090"},"price":499},{"count":1,"_id":"67b4962d851e223def9a8aa7","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428c6a9dc1175abc65ca01f","title":"Hoops 3.0 Low Classic Vintage Shoes","quantity":70,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680393896493-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":4.5,"id":"6428c6a9dc1175abc65ca01f"},"price":1629},{"count":1,"_id":"67b4976a851e223def9ab181","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428c5b7dc1175abc65ca019","title":"Galaxy 6 Running Shoes","quantity":60,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680393655068-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":5,"id":"6428c5b7dc1175abc65ca019"},"price":1629},{"count":1,"_id":"67b497bc851e223def9abc47","product":{"subcategory":[{"_id":"6407f3a8b575d3b90bf957e2","name":"Laptops & Accessories","slug":"laptops-and-accessories","category":"6439d2d167d9aa4ca970649f"}],"_id":"6408de536406cd15828e8f10","title":"WH-CH510 Wireless On-Ear Bluetooth Headphones Black","quantity":600,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1678302803089-cover.jpeg","category":{"_id":"6439d2d167d9aa4ca970649f","name":"Electronics","slug":"electronics","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511121316.png"},"brand":{"_id":"64089f5824b25627a25315c7","name":"SONY","slug":"sony","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286680638.png"},"ratingsAverage":4.3,"id":"6408de536406cd15828e8f10"},"price":1949}],"createdAt":"2025-02-18T12:21:20.070Z","updatedAt":"2025-02-19T05:49:54.935Z","__v":7,"totalCartPrice":11559}

class GetCartResponseDm extends GetCartResponseEntity {
  GetCartResponseDm({
    this.statusMsg,
    this.message,
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataCartDm.fromJson(json['data']) : null;
  }

  String? message;
  String? statusMsg;
}

/// _id : "67b47b40851e223def98613c"
/// cartOwner : "674afbf7803e888e0563d778"
/// products : [{"count":1,"_id":"67b47b40851e223def98613d","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","quantity":225,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ebc6dc1175abc65ca0b9"},"price":191},{"count":29,"_id":"67b48596851e223def9903de","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"},"price":149},{"count":8,"_id":"67b49124851e223def99f6e7","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428e997dc1175abc65ca0a1"},"price":149},{"count":1,"_id":"67b49358851e223def9a2e59","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"},"price":149},{"count":1,"_id":"67b49576851e223def9a6fd0","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e7ecdc1175abc65ca090","title":"Woman Bordeaux Long Sleeve Blouse BORDEAUX","quantity":228,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402411833-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.2,"id":"6428e7ecdc1175abc65ca090"},"price":499},{"count":1,"_id":"67b4962d851e223def9a8aa7","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428c6a9dc1175abc65ca01f","title":"Hoops 3.0 Low Classic Vintage Shoes","quantity":70,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680393896493-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":4.5,"id":"6428c6a9dc1175abc65ca01f"},"price":1629},{"count":1,"_id":"67b4976a851e223def9ab181","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428c5b7dc1175abc65ca019","title":"Galaxy 6 Running Shoes","quantity":60,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680393655068-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":{"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"},"ratingsAverage":5,"id":"6428c5b7dc1175abc65ca019"},"price":1629},{"count":1,"_id":"67b497bc851e223def9abc47","product":{"subcategory":[{"_id":"6407f3a8b575d3b90bf957e2","name":"Laptops & Accessories","slug":"laptops-and-accessories","category":"6439d2d167d9aa4ca970649f"}],"_id":"6408de536406cd15828e8f10","title":"WH-CH510 Wireless On-Ear Bluetooth Headphones Black","quantity":600,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1678302803089-cover.jpeg","category":{"_id":"6439d2d167d9aa4ca970649f","name":"Electronics","slug":"electronics","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511121316.png"},"brand":{"_id":"64089f5824b25627a25315c7","name":"SONY","slug":"sony","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678286680638.png"},"ratingsAverage":4.3,"id":"6408de536406cd15828e8f10"},"price":1949}]
/// createdAt : "2025-02-18T12:21:20.070Z"
/// updatedAt : "2025-02-19T05:49:54.935Z"
/// __v : 7
/// totalCartPrice : 11559

class GetDataCartDm extends GetDataEntity {
  GetDataCartDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataCartDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductsDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

/// count : 1
/// _id : "67b47b40851e223def98613d"
/// product : {"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","quantity":225,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ebc6dc1175abc65ca0b9"}
/// price : 191

class GetProductsDm extends GetProductsEntity {
  GetProductsDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProductsDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDm.fromJson(json['product']) : null;
    price = json['price'];
  }
}
