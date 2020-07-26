class OssTokenModel {
  String accessKeyId;
  String accessKeySecret;
  String securityToken;

  OssTokenModel({this.accessKeyId, this.accessKeySecret, this.securityToken});


  static OssTokenModel fromMap(Map<String, dynamic> map) {
    OssTokenModel modelBean = new OssTokenModel();
    modelBean.accessKeyId = map['accessKeyId'];
    modelBean.accessKeySecret = map['accessKeySecret'];
    modelBean.securityToken = map['securityToken'];
    return modelBean;
  }

  @override
  String toString() {
    return 'OssTokenModel{accessKeyId: $accessKeyId, accessKeySecret: $accessKeySecret, securityToken: $securityToken}';
  }


}
