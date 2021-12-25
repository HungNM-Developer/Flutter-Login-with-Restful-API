class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.lastLogin,
    required this.accountType,
    required this.memberLevelId,
    this.lastUpgradeLevel,
    this.vendorId,
    this.taxCodeId,
    this.areaId,
    required this.avatar,
    required this.gender,
    required this.address,
    required this.idNumber,
    required this.status,
    this.referralCode,
    required this.wallet,
    required this.coinWallet,
    required this.createdAt,
    required this.updatedAt,
    this.socialId,
    this.age,
    this.birthOfDate,
    this.agencyId,
    this.pinCodeExpire,
    required this.availableLoanProductDiscounts,
    required this.isWorking,
    required this.financeLocked,
    this.firstSpend,
    this.activatedReferralCode,
    required this.dailyCallMaxTime,
    this.dailyCallMaxAmount,
    required this.isAutoCall,
    required this.simType,
    required this.uncenPhoneNumber,
    required this.accountTypes,
    required this.memberLevel,
    required this.genderText,
    required this.statusText,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String phoneNumber;
  late final LastLogin lastLogin;
  late final int accountType;
  late final int memberLevelId;
  late final Null lastUpgradeLevel;
  late final Null vendorId;
  late final Null taxCodeId;
  late final Null areaId;
  late final String avatar;
  late final int gender;
  late final String address;
  late final String idNumber;
  late final int status;
  late final Null referralCode;
  late final String wallet;
  late final int coinWallet;
  late final String createdAt;
  late final String updatedAt;
  late final Null socialId;
  late final Null age;
  late final Null birthOfDate;
  late final Null agencyId;
  late final Null pinCodeExpire;
  late final int availableLoanProductDiscounts;
  late final int isWorking;
  late final int financeLocked;
  late final Null firstSpend;
  late final Null activatedReferralCode;
  late final int dailyCallMaxTime;
  late final Null dailyCallMaxAmount;
  late final int isAutoCall;
  late final int simType;
  late final String uncenPhoneNumber;
  late final AccountTypes accountTypes;
  late final MemberLevel memberLevel;
  late final String genderText;
  late final String statusText;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    lastLogin = LastLogin.fromJson(json['last_login']);
    accountType = json['account_type'];
    memberLevelId = json['member_level_id'];
    lastUpgradeLevel = null;
    vendorId = null;
    taxCodeId = null;
    areaId = null;
    avatar = json['avatar'];
    gender = json['gender'];
    address = json['address'];
    idNumber = json['id_number'];
    status = json['status'];
    referralCode = null;
    wallet = json['wallet'];
    coinWallet = json['coin_wallet'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    socialId = null;
    age = null;
    birthOfDate = null;
    agencyId = null;
    pinCodeExpire = null;
    availableLoanProductDiscounts = json['available_loan_product_discounts'];
    isWorking = json['is_working'];
    financeLocked = json['finance_locked'];
    firstSpend = null;
    activatedReferralCode = null;
    dailyCallMaxTime = json['daily_call_max_time'];
    dailyCallMaxAmount = null;
    isAutoCall = json['is_auto_call'];
    simType = json['sim_type'];
    uncenPhoneNumber = json['uncen_phone_number'];
    accountTypes = AccountTypes.fromJson(json['account_types']);
    memberLevel = MemberLevel.fromJson(json['member_level']);
    genderText = json['gender_text'];
    statusText = json['status_text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone_number'] = phoneNumber;
    _data['last_login'] = lastLogin.toJson();
    _data['account_type'] = accountType;
    _data['member_level_id'] = memberLevelId;
    _data['last_upgrade_level'] = lastUpgradeLevel;
    _data['vendor_id'] = vendorId;
    _data['tax_code_id'] = taxCodeId;
    _data['area_id'] = areaId;
    _data['avatar'] = avatar;
    _data['gender'] = gender;
    _data['address'] = address;
    _data['id_number'] = idNumber;
    _data['status'] = status;
    _data['referral_code'] = referralCode;
    _data['wallet'] = wallet;
    _data['coin_wallet'] = coinWallet;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['social_id'] = socialId;
    _data['age'] = age;
    _data['birth_of_date'] = birthOfDate;
    _data['agency_id'] = agencyId;
    _data['pin_code_expire'] = pinCodeExpire;
    _data['available_loan_product_discounts'] = availableLoanProductDiscounts;
    _data['is_working'] = isWorking;
    _data['finance_locked'] = financeLocked;
    _data['first_spend'] = firstSpend;
    _data['activated_referral_code'] = activatedReferralCode;
    _data['daily_call_max_time'] = dailyCallMaxTime;
    _data['daily_call_max_amount'] = dailyCallMaxAmount;
    _data['is_auto_call'] = isAutoCall;
    _data['sim_type'] = simType;
    _data['uncen_phone_number'] = uncenPhoneNumber;
    _data['account_types'] = accountTypes.toJson();
    _data['member_level'] = memberLevel.toJson();
    _data['gender_text'] = genderText;
    _data['status_text'] = statusText;
    return _data;
  }
}

class LastLogin {
  LastLogin({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });
  late final String date;
  late final int timezoneType;
  late final String timezone;

  LastLogin.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['timezone_type'] = timezoneType;
    _data['timezone'] = timezone;
    return _data;
  }
}

class AccountTypes {
  AccountTypes({
    required this.id,
  });
  late final String id;

  AccountTypes.fromJson(Map<String, dynamic> json) {
    id = json['1'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['1'] = 1;
    return _data;
  }
}

class MemberLevel {
  MemberLevel({
    required this.id,
    required this.name,
    required this.code,
    required this.level,
    required this.minCourses,
    required this.minReferrals,
    required this.minProducts,
    required this.minRevenue,
    required this.minProfit,
    required this.profitRatio_1,
    required this.profitRatio_2,
    required this.profitRatio_3,
    required this.profitRatio_4,
    required this.createdAt,
    required this.updatedAt,
    required this.minAmountSpent,
  });
  late final int id;
  late final String name;
  late final String code;
  late final int level;
  late final int minCourses;
  late final int minReferrals;
  late final int minProducts;
  late final String minRevenue;
  late final String minProfit;
  late final int profitRatio_1;
  late final int profitRatio_2;
  late final int profitRatio_3;
  late final int profitRatio_4;
  late final String createdAt;
  late final String updatedAt;
  late final int minAmountSpent;

  MemberLevel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    level = json['level'];
    minCourses = json['min_courses'];
    minReferrals = json['min_referrals'];
    minProducts = json['min_products'];
    minRevenue = json['min_revenue'];
    minProfit = json['min_profit'];
    profitRatio_1 = json['profit_ratio_1'];
    profitRatio_2 = json['profit_ratio_2'];
    profitRatio_3 = json['profit_ratio_3'];
    profitRatio_4 = json['profit_ratio_4'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    minAmountSpent = json['min_amount_spent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['code'] = code;
    _data['level'] = level;
    _data['min_courses'] = minCourses;
    _data['min_referrals'] = minReferrals;
    _data['min_products'] = minProducts;
    _data['min_revenue'] = minRevenue;
    _data['min_profit'] = minProfit;
    _data['profit_ratio_1'] = profitRatio_1;
    _data['profit_ratio_2'] = profitRatio_2;
    _data['profit_ratio_3'] = profitRatio_3;
    _data['profit_ratio_4'] = profitRatio_4;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['min_amount_spent'] = minAmountSpent;
    return _data;
  }
}
