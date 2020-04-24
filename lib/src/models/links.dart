class Links {
  String missionPatch;
  String missionPatchSmall;
  String redditCampaign;
  String redditLaunch;
  String redditRecovery;
  String redditMedia;
  String presskit;
  String articleLink;
  String wikipedia;
  String videoLink;
  String youtubeId;
  List<String> flickrImages;

  Links(
      {this.missionPatch,
      this.missionPatchSmall,
      this.redditCampaign,
      this.redditLaunch,
      this.redditRecovery,
      this.redditMedia,
      this.presskit,
      this.articleLink,
      this.wikipedia,
      this.videoLink,
      this.youtubeId,
      this.flickrImages});

  Links.fromJson(Map<String, dynamic> json) {
    missionPatch = json['mission_patch'];
    missionPatchSmall = json['mission_patch_small'];
    redditCampaign = json['reddit_campaign'];
    redditLaunch = json['reddit_launch'];
    redditRecovery = json['reddit_recovery'];
    redditMedia = json['reddit_media'];
    presskit = json['presskit'];
    articleLink = json['article_link'];
    wikipedia = json['wikipedia'];
    videoLink = json['video_link'];
    youtubeId = json['youtube_id'];
    flickrImages = json['flickr_images'].cast<String>();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['mission_patch'] = this.missionPatch;
  //   data['mission_patch_small'] = this.missionPatchSmall;
  //   data['reddit_campaign'] = this.redditCampaign;
  //   data['reddit_launch'] = this.redditLaunch;
  //   data['reddit_recovery'] = this.redditRecovery;
  //   data['reddit_media'] = this.redditMedia;
  //   data['presskit'] = this.presskit;
  //   data['article_link'] = this.articleLink;
  //   data['wikipedia'] = this.wikipedia;
  //   data['video_link'] = this.videoLink;
  //   data['youtube_id'] = this.youtubeId;
  //   data['flickr_images'] = this.flickrImages;
  //   return data;
  // }
}