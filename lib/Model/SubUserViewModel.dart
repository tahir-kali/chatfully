class SubUserViewModel {
  String n;
  int userCntMin,userCntMax,inboxCntIncluded,chatViewCntMax,dataRetentionDaysMax,diskMBAgentMax,crmFieldsMax,crmCntMax,allowAssignRolesPerms,campaignMsgMax;
  SubUserViewModel.from();
  SubUserViewModel(Map<String,dynamic> json){
    n = json["n"] as String;
    userCntMax = json["userCntMax"] as int;
    userCntMin = json["userCntMin"] as int;
    inboxCntIncluded = json["inboxCntIncluded"] as int;
    chatViewCntMax = json["chatViewCntMax"] as int;
    dataRetentionDaysMax = json["dataRetentionDaysMax"] as int;
    diskMBAgentMax = json["diskMBAgentMax"] as int;
    crmFieldsMax = json["crmFieldsMax"] as int;
    crmCntMax = json["crmCntMax"] as int;
    allowAssignRolesPerms = json["allowAssignRolesPerms"] as int;
    campaignMsgMax = json["campaignMsgMax"] as int;
  }
}