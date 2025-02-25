import 'package:e_commerce/domain/entities/AddToCartResponseEntity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 8
/// cartId : "67b47b40851e223def98613c"
/// data : {"_id":"67b47b40851e223def98613c","cartOwner":"674afbf7803e888e0563d778","products":[{"count":5,"_id":"67b47b40851e223def98613d","product":"6428ebc6dc1175abc65ca0b9","price":191},{"count":21,"_id":"67b48596851e223def9903de","product":"6428eb43dc1175abc65ca0b3","price":149},{"count":8,"_id":"67b49124851e223def99f6e7","product":"6428e997dc1175abc65ca0a1","price":149},{"count":1,"_id":"67b49358851e223def9a2e59","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":1,"_id":"67b49576851e223def9a6fd0","product":"6428e7ecdc1175abc65ca090","price":499},{"count":1,"_id":"67b4962d851e223def9a8aa7","product":"6428c6a9dc1175abc65ca01f","price":1629},{"count":1,"_id":"67b4976a851e223def9ab181","product":"6428c5b7dc1175abc65ca019","price":1629},{"count":1,"_id":"67b497bc851e223def9abc47","product":"6408de536406cd15828e8f10","price":1949}],"createdAt":"2025-02-18T12:21:20.070Z","updatedAt":"2025-02-18T18:44:29.455Z","__v":7,"totalCartPrice":11131}

class AddCartResponseDm extends AddToCartResponseEntity {
  AddCartResponseDm({
    this.statusMsg,
    super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  AddCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataCartDm.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

/// _id : "67b47b40851e223def98613c"
/// cartOwner : "674afbf7803e888e0563d778"
/// products : [{"count":5,"_id":"67b47b40851e223def98613d","product":"6428ebc6dc1175abc65ca0b9","price":191},{"count":21,"_id":"67b48596851e223def9903de","product":"6428eb43dc1175abc65ca0b3","price":149},{"count":8,"_id":"67b49124851e223def99f6e7","product":"6428e997dc1175abc65ca0a1","price":149},{"count":1,"_id":"67b49358851e223def9a2e59","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":1,"_id":"67b49576851e223def9a6fd0","product":"6428e7ecdc1175abc65ca090","price":499},{"count":1,"_id":"67b4962d851e223def9a8aa7","product":"6428c6a9dc1175abc65ca01f","price":1629},{"count":1,"_id":"67b4976a851e223def9ab181","product":"6428c5b7dc1175abc65ca019","price":1629},{"count":1,"_id":"67b497bc851e223def9abc47","product":"6408de536406cd15828e8f10","price":1949}]
/// createdAt : "2025-02-18T12:21:20.070Z"
/// updatedAt : "2025-02-18T18:44:29.455Z"
/// __v : 7
/// totalCartPrice : 11131

class DataCartDm extends CartDataEntity {
  DataCartDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DataCartDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

/// count : 5
/// _id : "67b47b40851e223def98613d"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 191

class AddProductsDm extends AddProductsEntity {
  AddProductsDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductsDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
