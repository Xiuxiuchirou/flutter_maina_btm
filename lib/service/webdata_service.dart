import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mai_na/API/service_url.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/models/viewModel.dart';

import 'base_service.dart';

var token = '5de1778e3b9b48cd9d2eb747c7644e67';

Future<CheckLoginData> postLoginCheck(String mobile, String code) async {
  try {
    print('postLoginCheck...mobile$mobile----code$code');
    //获取当前时间
    var formData = {'mobile': mobile, 'code': code};
    var response =
        await postRequest(servicePath['postLoginCheck'], formData: formData);
    print('postLoginCheck....$response');
    CheckLoginResult result = new CheckLoginResult.fromJson(response);
    print('postLoginCheck....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>postLoginCheck' + e.toString());
    throw e;
  }
}

//获取自行车会员信息
Future<NewsListData> getNewsList(String memcd) async {
  try {
    print('getNewsList....');
    //获取当前时间
    var response = await getRequest(servicePath['getNewsList']);
    print('getNewsList....$response');
    NewsListModel result = new NewsListModel.fromJson(response);
    print('getNewsList....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>getNewsList' + e.toString());
    throw e;
  }
}

Future<PriceListData> getPriceList() async {
  try {
    print('getPriceList....');
    //获取当前时间
    var response = await getRequest(servicePath['getPricceList']);
    print('getPriceList....$response');
    PriceListResult result = new PriceListResult.fromJson(response);
    print('getPriceList....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>getPriceList' + e.toString());
    throw e;
  }
}

Future<ProfitSumData> getProfitByType(String actType) async {
  try {
    print('getProfitByType.1...');
    var formData = {'memid': GloabVar.memid, 'acttype': actType};
    var response = await postRequest(servicePath['getProfitSumByType'],
        formData: formData);
    print('getProfitByType...2.$response');
    ProfitSumResult result = new ProfitSumResult.fromJson(response);
    print('getProfitByType.3...$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>getProfitByT3ype' + e.toString());
    throw e;
  }
}

Future<LowerMemberData> getLowerMemberList(String memberId) async {
  try {
    var formData = {'memid': memberId};
    print('getLowerMemberList..1..$formData');
    var response = await postRequest(servicePath['getLowerMemberList'],
        formData: formData);
    print('getLowerMemberList...2.$response');
    LowerMemberResult result = new LowerMemberResult.fromJson(response);
    print('getLowerMemberList...3.$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>getLowerMemberList' + e.toString());
    throw e;
  }
}

Future<BookcostData> postBookCostList(String memberId) async {
  try {
    print('postBookCostList....$memberId');
    var formData = {'memid': memberId};
    var response =
        await postRequest(servicePath['postBookCostList'], formData: formData);
    print('postBookCostList2....$response');
    BookcostResult result = new BookcostResult.fromJson(response);
    print('postBookCostList3....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>postBookCostList' + e.toString());
    throw e;
  }
}

Future<MemberAddrData> getMemberAddr(String memberId) async {
  try {
    print('getMemberAddr....');
    var formData = {'memid': memberId};
    var response =
        await postRequest(servicePath['getWalletAddr'], formData: formData);
    print('getMemberAddr....$response');
    MemberAddrResult result = new MemberAddrResult.fromJson(response);
    print('getMemberAddr....${result.data.address}');
    return result.data;
  } catch (e) {
    print('ERROR=====>getMemberAddr' + e.toString());
    throw e;
  }
}

Future<CommonCommitData> postCommitMemberAddr(
    String memberId, String address) async {
  try {
    print('postCommitMemberAddr....');
    var formData = {'memid': memberId, "address": address};
    var response =
        await postRequest(servicePath['commitWalletAddr'], formData: formData);
    print('postCommitMemberAddr....$response');
    CommonCommitResult result = new CommonCommitResult.fromJson(response);
    print('postCommitMemberAddr....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>postCommitMemberAddr' + e.toString());
    throw e;
  }
}

Future<CommonCommitData> postCommitMemberName(
    String memberId, String name) async {
  try {
    print('commitMemberName....');
    var formData = {'memid': memberId, "name": name};
    var response =
        await postRequest(servicePath['commitMemberName'], formData: formData);
    print('commitMemberName....$response');
    CommonCommitResult result = new CommonCommitResult.fromJson(response);
    print('commitMemberName....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>commitMemberName' + e.toString());
    throw e;
  }
}

Future<WalletBalanceData> getWalletBalance(String memberId) async {
  try {
    print('getWalletBalance....');
    var formData = {'memid': memberId};
    var response =
        await postRequest(servicePath['getWalletBalance'], formData: formData);
    print('getWalletBalanceXAW....$response');
    WalletBalanceResult result = new WalletBalanceResult.fromJson(response);
    print('getWalletBalanceWDAW....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>getWalletBalanceAD' + e.toString());
    throw e;
  }
}

Future<MemberWithdrawInfoData> getMemberWithDrawInfo(String memberId) async {
  try {
    print('getMemberWithDrawInfo....');
    var formData = {'memid': memberId};
    var response =
        await postRequest(servicePath['getWithDrawInfo'], formData: formData);
    print('getMemberWithDrawInfo....$response');
    MemberWithdrawInfo result = new MemberWithdrawInfo.fromJson(response);
    print('getMemberWithDrawInfo....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>getMemberWithDrawInfo' + e.toString());
    throw e;
  }
}

Future<MemCodeData> getMemberCode(String memberId) async {
  try {
    print('getMemberCode....');
    var formData = {'memid': memberId};
    var response =
        await postRequest(servicePath['getMemberCode'], formData: formData);
    // var response = await getRequest(
    //     "http://tcpos.lbbcol.com:20100/shopmanage/shop/getShopPoints");
    print('getMemberCode....$response');
    MemCodeResult result = new MemCodeResult.fromJson(response);
    print('getMemberCode....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>getMemberCode' + e.toString());
    throw e;
  }
}

Future<CommonCommitData> commitWithdrawApp(
    String memberId, String acctype, String acount, String amount,
    {String accname, String memo}) async {
  try {
    print('commitWithdraw....');
    var formData = {
      'memid': memberId,
      "acctype": acctype,
      "acount": acount,
      "accname": accname,
      "memo": memo,
      "amount": amount
    };
    var response =
        await postRequest(servicePath['commitWithdraw'], formData: formData);
    print('commitWithdrXaw....$response');
    CommonCommitResult result = new CommonCommitResult.fromJson(response);
    print('commitWithdraaw....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>commitWithdraw' + e.toString());
    throw e;
  }
}

Future<CommonCommitData> generateCheckCode(String mobile) async {
  try {
    print('generateCheckCode....');
    var formData = {'mobile': mobile};
    var response =
        await postRequest(servicePath['generateCheckCode'], formData: formData);
    print('generateCheckCode....$response');
    CommonCommitResult result = new CommonCommitResult.fromJson(response);
    print('generateCheckCode....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>generateCheckCode' + e.toString());
    throw e;
  }
}

Future<CommonCommitData> commitTransApp(
    String memberId, String bitAddress, String amount) async {
  try {
    print('commitTransApp....');
    var formData = {
      'memid': memberId,
      "bitaddress": bitAddress,
      "amount": amount,
    };
    var response =
        await postRequest(servicePath['commitTransApp'], formData: formData);
    print('commitTransApp....$response');
    CommonCommitResult result = new CommonCommitResult.fromJson(response);
    print('commitTransApp....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>commitTransApp' + e.toString());
    throw e;
  }
}

Future<MemMachinesData> getMemberMachine(String memberId) async {
  try {
    print('getMemberMachine....');
    var formData = {
      'memid': memberId,
    };
    var response =
        await postRequest(servicePath['getMemberMachine'], formData: formData);
    print('getMemberMachine....$response');
    MemMachinesResult result = new MemMachinesResult.fromJson(response);
    print('getMemberMachine....$response');
    return result.data;
  } catch (e) {
    print('ERROR=====>getMemberMachine' + e.toString());
    throw e;
  }
}
