import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';

class ContractPage extends StatefulWidget {
  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  getContractView() {}
  String txtContent = '''尊敬的投资者（经销商），您好！请您仔细阅读《超算服务器投资须知》的内容，并慎重考虑自身财务状况和风险承受能力。
一、投资者（经销商）必须是年满18周岁至68周岁，具有独立民事、刑事行为能力且具有一定的经济承受能力、风险控制能力的合法公民。投资者（经销商）必须提供真实、有效的身份证明，保证资金来源的合法性及所提供所有资料的真实性、合法性、有效性。
二、投资者（经销商）在购买超算服务器后，每星期都能从超算服务器运行中获取静态收益为购买超算服务器总金额的0.5%—2.5%。（也就是我们平时的月收益2%—10%之间）如遇币价暴涨，投资者（经销商）也可获得额外收益。
三、投资者（经销商）静态收益公司会在每星期五以比特币形式转账到投资者（经销商）在我公司平台的比特币钱包账户中，价格参考每星期五币安交易平台当天上午九点左右的比特币兑换美金或人民币价格。（如遇到法定节假日，就在假期结束的第2个法定工作日完成转账）。
四、投资者（经销商）市场分享佣金为购买超算服务器总金额的5%。一次性分享佣金在公司收到新投资者（经销商）货款的24小时内（节假日顺延），以人民币形式转账到投资者（经销商）在我公司平台的人民币账户中。
五、投资者（经销商）市场推广奖励分为三级：您→一级经销商→二级经销商→三级经销商。您可获得一级经销商静态收益6%、二级经销商静态收益4%、三级经销商静态收益2%。
六、投资者（经销商）市场领导奖分别为：白银经销商、黄金经销商、钻石经销商。奖励白银经销商（自己要购买超算服务器总金额20W以上，另外需要管理2个购买超算服务器总金额200W以上的市场）所管理市场静态收益总额的2%，国内旅游一次。奖励黄金经销商（自己要购买超算服务器总金额30W以上，另外需要管理3个购买超算服务器总金额300W以上的市场）所管理市场静态收益总额的3%，国内外旅游一次。奖励钻石经销商（自己要购买超算服务器总金额50W以上，另外需要管理5个购买超算服务器总金额400W以上的市场）所管理市场静态收益总额的5%，国内外旅游两次。
七、每个投资者（经销商）只能开设一个账户，多账户、多点位，公司一经核实一律作废。
八、投资者（经销商）不能同时推广与本公司相类似的经营项目或平台，一经发现公司将取消该经销商所有收益。
九、投资者（经销商）未经我公司同意，不得私自与我公司合作单位及合作单位的工作人员发生业务关系，一经发现公司将取消该经销商所有收益。
十、以上所有收益和奖励制度都是2020年5月份比特币产量减半前的标准。减半后收益和奖励制度根据实际收益重新制定，望经销商家人们谅解。
十一、由于法规政策、币价、全网算力、挖矿难度时刻都在调整和变化的，（根据2018年04月27日发布的《资管新规》银行理财产品不再保本保收益）所以投资者（经销商）对购买超算服务器的风险和收益是清楚和了解的。
十二、如果发生不可抗力事件系指不能预见、不能避免或不能克服的客观事件，包括自然灾害如洪水、泥石流、火山爆发、地震、山崩、火灾、被中国政府部门评定为百年不遇级别以上的风暴和恶劣气候等，政府行为和政府指令，电力供电事故，以及社会异常事件如战争、动乱等。本公司对投资者（经销商）的超算服务器不做赔偿。
十三、本《超算服务器投资须知》条款和约定，双方都不得对任何第三方竞争公司和平台泄露。任何一方违反本约定的，应向对方承担违约责任，赔偿因此给对方造成的一切损失。本条约定不因本协议的解除或终止而失效。
我已经认真阅读并确认以上所有条款和约定。 
''';
  ScrollController _scrollController = new ScrollController();
  Widget raisedButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 60, 0, 50),
      width: 200,
      child: FLGradientButton.linear(
        textColor: Colors.white,
        child: Text(
          '     返 回      ',
          style: textStyleBold_16,
        ),
        colors: [Colors.deepOrange, Colors.orange],
        onPressed: () {
          print("返 回");
          if (Navigator.canPop(context)) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(title: "超算服务器投资须知"),
        body: Container(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Text(
                    "超算服务器投资须知", 
                    style: textStyle_16,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Text(
                    txtContent,
                    style: textStyleGrey_13,
                    strutStyle: StrutStyle(
                        forceStrutHeight: true, height: 2, leading: 0.3),
                  ),
                ),
                  Container( 
                  padding:  EdgeInsets.fromLTRB(10, 0, 30, 0), 
                  alignment:Alignment.centerRight ,
                  child: Text(
                    "------浙江迈钠信息技术服务有限公司",
            
                    textAlign:  TextAlign.right,
                      style: textStyleGrey_13,
                    strutStyle: StrutStyle(
                        forceStrutHeight: true, height: 2, leading: 0.3),
                   
                  ),
                ),
                raisedButton(context)
              ],
            ),
          ),
        ));
  }
}
