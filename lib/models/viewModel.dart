import 'package:flutter/material.dart';

class CheckLoginResult {
  String code;
  String message;
  CheckLoginData data;

  CheckLoginResult({this.code, this.message, this.data});

  CheckLoginResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? new CheckLoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class CheckLoginData {
  String memid;
  String name;
  String inputtime;

  CheckLoginData({this.memid, this.name, this.inputtime});

  CheckLoginData.fromJson(Map<String, dynamic> json) {
    memid = json['memid'];
    name = json['name'];
    inputtime = json['inputtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memid'] = this.memid;
    data['name'] = this.name;
    data['inputtime'] = this.inputtime;
    return data;
  }
}

class NewsListModel {
  String code;
  String message;
  NewsListData data;

  NewsListModel({this.code, this.message, this.data});

  NewsListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? new NewsListData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class NewsListData {
  List<NewslistItem> newslist;

  NewsListData({this.newslist});

  NewsListData.fromJson(Map<String, dynamic> json) {
    if (json['newslist'] != null) {
      newslist = new List<NewslistItem>();
      json['newslist'].forEach((v) {
        newslist.add(new NewslistItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newslist != null) {
      data['newslist'] = this.newslist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewslistItem {
  String title;
  String imgsrc;
  String text;
  String subtitle;
  String date;
  String editor;
  String count;
  String url;

  NewslistItem(
      {this.title,
      this.imgsrc,
      this.text,
      this.subtitle,
      this.date,
      this.editor,
      this.count,
      this.url});

  NewslistItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imgsrc = json['imgsrc'];
    text = json['text'];
    subtitle = json['subtitle'];
    date = json['date'];
    editor = json['editor'];
    count = json['count'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['imgsrc'] = this.imgsrc;
    data['text'] = this.text;
    data['subtitle'] = this.subtitle;
    data['date'] = this.date;
    data['editor'] = this.editor;
    data['count'] = this.count;
    data['url'] = this.url;
    return data;
  }
}

class PriceListResult {
  String code;
  String message;
  PriceListData data;

  PriceListResult({this.code, this.message, this.data});

  PriceListResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? new PriceListData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class PriceListData {
  List<CurrencylistItem> currencylist;

  PriceListData({this.currencylist});

  PriceListData.fromJson(Map<String, dynamic> json) {
    if (json['currencylist'] != null) {
      currencylist = new List<CurrencylistItem>();
      json['currencylist'].forEach((v) {
        currencylist.add(new CurrencylistItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currencylist != null) {
      data['currencylist'] = this.currencylist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrencylistItem {
  String name;
  String dollor;
  String rmb;
  String rate;
  String vol24;
  String memo;

  CurrencylistItem(
      {this.name, this.dollor, this.rmb, this.rate, this.vol24, this.memo});

  CurrencylistItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dollor = json['dollor'];
    rmb = json['rmb'];
    rate = json['rate'];
    vol24 = json['vol24'];
    memo = json['memo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dollor'] = this.dollor;
    data['rmb'] = this.rmb;
    data['rate'] = this.rate;
    data['vol24'] = this.vol24;
    data['memo'] = this.memo;
    return data;
  }
}

class ProfitSumResult {
  String code;
  String message;
  ProfitSumData data;

  ProfitSumResult({this.code, this.message, this.data});

  ProfitSumResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    print("X3333331");
    data =
        json['data'] != null ? new ProfitSumData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class ProfitSumData {
  String amount = "0.0";
  String summember = "0";

  ProfitSumData({this.amount});

  ProfitSumData.fromJson(Map<String, dynamic> json) {
    try {
      print("A122${json['amount']}");
      amount = ((json['amount'])).toString();
      print("A222");
      summember = ((json['summember']).toString());
      print("a3333");
    } catch (ex) {
      print("ERROR  ProfitSumData.fromJson$ex");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['summember'] = this.summember;
    return data;
  }
}

class LowerMemberResult {
  String code;
  String message;
  LowerMemberData data;

  LowerMemberResult({this.code, this.message, this.data});

  LowerMemberResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? new LowerMemberData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class LowerMemberData {
  List<LowerMemberItem> memberlist;

  LowerMemberData({this.memberlist});

  LowerMemberData.fromJson(Map<String, dynamic> json) {
    if (json['memberlist'] != null) {
      memberlist = new List<LowerMemberItem>();
      json['memberlist'].forEach((v) {
        memberlist.add(new LowerMemberItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.memberlist != null) {
      data['memberlist'] = this.memberlist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LowerMemberItem {
  String memid;
  String memcount;
  String busisum;

  LowerMemberItem({this.memid, this.memcount, this.busisum});

  LowerMemberItem.fromJson(Map<String, dynamic> json) {
    memid = json['memid'];
    memcount = json['memcount'].toString();
    busisum = json['busisum'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memid'] = this.memid;
    data['memcount'] = this.memcount;
    data['busisum'] = this.busisum;
    return data;
  }
}

class BookcostResult {
  String code;
  String message;
  BookcostData data;

  BookcostResult({this.code, this.message, this.data});

  BookcostResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? new BookcostData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class BookcostData {
  List<LoglistItem> loglist;

  BookcostData({this.loglist});

  BookcostData.fromJson(Map<String, dynamic> json) {
    if (json['loglist'] != null) {
      loglist = new List<LoglistItem>();
      json['loglist'].forEach((v) {
        loglist.add(new LoglistItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loglist != null) {
      data['loglist'] = this.loglist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoglistItem {
  String ptype;
  String typename;
  double profit;
  String moditime;
  String memo;

  LoglistItem(
      {this.ptype, this.typename, this.profit, this.moditime, this.memo});

  LoglistItem.fromJson(Map<String, dynamic> json) {
    ptype = json['ptype'];
    try {
      profit = double.tryParse(json['profit'].toString());
    } catch (ex) {}
    moditime = json['moditime'];
    memo = json['memo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ptype'] = this.ptype;
    data['profit'] = this.profit.toString();
    data['moditime'] = this.moditime;
    data['memo'] = this.memo;
    return data;
  }
}

class CommonCommitResult {
  String code;
  String message;
  CommonCommitData data;

  CommonCommitResult({this.code, this.message, this.data});

  CommonCommitResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? new CommonCommitData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class CommonCommitData {
  String resultmsg;

  CommonCommitData({this.resultmsg});

  CommonCommitData.fromJson(Map<String, dynamic> json) {
    resultmsg = json['resultmsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultmsg'] = this.resultmsg;
    return data;
  }
}

class MemberAddrResult {
  String code;
  String message;
  MemberAddrData data;

  MemberAddrResult({this.code, this.message, this.data});

  MemberAddrResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data =
        json['data'] != null ? new MemberAddrData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class MemberAddrData {
  String address;

  MemberAddrData({this.address});

  MemberAddrData.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    return data;
  }
}



class MemberWithdrawInfo {
  String code;
  String message;
  MemberWithdrawInfoData data;

  MemberWithdrawInfo({this.code, this.message, this.data});

  MemberWithdrawInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new MemberWithdrawInfoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class MemberWithdrawInfoData {
  Null infotip;
  List<MemberWithdrawInfoDataItem> mlist;

  MemberWithdrawInfoData({this.infotip, this.mlist});

  MemberWithdrawInfoData.fromJson(Map<String, dynamic> json) {
    infotip = json['infotip'];
    if (json['mlist'] != null) {
      mlist = new List<MemberWithdrawInfoDataItem>();
      json['mlist'].forEach((v) {
        mlist.add(new MemberWithdrawInfoDataItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['infotip'] = this.infotip;
    if (this.mlist != null) {
      data['mlist'] = this.mlist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberWithdrawInfoDataItem {
  String mobile;
  String name;
  String bcd;
  String amount;
  String status;
  String inputtime;

  MemberWithdrawInfoDataItem(
      {this.mobile,
      this.name,
      this.bcd,
      this.amount,
      this.status,
      this.inputtime});

  MemberWithdrawInfoDataItem.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    name = json['name'];
    bcd = json['bcd'];
    amount = json['amount'];
    status = json['status'];
    inputtime = json['inputtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['bcd'] = this.bcd;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['inputtime'] = this.inputtime;
    return data;
  }
}





class WalletBalanceResult {
  String code;
  String message;
  WalletBalanceData data;

  WalletBalanceResult({this.code, this.message, this.data});

  WalletBalanceResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? new WalletBalanceData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class WalletBalanceData {
  String memwallet;
  String bitwallet;
  String bitrmb;

  WalletBalanceData({this.memwallet, this.bitwallet, this.bitrmb});

  WalletBalanceData.fromJson(Map<String, dynamic> json) {
    memwallet = json['memwallet'];
    bitwallet = json['bitwallet'];
    bitrmb = json['bitrmb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memwallet'] = this.memwallet;
    data['bitwallet'] = this.bitwallet;
    data['bitrmb'] = this.bitrmb;
    return data;
  }
}

class MemCodeResult {
  String code;
  String message;
  MemCodeData data;

  MemCodeResult({this.code, this.message, this.data});

  MemCodeResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new MemCodeData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class MemCodeData {
  String memcode;

  MemCodeData({this.memcode});

  MemCodeData.fromJson(Map<String, dynamic> json) {
    memcode = json['memcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memcode'] = this.memcode;
    return data;
  }
}

class MemMachinesResult {
  String code;
  String message;
  MemMachinesData data;

  MemMachinesResult({this.code, this.message, this.data});

  MemMachinesResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? new MemMachinesData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class MemMachinesData {
  String mstate;
  List<MlistItem> mlist;

  MemMachinesData({this.mstate, this.mlist});

  MemMachinesData.fromJson(Map<String, dynamic> json) {
    mstate = json['mstate'];
    if (json['mlist'] != null) {
      mlist = new List<MlistItem>();
      json['mlist'].forEach((v) {
        mlist.add(new MlistItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mstate'] = this.mstate;
    if (this.mlist != null) {
      data['mlist'] = this.mlist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MlistItem {
  String name;
  String computcalcNow;
  String computcalc24;
  String subtime;

  MlistItem({this.name, this.computcalcNow, this.computcalc24, this.subtime});

  MlistItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    computcalcNow = json['computcalc_now'];
    computcalc24 = json['computcalc_24'];
    subtime = json['subtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['computcalc_now'] = this.computcalcNow;
    data['computcalc_24'] = this.computcalc24;
    data['subtime'] = this.subtime;
    return data;
  }
}
