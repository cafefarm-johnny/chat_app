class Avatar {
  String? url;
  String? nickname;
  String? statusMessage;

  Avatar({
    this.url,
    this.nickname,
    this.statusMessage,
  });

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    nickname = json['nickname'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['nickname'] = nickname;
    data['statusMessage'] = statusMessage;
    return data;
  }
}
