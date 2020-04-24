class LaunchSite {
  String siteId;
  String siteName;
  String siteNameLong;

  LaunchSite({this.siteId, this.siteName, this.siteNameLong});

  LaunchSite.fromJson(Map<String, dynamic> json) {
    siteId = json['site_id'];
    siteName = json['site_name'];
    siteNameLong = json['site_name_long'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['site_id'] = this.siteId;
  //   data['site_name'] = this.siteName;
  //   data['site_name_long'] = this.siteNameLong;
  //   return data;
  // }
}