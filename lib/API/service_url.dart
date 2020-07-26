// const serviceUrl = 'http://yapi.demo.qunar.com/mock/79112/';
const serviceUrl = 'http://111.229.9.156:3121/';
//const serviceUrl = 'http://172.16.102.110:57503/';
//const serviceUrl = 'http://10.0.2.2:57503/';

const servicePath = {
  'getNewsList': serviceUrl + 'data/getnews',
  'getPricceList': serviceUrl + 'data/getcurrency',
  'getProfitSumByType': serviceUrl + 'data/getSumProfit',
  'getLowerMemberList': serviceUrl + 'data/getlowermemberlist',
  'postBookCostList': serviceUrl + 'data/postBookcost',
  'getWalletAddr': serviceUrl + 'data/getWalletAddr',
  'commitWalletAddr': serviceUrl + 'data/commitWalletAddr',
  'getWalletBalance': serviceUrl + 'data/getWalletBalance',
  'getMemberCode': serviceUrl + 'data/getMembercode',
  'commitWithdraw': serviceUrl + 'data/commitWithdraw',
  'commitTransApp': serviceUrl + 'data/commitTransAccount',
  'getMemberMachine': serviceUrl + 'data/getMemberMachine',
  'postLoginCheck': serviceUrl + 'data/checkLogin',
  'commitMemberName': serviceUrl + 'data/commitMemberName',
  'generateCheckCode': serviceUrl + 'data/generateCheckCode',
    'getWithDrawInfo': serviceUrl + 'data/getMemberWithDraw'
};
