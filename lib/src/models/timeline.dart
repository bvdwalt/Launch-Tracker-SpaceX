class Timeline {
  int webcastLiftoff;
  int goForPropLoading;
  int rp1Loading;
  int stage1LoxLoading;
  int stage2LoxLoading;
  int engineChill;
  int prelaunchChecks;
  int propellantPressurization;
  int goForLaunch;
  int ignition;
  int liftoff;
  int maxq;
  int meco;
  int stageSep;
  int secondStageIgnition;
  int fairingDeploy;
  int firstStageEntryBurn;
  int firstStageLanding;
  int seco1;
  int secondStageRestart;
  int seco2;
  int payloadDeploy;

  Timeline(
      {this.webcastLiftoff,
      this.goForPropLoading,
      this.rp1Loading,
      this.stage1LoxLoading,
      this.stage2LoxLoading,
      this.engineChill,
      this.prelaunchChecks,
      this.propellantPressurization,
      this.goForLaunch,
      this.ignition,
      this.liftoff,
      this.maxq,
      this.meco,
      this.stageSep,
      this.secondStageIgnition,
      this.fairingDeploy,
      this.firstStageEntryBurn,
      this.firstStageLanding,
      this.seco1,
      this.secondStageRestart,
      this.seco2,
      this.payloadDeploy});

  Timeline.fromJson(Map<String, dynamic> json) {
    webcastLiftoff = json['webcast_liftoff'];
    goForPropLoading = json['go_for_prop_loading'];
    rp1Loading = json['rp1_loading'];
    stage1LoxLoading = json['stage1_lox_loading'];
    stage2LoxLoading = json['stage2_lox_loading'];
    engineChill = json['engine_chill'];
    prelaunchChecks = json['prelaunch_checks'];
    propellantPressurization = json['propellant_pressurization'];
    goForLaunch = json['go_for_launch'];
    ignition = json['ignition'];
    liftoff = json['liftoff'];
    maxq = json['maxq'];
    meco = json['meco'];
    stageSep = json['stage_sep'];
    secondStageIgnition = json['second_stage_ignition'];
    fairingDeploy = json['fairing_deploy'];
    firstStageEntryBurn = json['first_stage_entry_burn'];
    firstStageLanding = json['first_stage_landing'];
    seco1 = json['seco-1'];
    secondStageRestart = json['second_stage_restart'];
    seco2 = json['seco-2'];
    payloadDeploy = json['payload_deploy'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['webcast_liftoff'] = this.webcastLiftoff;
  //   data['go_for_prop_loading'] = this.goForPropLoading;
  //   data['rp1_loading'] = this.rp1Loading;
  //   data['stage1_lox_loading'] = this.stage1LoxLoading;
  //   data['stage2_lox_loading'] = this.stage2LoxLoading;
  //   data['engine_chill'] = this.engineChill;
  //   data['prelaunch_checks'] = this.prelaunchChecks;
  //   data['propellant_pressurization'] = this.propellantPressurization;
  //   data['go_for_launch'] = this.goForLaunch;
  //   data['ignition'] = this.ignition;
  //   data['liftoff'] = this.liftoff;
  //   data['maxq'] = this.maxq;
  //   data['meco'] = this.meco;
  //   data['stage_sep'] = this.stageSep;
  //   data['second_stage_ignition'] = this.secondStageIgnition;
  //   data['fairing_deploy'] = this.fairingDeploy;
  //   data['first_stage_entry_burn'] = this.firstStageEntryBurn;
  //   data['first_stage_landing'] = this.firstStageLanding;
  //   data['seco-1'] = this.seco1;
  //   data['second_stage_restart'] = this.secondStageRestart;
  //   data['seco-2'] = this.seco2;
  //   data['payload_deploy'] = this.payloadDeploy;
  //   return data;
  // }
}