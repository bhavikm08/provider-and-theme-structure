class LoginModel {
  String? token;
  String? redeemNonce;
  String? orderDetailsNonce;
  Profile? profile;
  Business? business;
  Wholesaler? wholesaler;
  List<String>? wishlist;

  LoginModel(
      {this.token,
        this.redeemNonce,
        this.orderDetailsNonce,
        this.profile,
        this.business,
        this.wholesaler,
        this.wishlist});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    redeemNonce = json['redeem_nonce'];
    orderDetailsNonce = json['order_details_nonce'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
    wholesaler = json['wholesaler'] != null
        ? new Wholesaler.fromJson(json['wholesaler'])
        : null;
    wishlist = json['wishlist'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['redeem_nonce'] = this.redeemNonce;
    data['order_details_nonce'] = this.orderDetailsNonce;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    if (this.wholesaler != null) {
      data['wholesaler'] = this.wholesaler!.toJson();
    }
    data['wishlist'] = this.wishlist;
    return data;
  }
}

class Profile {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? instaHandle;
  String? tshirtSize;
  String? nicename;
  String? displayName;

  Profile(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.instaHandle,
        this.tshirtSize,
        this.nicename,
        this.displayName});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    instaHandle = json['insta_handle'];
    tshirtSize = json['tshirt_size'];
    nicename = json['nicename'];
    displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['insta_handle'] = this.instaHandle;
    data['tshirt_size'] = this.tshirtSize;
    data['nicename'] = this.nicename;
    data['display_name'] = this.displayName;
    return data;
  }
}

class Business {
  String? businessName;
  String? businessAbn;
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;
  String? wholesalerGroup;
  String? wholesaleBranch;

  Business(
      {this.businessName,
        this.businessAbn,
        this.billingAddress,
        this.shippingAddress,
        this.wholesalerGroup,
        this.wholesaleBranch});

  Business.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    businessAbn = json['business_abn'];
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
    wholesalerGroup = json['wholesaler_group'];
    wholesaleBranch = json['wholesale_branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['business_abn'] = this.businessAbn;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    data['wholesaler_group'] = this.wholesalerGroup;
    data['wholesale_branch'] = this.wholesaleBranch;
    return data;
  }
}

class BillingAddress {
  String? billingFullAddress;
  String? billingAddress1;
  String? billingAddress2;
  String? billingCity;
  String? billingState;
  String? billingPostcode;
  String? billingCountry;

  BillingAddress(
      {this.billingFullAddress,
        this.billingAddress1,
        this.billingAddress2,
        this.billingCity,
        this.billingState,
        this.billingPostcode,
        this.billingCountry});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    billingFullAddress = json['billing_full_address'];
    billingAddress1 = json['billing_address_1'];
    billingAddress2 = json['billing_address_2'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingPostcode = json['billing_postcode'];
    billingCountry = json['billing_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billing_full_address'] = this.billingFullAddress;
    data['billing_address_1'] = this.billingAddress1;
    data['billing_address_2'] = this.billingAddress2;
    data['billing_city'] = this.billingCity;
    data['billing_state'] = this.billingState;
    data['billing_postcode'] = this.billingPostcode;
    data['billing_country'] = this.billingCountry;
    return data;
  }
}

class ShippingAddress {
  String? shippingFullAddress;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingCity;
  String? shippingState;
  String? shippingPostcode;
  String? shippingCountry;

  ShippingAddress(
      {this.shippingFullAddress,
        this.shippingAddress1,
        this.shippingAddress2,
        this.shippingCity,
        this.shippingState,
        this.shippingPostcode,
        this.shippingCountry});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    shippingFullAddress = json['shipping_full_address'];
    shippingAddress1 = json['shipping_address_1'];
    shippingAddress2 = json['shipping_address_2'];
    shippingCity = json['shipping_city'];
    shippingState = json['shipping_state'];
    shippingPostcode = json['shipping_postcode'];
    shippingCountry = json['shipping_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shipping_full_address'] = this.shippingFullAddress;
    data['shipping_address_1'] = this.shippingAddress1;
    data['shipping_address_2'] = this.shippingAddress2;
    data['shipping_city'] = this.shippingCity;
    data['shipping_state'] = this.shippingState;
    data['shipping_postcode'] = this.shippingPostcode;
    data['shipping_country'] = this.shippingCountry;
    return data;
  }
}

class Wholesaler {
  String? group;
  String? branch;

  Wholesaler({this.group, this.branch});

  Wholesaler.fromJson(Map<String, dynamic> json) {
    group = json['group'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group'] = this.group;
    data['branch'] = this.branch;
    return data;
  }
}