-- Database Client 8.4.2
-- Host: 10.18.213.225 Port: 1433 Database: dbo Schema: dbo
-- Dump is still an early version, please use the dumped SQL with caution

DROP TABLE IF EXISTS "AMCWarrDet";
CREATE TABLE "AMCWarrDet"(
    "VchCode" int NOT NULL,
    "SrNo" int NOT NULL,
    "Rectype" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "RefNo" nvarchar(25) NOT NULL,
    "ItemSerialNo" nvarchar(255) NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "Value1" float NOT NULL,
    "CM1" int NOT NULL,
    "Narration" nvarchar(255) NOT NULL,
    "ContEndDate" datetime NOT NULL,
    "I1" smallint NOT NULL,
    "Status" smallint NOT NULL
);
CREATE INDEX 01 ON "AMCWarrDet"("MasterCode1");
CREATE INDEX 02 ON "AMCWarrDet"("MasterCode2");
CREATE INDEX 03 ON "AMCWarrDet"("ItemSerialNo");
CREATE INDEX 04 ON "AMCWarrDet"("RefNo");
CREATE INDEX 05 ON "AMCWarrDet"("ContEndDate");
CREATE INDEX 06 ON "AMCWarrDet"("VchNo");
CREATE INDEX 07 ON "AMCWarrDet"("Status");
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"Rectype" DEFAULT ((0)) FOR "Rectype";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"ContEndDate" DEFAULT '((0))' FOR "ContEndDate";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."AMCWarrDet" ADD CONSTRAINT DF_AMCWarrDet_"Status" DEFAULT ((0)) FOR "Status";

DROP TABLE IF EXISTS "B2GMsgSendLog";
CREATE TABLE "B2GMsgSendLog"(
    "Date" datetime,
    "SendType" int,
    "CompCode" varchar(50),
    "MsgType" int,
    "MasterType" int,
    "TemplateCode" int,
    "TemplateName" varchar(50),
    "PartyCode" int,
    "PartyName" varchar(50),
    "MsgCount" int,
    "DocCount" int
);

DROP TABLE IF EXISTS "BillingDet";
CREATE TABLE "BillingDet"(
    "VchCode" int NOT NULL,
    "PartyName" nvarchar(60) NOT NULL,
    "Address1" nvarchar(40) NOT NULL,
    "Address2" nvarchar(40) NOT NULL,
    "Address3" nvarchar(40) NOT NULL,
    "Address4" nvarchar(40) NOT NULL,
    "STNo" nvarchar(30) NOT NULL,
    "CSTNo" nvarchar(30) NOT NULL,
    "ECCCode" nvarchar(20) NOT NULL,
    "ExciseRegNo" nvarchar(30) NOT NULL,
    "PLANo" nvarchar(20) NOT NULL,
    "Range" nvarchar(80) NOT NULL,
    "Division" nvarchar(80) NOT NULL,
    "Collectorate" nvarchar(40) NOT NULL,
    "MobileNo" nvarchar(255) NOT NULL,
    "Email" nvarchar(255) NOT NULL,
    "DrugLicenceNo1" nvarchar(40) NOT NULL,
    "DrugLicenceNo2" nvarchar(40) NOT NULL,
    "ITPAN" nvarchar(20) NOT NULL,
    "StateCode" int NOT NULL,
    "GSTNo" nvarchar(30) NOT NULL,
    "TypeOfDealer" smallint NOT NULL,
    "AdharNo" nvarchar(255) NOT NULL,
    "PartyNameSL" nvarchar(255) NOT NULL,
    "Address1SL" nvarchar(255) NOT NULL,
    "Address2SL" nvarchar(255) NOT NULL,
    "Address3SL" nvarchar(255) NOT NULL,
    "Address4SL" nvarchar(255) NOT NULL,
    "FSSAINo" nvarchar(255) NOT NULL,
    "UdyamNo" nvarchar(255) NOT NULL,
    "MSMEType" smallint NOT NULL
);
CREATE INDEX 01 ON "BillingDet"("VchCode");
CREATE INDEX 02 ON "BillingDet"("PartyName");
CREATE INDEX 03 ON "BillingDet"("MobileNo");
CREATE INDEX 04 ON "BillingDet"("Email");
ALTER TABLE "dbo"."BillingDet" ADD CONSTRAINT DF_BillingDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."BillingDet" ADD CONSTRAINT DF_BillingDet_"StateCode" DEFAULT ((0)) FOR "StateCode";
ALTER TABLE "dbo"."BillingDet" ADD CONSTRAINT DF_BillingDet_"TypeOfDealer" DEFAULT ((0)) FOR "TypeOfDealer";
ALTER TABLE "dbo"."BillingDet" ADD CONSTRAINT DF_BillingDet_"MSMEType" DEFAULT ((0)) FOR "MSMEType";

DROP TABLE IF EXISTS "BRSOpBal";
CREATE TABLE "BRSOpBal"(
    "SrNo" smallint NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "OpAmt" float NOT NULL,
    "Type" smallint NOT NULL,
    "ShortNar" nvarchar(40) NOT NULL,
    "EntryDate" datetime NOT NULL,
    "ClrDate" datetime NOT NULL,
    "OldVchCode" int NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "I1" smallint NOT NULL,
    "C1" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "BRSOpBal"("MasterCode1","Type","SrNo");
CREATE INDEX 02 ON "BRSOpBal"("MasterCode2");
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"OpAmt" DEFAULT ((0)) FOR "OpAmt";
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"EntryDate" DEFAULT '((0))' FOR "EntryDate";
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"ClrDate" DEFAULT '((0))' FOR "ClrDate";
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"OldVchCode" DEFAULT ((0)) FOR "OldVchCode";
ALTER TABLE "dbo"."BRSOpBal" ADD CONSTRAINT DF_BRSOpBal_"I1" DEFAULT ((0)) FOR "I1";

DROP TABLE IF EXISTS "CEBusyMsgSchInfo";
CREATE TABLE "CEBusyMsgSchInfo"(
    "ID" int IDENTITY(1,1) NOT NULL,
    "TemplateType" int,
    "TemplateSubType" varchar(50),
    "Code" int,
    "Name" varchar(50),
    "MasterType" int,
    "MasterTName" varchar(50),
    "SeriesCode" int,
    "PMode" int,
    "StartTime" datetime,
    "EndTime" datetime,
    "TSchMsg" int,
    "TMsgSend" int,
    "Sync" int
);

DROP TABLE IF EXISTS "CEBusyMsgSchInfoDT";
CREATE TABLE "CEBusyMsgSchInfoDT"(
    "MsgID" int,
    "MsgSrNo" int,
    "Receipient" varchar(250),
    "ReceipientName" varchar(50),
    "ReceipientCC" varchar(250),
    "ReceipientBCC" varchar(250),
    "MsgBody" text,
    "DocCount" int,
    "MsgStatus" int,
    "MessageID" varchar(100)
);

DROP TABLE IF EXISTS "CheckList";
CREATE TABLE "CheckList"(
    "Type" smallint NOT NULL,
    "Code" int NOT NULL,
    "Action" smallint NOT NULL,
    "ActionTime" datetime NOT NULL,
    "UserName" nvarchar(20) NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "Notes" ntext NOT NULL,
    "ComputerName" nvarchar(25) NOT NULL
);
CREATE INDEX 21 ON "CheckList"("Code");
CREATE INDEX 23 ON "CheckList"("UserName");
CREATE INDEX 24 ON "CheckList"("Action");
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"Code" DEFAULT ((0)) FOR "Code";
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"Action" DEFAULT ((0)) FOR "Action";
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"ActionTime" DEFAULT '((0))' FOR "ActionTime";
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."CheckList" ADD CONSTRAINT DF_CheckList_"D5" DEFAULT ((0)) FOR "D5";

DROP TABLE IF EXISTS "CheckListNew";
CREATE TABLE "CheckListNew"(
    "UID" int NOT NULL,
    "Type" smallint NOT NULL,
    "Code" int NOT NULL,
    "Action" smallint NOT NULL,
    "ActionTime" datetime NOT NULL,
    "UserName" nvarchar(20) NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "ComputerName" nvarchar(100) NOT NULL,
    "Remarks" nvarchar(100) NOT NULL
);
CREATE INDEX 01 ON "CheckListNew"("UID");
CREATE INDEX 02 ON "CheckListNew"("Code");
CREATE INDEX 04 ON "CheckListNew"("UserName");
CREATE INDEX 05 ON "CheckListNew"("Action");
ALTER TABLE "dbo"."CheckListNew" ADD CONSTRAINT DF_CheckListNew_"UID" DEFAULT ((0)) FOR "UID";
ALTER TABLE "dbo"."CheckListNew" ADD CONSTRAINT DF_CheckListNew_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."CheckListNew" ADD CONSTRAINT DF_CheckListNew_"Code" DEFAULT ((0)) FOR "Code";
ALTER TABLE "dbo"."CheckListNew" ADD CONSTRAINT DF_CheckListNew_"Action" DEFAULT ((0)) FOR "Action";
ALTER TABLE "dbo"."CheckListNew" ADD CONSTRAINT DF_CheckListNew_"ActionTime" DEFAULT '((0))' FOR "ActionTime";
ALTER TABLE "dbo"."CheckListNew" ADD CONSTRAINT DF_CheckListNew_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."CheckListNew" ADD CONSTRAINT DF_CheckListNew_"D2" DEFAULT ((0)) FOR "D2";

DROP TABLE IF EXISTS "CheckListNewDet";
CREATE TABLE "CheckListNewDet"(
    "UID" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "XMLStr" ntext NOT NULL
);
CREATE INDEX 01 ON "CheckListNewDet"("UID");
ALTER TABLE "dbo"."CheckListNewDet" ADD CONSTRAINT DF_CheckListNewDet_"UID" DEFAULT ((0)) FOR "UID";
ALTER TABLE "dbo"."CheckListNewDet" ADD CONSTRAINT DF_CheckListNewDet_"SrNo" DEFAULT ((0)) FOR "SrNo";

DROP TABLE IF EXISTS "CloudSyncIncr";
CREATE TABLE "CloudSyncIncr"(
    "Code" int NOT NULL,
    "Type" smallint NOT NULL,
    "SubType" smallint NOT NULL,
    "Action" smallint NOT NULL,
    "VchMastCode" int NOT NULL,
    "EntryDateTime" datetime NOT NULL,
    "Error" nvarchar(255) NOT NULL,
    "Status" smallint NOT NULL,
    "SelfImageLink" nvarchar(255) NOT NULL,
    "BusyDocLink" nvarchar(255) NOT NULL,
    "FormatType" smallint NOT NULL,
    "Description" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "CloudSyncIncr"("Code");
CREATE INDEX 02 ON "CloudSyncIncr"("Type");
CREATE INDEX 03 ON "CloudSyncIncr"("Action");
CREATE INDEX 05 ON "CloudSyncIncr"("EntryDateTime");
CREATE INDEX 07 ON "CloudSyncIncr"("Status");
ALTER TABLE "dbo"."CloudSyncIncr" ADD CONSTRAINT DF_CloudSyncIncr_"Code" DEFAULT ((0)) FOR "Code";
ALTER TABLE "dbo"."CloudSyncIncr" ADD CONSTRAINT DF_CloudSyncIncr_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."CloudSyncIncr" ADD CONSTRAINT DF_CloudSyncIncr_"SubType" DEFAULT ((0)) FOR "SubType";
ALTER TABLE "dbo"."CloudSyncIncr" ADD CONSTRAINT DF_CloudSyncIncr_"Action" DEFAULT ((0)) FOR "Action";
ALTER TABLE "dbo"."CloudSyncIncr" ADD CONSTRAINT DF_CloudSyncIncr_"VchMastCode" DEFAULT ((0)) FOR "VchMastCode";
ALTER TABLE "dbo"."CloudSyncIncr" ADD CONSTRAINT DF_CloudSyncIncr_"EntryDateTime" DEFAULT '((0))' FOR "EntryDateTime";
ALTER TABLE "dbo"."CloudSyncIncr" ADD CONSTRAINT DF_CloudSyncIncr_"Status" DEFAULT ((0)) FOR "Status";
ALTER TABLE "dbo"."CloudSyncIncr" ADD CONSTRAINT DF_CloudSyncIncr_"FormatType" DEFAULT ((0)) FOR "FormatType";

DROP TABLE IF EXISTS "CloudSyncIncrDet";
CREATE TABLE "CloudSyncIncrDet"(
    "Code" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "XMLStr" ntext NOT NULL
);
CREATE INDEX 01 ON "CloudSyncIncrDet"("Code");
CREATE INDEX 02 ON "CloudSyncIncrDet"("SrNo");
ALTER TABLE "dbo"."CloudSyncIncrDet" ADD CONSTRAINT DF_CloudSyncIncrDet_"Code" DEFAULT ((0)) FOR "Code";
ALTER TABLE "dbo"."CloudSyncIncrDet" ADD CONSTRAINT DF_CloudSyncIncrDet_"SrNo" DEFAULT ((0)) FOR "SrNo";

DROP TABLE IF EXISTS "CloudSyncStatus";
CREATE TABLE "CloudSyncStatus"(
    "BulkStatus" smallint NOT NULL,
    "BulkStatusDet" ntext NOT NULL,
    "BulkDateTime" datetime NOT NULL,
    "BulkComputerName" nvarchar(255) NOT NULL,
    "BulkIP" nvarchar(255) NOT NULL,
    "IncrStatus" smallint NOT NULL,
    "IncrStatusDet" ntext NOT NULL,
    "IncrDateTime" datetime NOT NULL,
    "IncrComputerName" nvarchar(255) NOT NULL,
    "IncrIP" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "CloudSyncStatus"("BulkStatus");
CREATE INDEX 02 ON "CloudSyncStatus"("BulkComputerName");
ALTER TABLE "dbo"."CloudSyncStatus" ADD CONSTRAINT DF_CloudSyncStatus_"BulkStatus" DEFAULT ((0)) FOR "BulkStatus";
ALTER TABLE "dbo"."CloudSyncStatus" ADD CONSTRAINT DF_CloudSyncStatus_"BulkDateTime" DEFAULT '((0))' FOR "BulkDateTime";
ALTER TABLE "dbo"."CloudSyncStatus" ADD CONSTRAINT DF_CloudSyncStatus_"IncrStatus" DEFAULT ((0)) FOR "IncrStatus";
ALTER TABLE "dbo"."CloudSyncStatus" ADD CONSTRAINT DF_CloudSyncStatus_"IncrDateTime" DEFAULT '((0))' FOR "IncrDateTime";

DROP TABLE IF EXISTS "Config";
CREATE TABLE "Config"(
    "RecType" smallint NOT NULL,
    "Type" smallint NOT NULL,
    "C1" nvarchar(20) NOT NULL,
    "C2" nvarchar(20) NOT NULL,
    "C3" nvarchar(20) NOT NULL,
    "C4" nvarchar(20) NOT NULL,
    "C5" nvarchar(20) NOT NULL,
    "C6" nvarchar(20) NOT NULL,
    "C7" nvarchar(20) NOT NULL,
    "C8" nvarchar(20) NOT NULL,
    "C9" nvarchar(20) NOT NULL,
    "C10" nvarchar(20) NOT NULL,
    "C11" nvarchar(20) NOT NULL,
    "C12" nvarchar(20) NOT NULL,
    "C13" nvarchar(20) NOT NULL,
    "C14" nvarchar(20) NOT NULL,
    "C15" nvarchar(20) NOT NULL,
    "C16" nvarchar(20) NOT NULL,
    "C17" nvarchar(20) NOT NULL,
    "C18" nvarchar(20) NOT NULL,
    "C19" nvarchar(20) NOT NULL,
    "C20" nvarchar(20) NOT NULL,
    "C21" nvarchar(255) NOT NULL,
    "C22" nvarchar(255) NOT NULL,
    "C23" nvarchar(255) NOT NULL,
    "C24" nvarchar(255) NOT NULL,
    "C25" nvarchar(255) NOT NULL,
    "C26" nvarchar(255) NOT NULL,
    "C27" nvarchar(255) NOT NULL,
    "C28" nvarchar(255) NOT NULL,
    "C29" nvarchar(255) NOT NULL,
    "C30" nvarchar(255) NOT NULL,
    "DocName" nvarchar(35) NOT NULL,
    "InvVchName" nvarchar(35) NOT NULL,
    "FaVchName" nvarchar(35) NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "I4" smallint NOT NULL,
    "I5" smallint NOT NULL,
    "I6" smallint NOT NULL,
    "I7" smallint NOT NULL,
    "I8" smallint NOT NULL,
    "I9" smallint NOT NULL,
    "I10" smallint NOT NULL,
    "I11" smallint NOT NULL,
    "I12" smallint NOT NULL,
    "I13" smallint NOT NULL,
    "I14" smallint NOT NULL,
    "I15" smallint NOT NULL,
    "I16" smallint NOT NULL,
    "I17" smallint NOT NULL,
    "I18" smallint NOT NULL,
    "I19" smallint NOT NULL,
    "I20" smallint NOT NULL,
    "I21" smallint NOT NULL,
    "I22" smallint NOT NULL,
    "I23" smallint NOT NULL,
    "I24" smallint NOT NULL,
    "I25" smallint NOT NULL,
    "I26" smallint NOT NULL,
    "I27" smallint NOT NULL,
    "I28" smallint NOT NULL,
    "I29" smallint NOT NULL,
    "I30" smallint NOT NULL,
    "I31" smallint NOT NULL,
    "I32" smallint NOT NULL,
    "I33" smallint NOT NULL,
    "I34" smallint NOT NULL,
    "I35" smallint NOT NULL,
    "NoOfFld" smallint NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "B6" bit NOT NULL,
    "B7" bit NOT NULL,
    "B8" bit NOT NULL,
    "B9" bit NOT NULL,
    "B10" bit NOT NULL,
    "B11" bit NOT NULL,
    "B12" bit NOT NULL,
    "B13" bit NOT NULL,
    "B14" bit NOT NULL,
    "B15" bit NOT NULL,
    "B16" bit NOT NULL,
    "B17" bit NOT NULL,
    "B18" bit NOT NULL,
    "B19" bit NOT NULL,
    "B20" bit NOT NULL,
    "B21" bit NOT NULL,
    "B22" bit NOT NULL,
    "B23" bit NOT NULL,
    "B24" bit NOT NULL,
    "B25" bit NOT NULL,
    "B26" bit NOT NULL,
    "B27" bit NOT NULL,
    "B28" bit NOT NULL,
    "B29" bit NOT NULL,
    "B30" bit NOT NULL,
    "B31" bit NOT NULL,
    "B32" bit NOT NULL,
    "B33" bit NOT NULL,
    "B34" bit NOT NULL,
    "B35" bit NOT NULL,
    "B36" bit NOT NULL,
    "B37" bit NOT NULL,
    "B38" bit NOT NULL,
    "B39" bit NOT NULL,
    "B40" bit NOT NULL,
    "B41" bit NOT NULL,
    "B42" bit NOT NULL,
    "B43" bit NOT NULL,
    "B44" bit NOT NULL,
    "B45" bit NOT NULL,
    "B46" bit NOT NULL,
    "B47" bit NOT NULL,
    "B48" bit NOT NULL,
    "B49" bit NOT NULL,
    "B50" bit NOT NULL,
    "B51" bit NOT NULL,
    "B52" bit NOT NULL,
    "B53" bit NOT NULL,
    "B54" bit NOT NULL,
    "B55" bit NOT NULL,
    "B56" bit NOT NULL,
    "B57" bit NOT NULL,
    "B58" bit NOT NULL,
    "B59" bit NOT NULL,
    "B60" bit NOT NULL,
    "B61" bit NOT NULL,
    "B62" bit NOT NULL,
    "B63" bit NOT NULL,
    "B64" bit NOT NULL,
    "B65" bit NOT NULL,
    "B66" bit NOT NULL,
    "B67" bit NOT NULL,
    "B68" bit NOT NULL,
    "B69" bit NOT NULL,
    "B70" bit NOT NULL,
    "B71" bit NOT NULL,
    "B72" bit NOT NULL,
    "B73" bit NOT NULL,
    "B74" bit NOT NULL,
    "B75" bit NOT NULL,
    "B76" bit NOT NULL,
    "B77" bit NOT NULL,
    "B78" bit NOT NULL,
    "B79" bit NOT NULL,
    "B80" bit NOT NULL,
    "B81" bit NOT NULL,
    "B82" bit NOT NULL,
    "B83" bit NOT NULL,
    "B84" bit NOT NULL,
    "B85" bit NOT NULL,
    "B86" bit NOT NULL,
    "B87" bit NOT NULL,
    "B88" bit NOT NULL,
    "B89" bit NOT NULL,
    "B90" bit NOT NULL,
    "B91" bit NOT NULL,
    "B92" bit NOT NULL,
    "B93" bit NOT NULL,
    "B94" bit NOT NULL,
    "B95" bit NOT NULL,
    "B96" bit NOT NULL,
    "B97" bit NOT NULL,
    "B98" bit NOT NULL,
    "B99" bit NOT NULL,
    "B100" bit NOT NULL,
    "B101" bit NOT NULL,
    "B102" bit NOT NULL,
    "B103" bit NOT NULL,
    "B104" bit NOT NULL,
    "B105" bit NOT NULL,
    "B106" bit NOT NULL,
    "B107" bit NOT NULL,
    "B108" bit NOT NULL,
    "B109" bit NOT NULL,
    "B110" bit NOT NULL,
    "B111" bit NOT NULL,
    "B112" bit NOT NULL,
    "B113" bit NOT NULL,
    "B114" bit NOT NULL,
    "B115" bit NOT NULL,
    "B116" bit NOT NULL,
    "B117" bit NOT NULL,
    "B118" bit NOT NULL,
    "B119" bit NOT NULL,
    "B120" bit NOT NULL,
    "B121" bit NOT NULL,
    "B122" bit NOT NULL,
    "B123" bit NOT NULL,
    "B124" bit NOT NULL,
    "B125" bit NOT NULL,
    "B126" bit NOT NULL,
    "B127" bit NOT NULL,
    "B128" bit NOT NULL,
    "B129" bit NOT NULL,
    "B130" bit NOT NULL,
    "B131" bit NOT NULL,
    "B132" bit NOT NULL,
    "B133" bit NOT NULL,
    "B134" bit NOT NULL,
    "B135" bit NOT NULL,
    "B136" bit NOT NULL,
    "B137" bit NOT NULL,
    "B138" bit NOT NULL,
    "B139" bit NOT NULL,
    "B140" bit NOT NULL,
    "B141" bit NOT NULL,
    "B142" bit NOT NULL,
    "L1" int NOT NULL,
    "L2" int NOT NULL,
    "L3" int NOT NULL,
    "L4" int NOT NULL,
    "L5" int NOT NULL,
    "L6" int NOT NULL,
    "L7" int NOT NULL,
    "L8" int NOT NULL,
    "L9" int NOT NULL,
    "L10" int NOT NULL,
    "L11" int NOT NULL,
    "L12" int NOT NULL,
    "L13" int NOT NULL,
    "L14" int NOT NULL,
    "L15" int NOT NULL,
    "L16" int NOT NULL,
    "L17" int NOT NULL,
    "L18" int NOT NULL,
    "L19" int NOT NULL,
    "L20" int NOT NULL,
    "CM1" int NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "D7" float NOT NULL,
    "D8" float NOT NULL,
    "D9" float NOT NULL,
    "D10" float NOT NULL,
    "D11" float NOT NULL,
    "D12" float NOT NULL,
    "D13" float NOT NULL,
    "D14" float NOT NULL,
    "D15" float NOT NULL,
    "Date" datetime NOT NULL,
    "M1" ntext NOT NULL,
    "PricingMode" smallint NOT NULL,
    "PricingModeForPurc" smallint NOT NULL,
    "M2" ntext NOT NULL,
    "Stamp" int NOT NULL
);
CREATE INDEX 01 ON "Config"("RecType","Type");
CREATE INDEX 02 ON "Config"("RecType","L1");
CREATE INDEX 03 ON "Config"("CM1");
CREATE INDEX 04 ON "Config"("C1");
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I4" DEFAULT ((0)) FOR "I4";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I5" DEFAULT ((0)) FOR "I5";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I6" DEFAULT ((0)) FOR "I6";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I7" DEFAULT ((0)) FOR "I7";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I8" DEFAULT ((0)) FOR "I8";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I9" DEFAULT ((0)) FOR "I9";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I10" DEFAULT ((0)) FOR "I10";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I11" DEFAULT ((0)) FOR "I11";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I12" DEFAULT ((0)) FOR "I12";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I13" DEFAULT ((0)) FOR "I13";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I14" DEFAULT ((0)) FOR "I14";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I15" DEFAULT ((0)) FOR "I15";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I16" DEFAULT ((0)) FOR "I16";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I17" DEFAULT ((0)) FOR "I17";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I18" DEFAULT ((0)) FOR "I18";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I19" DEFAULT ((0)) FOR "I19";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I20" DEFAULT ((0)) FOR "I20";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I21" DEFAULT ((0)) FOR "I21";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I22" DEFAULT ((0)) FOR "I22";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I23" DEFAULT ((0)) FOR "I23";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I24" DEFAULT ((0)) FOR "I24";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I25" DEFAULT ((0)) FOR "I25";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I26" DEFAULT ((0)) FOR "I26";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I27" DEFAULT ((0)) FOR "I27";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I28" DEFAULT ((0)) FOR "I28";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I29" DEFAULT ((0)) FOR "I29";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I30" DEFAULT ((0)) FOR "I30";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I31" DEFAULT ((0)) FOR "I31";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I32" DEFAULT ((0)) FOR "I32";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I33" DEFAULT ((0)) FOR "I33";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I34" DEFAULT ((0)) FOR "I34";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"I35" DEFAULT ((0)) FOR "I35";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"NoOfFld" DEFAULT ((0)) FOR "NoOfFld";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B6" DEFAULT '((0))' FOR "B6";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B7" DEFAULT '((0))' FOR "B7";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B8" DEFAULT '((0))' FOR "B8";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B9" DEFAULT '((0))' FOR "B9";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B10" DEFAULT '((0))' FOR "B10";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B11" DEFAULT '((0))' FOR "B11";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B12" DEFAULT '((0))' FOR "B12";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B13" DEFAULT '((0))' FOR "B13";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B14" DEFAULT '((0))' FOR "B14";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B15" DEFAULT '((0))' FOR "B15";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B16" DEFAULT '((0))' FOR "B16";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B17" DEFAULT '((0))' FOR "B17";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B18" DEFAULT '((0))' FOR "B18";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B19" DEFAULT '((0))' FOR "B19";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B20" DEFAULT '((0))' FOR "B20";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B21" DEFAULT '((0))' FOR "B21";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B22" DEFAULT '((0))' FOR "B22";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B23" DEFAULT '((0))' FOR "B23";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B24" DEFAULT '((0))' FOR "B24";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B25" DEFAULT '((0))' FOR "B25";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B26" DEFAULT '((0))' FOR "B26";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B27" DEFAULT '((0))' FOR "B27";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B28" DEFAULT '((0))' FOR "B28";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B29" DEFAULT '((0))' FOR "B29";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B30" DEFAULT '((0))' FOR "B30";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B31" DEFAULT '((0))' FOR "B31";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B32" DEFAULT '((0))' FOR "B32";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B33" DEFAULT '((0))' FOR "B33";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B34" DEFAULT '((0))' FOR "B34";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B35" DEFAULT '((0))' FOR "B35";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B36" DEFAULT '((0))' FOR "B36";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B37" DEFAULT '((0))' FOR "B37";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B38" DEFAULT '((0))' FOR "B38";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B39" DEFAULT '((0))' FOR "B39";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B40" DEFAULT '((0))' FOR "B40";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B41" DEFAULT '((0))' FOR "B41";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B42" DEFAULT '((0))' FOR "B42";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B43" DEFAULT '((0))' FOR "B43";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B44" DEFAULT '((0))' FOR "B44";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B45" DEFAULT '((0))' FOR "B45";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B46" DEFAULT '((0))' FOR "B46";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B47" DEFAULT '((0))' FOR "B47";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B48" DEFAULT '((0))' FOR "B48";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B49" DEFAULT '((0))' FOR "B49";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B50" DEFAULT '((0))' FOR "B50";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B51" DEFAULT '((0))' FOR "B51";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B52" DEFAULT '((0))' FOR "B52";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B53" DEFAULT '((0))' FOR "B53";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B54" DEFAULT '((0))' FOR "B54";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B55" DEFAULT '((0))' FOR "B55";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B56" DEFAULT '((0))' FOR "B56";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B57" DEFAULT '((0))' FOR "B57";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B58" DEFAULT '((0))' FOR "B58";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B59" DEFAULT '((0))' FOR "B59";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B60" DEFAULT '((0))' FOR "B60";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B61" DEFAULT '((0))' FOR "B61";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B62" DEFAULT '((0))' FOR "B62";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B63" DEFAULT '((0))' FOR "B63";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B64" DEFAULT '((0))' FOR "B64";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B65" DEFAULT '((0))' FOR "B65";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B66" DEFAULT '((0))' FOR "B66";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B67" DEFAULT '((0))' FOR "B67";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B68" DEFAULT '((0))' FOR "B68";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B69" DEFAULT '((0))' FOR "B69";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B70" DEFAULT '((0))' FOR "B70";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B71" DEFAULT '((0))' FOR "B71";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B72" DEFAULT '((0))' FOR "B72";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B73" DEFAULT '((0))' FOR "B73";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B74" DEFAULT '((0))' FOR "B74";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B75" DEFAULT '((0))' FOR "B75";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B76" DEFAULT '((0))' FOR "B76";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B77" DEFAULT '((0))' FOR "B77";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B78" DEFAULT '((0))' FOR "B78";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B79" DEFAULT '((0))' FOR "B79";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B80" DEFAULT '((0))' FOR "B80";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B81" DEFAULT '((0))' FOR "B81";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B82" DEFAULT '((0))' FOR "B82";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B83" DEFAULT '((0))' FOR "B83";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B84" DEFAULT '((0))' FOR "B84";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B85" DEFAULT '((0))' FOR "B85";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B86" DEFAULT '((0))' FOR "B86";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B87" DEFAULT '((0))' FOR "B87";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B88" DEFAULT '((0))' FOR "B88";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B89" DEFAULT '((0))' FOR "B89";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B90" DEFAULT '((0))' FOR "B90";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B91" DEFAULT '((0))' FOR "B91";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B92" DEFAULT '((0))' FOR "B92";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B93" DEFAULT '((0))' FOR "B93";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B94" DEFAULT '((0))' FOR "B94";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B95" DEFAULT '((0))' FOR "B95";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B96" DEFAULT '((0))' FOR "B96";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B97" DEFAULT '((0))' FOR "B97";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B98" DEFAULT '((0))' FOR "B98";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B99" DEFAULT '((0))' FOR "B99";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B100" DEFAULT '((0))' FOR "B100";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B101" DEFAULT '((0))' FOR "B101";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B102" DEFAULT '((0))' FOR "B102";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B103" DEFAULT '((0))' FOR "B103";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B104" DEFAULT '((0))' FOR "B104";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B105" DEFAULT '((0))' FOR "B105";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B106" DEFAULT '((0))' FOR "B106";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B107" DEFAULT '((0))' FOR "B107";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B108" DEFAULT '((0))' FOR "B108";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B109" DEFAULT '((0))' FOR "B109";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B110" DEFAULT '((0))' FOR "B110";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B111" DEFAULT '((0))' FOR "B111";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B112" DEFAULT '((0))' FOR "B112";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B113" DEFAULT '((0))' FOR "B113";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B114" DEFAULT '((0))' FOR "B114";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B115" DEFAULT '((0))' FOR "B115";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B116" DEFAULT '((0))' FOR "B116";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B117" DEFAULT '((0))' FOR "B117";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B118" DEFAULT '((0))' FOR "B118";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B119" DEFAULT '((0))' FOR "B119";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B120" DEFAULT '((0))' FOR "B120";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B121" DEFAULT '((0))' FOR "B121";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B122" DEFAULT '((0))' FOR "B122";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B123" DEFAULT '((0))' FOR "B123";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B124" DEFAULT '((0))' FOR "B124";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B125" DEFAULT '((0))' FOR "B125";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B126" DEFAULT '((0))' FOR "B126";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B127" DEFAULT '((0))' FOR "B127";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B128" DEFAULT '((0))' FOR "B128";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B129" DEFAULT '((0))' FOR "B129";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B130" DEFAULT '((0))' FOR "B130";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B131" DEFAULT '((0))' FOR "B131";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B132" DEFAULT '((0))' FOR "B132";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B133" DEFAULT '((0))' FOR "B133";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B134" DEFAULT '((0))' FOR "B134";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B135" DEFAULT '((0))' FOR "B135";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B136" DEFAULT '((0))' FOR "B136";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B137" DEFAULT '((0))' FOR "B137";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B138" DEFAULT '((0))' FOR "B138";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B139" DEFAULT '((0))' FOR "B139";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B140" DEFAULT '((0))' FOR "B140";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B141" DEFAULT '((0))' FOR "B141";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"B142" DEFAULT '((0))' FOR "B142";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L1" DEFAULT ((0)) FOR "L1";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L2" DEFAULT ((0)) FOR "L2";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L3" DEFAULT ((0)) FOR "L3";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L4" DEFAULT ((0)) FOR "L4";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L5" DEFAULT ((0)) FOR "L5";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L6" DEFAULT ((0)) FOR "L6";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L7" DEFAULT ((0)) FOR "L7";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L8" DEFAULT ((0)) FOR "L8";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L9" DEFAULT ((0)) FOR "L9";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L10" DEFAULT ((0)) FOR "L10";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L11" DEFAULT ((0)) FOR "L11";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L12" DEFAULT ((0)) FOR "L12";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L13" DEFAULT ((0)) FOR "L13";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L14" DEFAULT ((0)) FOR "L14";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L15" DEFAULT ((0)) FOR "L15";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L16" DEFAULT ((0)) FOR "L16";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L17" DEFAULT ((0)) FOR "L17";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L18" DEFAULT ((0)) FOR "L18";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L19" DEFAULT ((0)) FOR "L19";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"L20" DEFAULT ((0)) FOR "L20";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D7" DEFAULT ((0)) FOR "D7";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D8" DEFAULT ((0)) FOR "D8";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D9" DEFAULT ((0)) FOR "D9";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D10" DEFAULT ((0)) FOR "D10";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D11" DEFAULT ((0)) FOR "D11";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D12" DEFAULT ((0)) FOR "D12";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D13" DEFAULT ((0)) FOR "D13";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D14" DEFAULT ((0)) FOR "D14";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"D15" DEFAULT ((0)) FOR "D15";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"PricingMode" DEFAULT ((0)) FOR "PricingMode";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"PricingModeForPurc" DEFAULT ((0)) FOR "PricingModeForPurc";
ALTER TABLE "dbo"."Config" ADD CONSTRAINT DF_Config_"Stamp" DEFAULT ((0)) FOR "Stamp";

DROP TABLE IF EXISTS "CSAuditLog";
CREATE TABLE "CSAuditLog"(
    "UID" int NOT NULL,
    "Type" smallint NOT NULL,
    "Code" int NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "VchDate" datetime NOT NULL,
    "Action" smallint NOT NULL,
    "ActionTime" datetime NOT NULL,
    "UserName" nvarchar(20) NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "ComputerName" nvarchar(100) NOT NULL,
    "Remarks" nvarchar(100) NOT NULL
);
CREATE INDEX 01 ON "CSAuditLog"("UID");
CREATE INDEX 02 ON "CSAuditLog"("Code");
CREATE INDEX 04 ON "CSAuditLog"("UserName");
CREATE INDEX 05 ON "CSAuditLog"("Action");
CREATE INDEX 06 ON "CSAuditLog"("VchSeriesCode");
CREATE INDEX 07 ON "CSAuditLog"("VchDate");
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"UID" DEFAULT ((0)) FOR "UID";
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"Code" DEFAULT ((0)) FOR "Code";
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"VchDate" DEFAULT '((0))' FOR "VchDate";
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"Action" DEFAULT ((0)) FOR "Action";
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"ActionTime" DEFAULT '((0))' FOR "ActionTime";
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."CSAuditLog" ADD CONSTRAINT DF_CSAuditLog_"D2" DEFAULT ((0)) FOR "D2";

DROP TABLE IF EXISTS "CSAuditLogDet";
CREATE TABLE "CSAuditLogDet"(
    "UID" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "XMLStr" ntext NOT NULL
);
CREATE INDEX 01 ON "CSAuditLogDet"("UID");
ALTER TABLE "dbo"."CSAuditLogDet" ADD CONSTRAINT DF_CSAuditLogDet_"UID" DEFAULT ((0)) FOR "UID";
ALTER TABLE "dbo"."CSAuditLogDet" ADD CONSTRAINT DF_CSAuditLogDet_"SrNo" DEFAULT ((0)) FOR "SrNo";

DROP TABLE IF EXISTS "DailyMessage";
CREATE TABLE "DailyMessage"(
    "Date" datetime NOT NULL,
    "NoOfDays" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "VSCode" int NOT NULL,
    "Msg1" nvarchar(96) NOT NULL,
    "Msg2" nvarchar(96) NOT NULL,
    "Msg3" nvarchar(96) NOT NULL,
    "Msg4" nvarchar(96) NOT NULL
);
CREATE INDEX 01 ON "DailyMessage"("Date","VchType","VSCode");
ALTER TABLE "dbo"."DailyMessage" ADD CONSTRAINT DF_DailyMessage_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."DailyMessage" ADD CONSTRAINT DF_DailyMessage_"NoOfDays" DEFAULT ((0)) FOR "NoOfDays";
ALTER TABLE "dbo"."DailyMessage" ADD CONSTRAINT DF_DailyMessage_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."DailyMessage" ADD CONSTRAINT DF_DailyMessage_"VSCode" DEFAULT ((0)) FOR "VSCode";

DROP TABLE IF EXISTS "DailySum";
CREATE TABLE "DailySum"(
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "MasterType" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "Dr1" float NOT NULL,
    "Dr2" float NOT NULL,
    "Dr3" float NOT NULL,
    "Cr1" float NOT NULL,
    "Cr2" float NOT NULL,
    "Cr3" float NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL
);
CREATE INDEX 11 ON "DailySum"("MasterCode1");
CREATE INDEX 12 ON "DailySum"("MasterCode2");
CREATE INDEX 13 ON "DailySum"("Date");
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"MasterType" DEFAULT ((0)) FOR "MasterType";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"Dr1" DEFAULT ((0)) FOR "Dr1";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"Dr2" DEFAULT ((0)) FOR "Dr2";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"Dr3" DEFAULT ((0)) FOR "Dr3";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"Cr1" DEFAULT ((0)) FOR "Cr1";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"Cr2" DEFAULT ((0)) FOR "Cr2";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"Cr3" DEFAULT ((0)) FOR "Cr3";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."DailySum" ADD CONSTRAINT DF_DailySum_"D4" DEFAULT ((0)) FOR "D4";

DROP TABLE IF EXISTS "DataSync";
CREATE TABLE "DataSync"(
    "UID" int IDENTITY(1,1) NOT NULL,
    "BranchCode" int NOT NULL,
    "RecType" smallint NOT NULL,
    "Type" smallint NOT NULL,
    "VMType" smallint NOT NULL,
    "MasterName" nvarchar(40) NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "Date" datetime NOT NULL,
    "VchSrCode" int NOT NULL,
    "CreatedBy" nvarchar(20) NOT NULL,
    "CreationTime" datetime NOT NULL,
    "LastModifiedBy" nvarchar(20) NOT NULL,
    "LastModificationTime" datetime NOT NULL,
    "ApprovedBy" nvarchar(20) NOT NULL,
    "ApprovalTime" datetime NOT NULL,
    "ServerInTime" datetime NOT NULL,
    "M1" ntext NOT NULL,
    "M2" ntext NOT NULL,
    "MasterName1" nvarchar(40) NOT NULL,
    "ComputerName" nvarchar(255) NOT NULL,
    "OldVchSrName" nvarchar(10) NOT NULL,
    "OldVchType" smallint NOT NULL,
    "VchSrName" nvarchar(10) NOT NULL,
    "DeletedBy" nvarchar(20) NOT NULL,
    "DeletionTime" datetime NOT NULL,
    "Srno" smallint NOT NULL,
    "CheckType" smallint NOT NULL,
    "ClearFullVch" bit NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "OldMasterName" nvarchar(40) NOT NULL,
    "OldDate" datetime NOT NULL,
    "OldVchNo" nvarchar(25) NOT NULL,
    "OldIdentity" ntext NOT NULL
);
CREATE INDEX 01 ON "DataSync"("BranchCode","RecType","ServerInTime");
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"BranchCode" DEFAULT ((0)) FOR "BranchCode";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"VMType" DEFAULT ((0)) FOR "VMType";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"VchSrCode" DEFAULT ((0)) FOR "VchSrCode";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"CreationTime" DEFAULT '((0))' FOR "CreationTime";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"LastModificationTime" DEFAULT '((0))' FOR "LastModificationTime";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"ApprovalTime" DEFAULT '((0))' FOR "ApprovalTime";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"ServerInTime" DEFAULT '((0))' FOR "ServerInTime";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"OldVchType" DEFAULT ((0)) FOR "OldVchType";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"DeletionTime" DEFAULT '((0))' FOR "DeletionTime";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"Srno" DEFAULT ((0)) FOR "Srno";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"CheckType" DEFAULT ((0)) FOR "CheckType";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"ClearFullVch" DEFAULT '((0))' FOR "ClearFullVch";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."DataSync" ADD CONSTRAINT DF_DataSync_"OldDate" DEFAULT '((0))' FOR "OldDate";

DROP TABLE IF EXISTS "DeletedInfo";
CREATE TABLE "DeletedInfo"(
    "Type" smallint NOT NULL,
    "VchMastType" smallint NOT NULL,
    "Identity" nvarchar(50) NOT NULL,
    "DeletedBy" nvarchar(20) NOT NULL,
    "DeletionTime" datetime NOT NULL,
    "OrgVchAmtBaseCur" float NOT NULL,
    "ModVchAmtBaseCur" float NOT NULL,
    "ComputerName" nvarchar(25) NOT NULL
);
CREATE INDEX 01 ON "DeletedInfo"("Type","VchMastType","DeletionTime");
ALTER TABLE "dbo"."DeletedInfo" ADD CONSTRAINT DF_DeletedInfo_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."DeletedInfo" ADD CONSTRAINT DF_DeletedInfo_"VchMastType" DEFAULT ((0)) FOR "VchMastType";
ALTER TABLE "dbo"."DeletedInfo" ADD CONSTRAINT DF_DeletedInfo_"DeletionTime" DEFAULT '((0))' FOR "DeletionTime";
ALTER TABLE "dbo"."DeletedInfo" ADD CONSTRAINT DF_DeletedInfo_"OrgVchAmtBaseCur" DEFAULT ((0)) FOR "OrgVchAmtBaseCur";
ALTER TABLE "dbo"."DeletedInfo" ADD CONSTRAINT DF_DeletedInfo_"ModVchAmtBaseCur" DEFAULT ((0)) FOR "ModVchAmtBaseCur";

DROP TABLE IF EXISTS "DeletedMasters";
CREATE TABLE "DeletedMasters"(
    "MasterType" smallint NOT NULL,
    "Name" nvarchar(40) NOT NULL
);
ALTER TABLE "dbo"."DeletedMasters" ADD CONSTRAINT DF_DeletedMasters_"MasterType" DEFAULT ((0)) FOR "MasterType";

DROP TABLE IF EXISTS "EComOrderBody";
CREATE TABLE "EComOrderBody"(
    "VchCode" int NOT NULL,
    "OrderItemID" nvarchar(50),
    "PhyQtyRcvd" float NOT NULL,
    "PhyQtyLost" float NOT NULL,
    "PhyQtyRemarks" nvarchar(255) NOT NULL,
    "PhyQtyLastModifiedBy" nvarchar(255) NOT NULL,
    "PhyQtyLastModifiedDate" datetime NOT NULL,
    "SKU" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "EComOrderBody"("VchCode");
CREATE INDEX 02 ON "EComOrderBody"("OrderItemID");
ALTER TABLE "dbo"."EComOrderBody" ADD CONSTRAINT DF_EComOrderBody_"VchCode" DEFAULT ((0)) FOR "VchCode";

DROP TABLE IF EXISTS "EComOrderHeader";
CREATE TABLE "EComOrderHeader"(
    "VchCode" int NOT NULL,
    "Marketplace" smallint NOT NULL,
    "EEMarketplaceID" smallint NOT NULL,
    "LocationKey" nvarchar(25) NOT NULL,
    "OrderID" nvarchar(25) NOT NULL,
    "OrderDate" datetime NOT NULL,
    "MPInvNo" nvarchar(25) NOT NULL,
    "MPInvDate" datetime NOT NULL,
    "JSONData" ntext NOT NULL,
    "PaymentMode" nvarchar(20) NOT NULL,
    "PaymentGateway" nvarchar(20) NOT NULL
);
CREATE INDEX 01 ON "EComOrderHeader"("OrderID");
CREATE INDEX 02 ON "EComOrderHeader"("EEMarketplaceID");
CREATE INDEX 03 ON "EComOrderHeader"("OrderDate");
CREATE INDEX 04 ON "EComOrderHeader"("LocationKey");
ALTER TABLE "dbo"."EComOrderHeader" ADD CONSTRAINT DF_EComOrderHeader_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."EComOrderHeader" ADD CONSTRAINT DF_EComOrderHeader_"Marketplace" DEFAULT ((0)) FOR "Marketplace";
ALTER TABLE "dbo"."EComOrderHeader" ADD CONSTRAINT DF_EComOrderHeader_"EEMarketplaceID" DEFAULT ((0)) FOR "EEMarketplaceID";
ALTER TABLE "dbo"."EComOrderHeader" ADD CONSTRAINT DF_EComOrderHeader_"OrderDate" DEFAULT '((0))' FOR "OrderDate";
ALTER TABLE "dbo"."EComOrderHeader" ADD CONSTRAINT DF_EComOrderHeader_"MPInvDate" DEFAULT '((0))' FOR "MPInvDate";

DROP TABLE IF EXISTS "EcomSettlement";
CREATE TABLE "EcomSettlement"(
    "VchCode" int NOT NULL,
    "Marketplace" smallint NOT NULL,
    "EEMarketplaceID" smallint NOT NULL,
    "SettlementID" nvarchar(100) NOT NULL,
    "EEPaymentID" nvarchar(100) NOT NULL,
    "LocationKey" nvarchar(25) NOT NULL,
    "SettlementDate" datetime NOT NULL,
    "SettledAmt" float NOT NULL,
    "jsonSum" ntext NOT NULL
);
CREATE INDEX 01 ON "EcomSettlement"("EEMarketplaceID");
CREATE INDEX 02 ON "EcomSettlement"("SettlementDate");
CREATE INDEX 03 ON "EcomSettlement"("EEPaymentID");
CREATE INDEX 04 ON "EcomSettlement"("LocationKey");
ALTER TABLE "dbo"."EcomSettlement" ADD CONSTRAINT DF_EcomSettlement_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."EcomSettlement" ADD CONSTRAINT DF_EcomSettlement_"Marketplace" DEFAULT ((0)) FOR "Marketplace";
ALTER TABLE "dbo"."EcomSettlement" ADD CONSTRAINT DF_EcomSettlement_"EEMarketplaceID" DEFAULT ((0)) FOR "EEMarketplaceID";
ALTER TABLE "dbo"."EcomSettlement" ADD CONSTRAINT DF_EcomSettlement_"SettlementDate" DEFAULT '((0))' FOR "SettlementDate";
ALTER TABLE "dbo"."EcomSettlement" ADD CONSTRAINT DF_EcomSettlement_"SettledAmt" DEFAULT ((0)) FOR "SettledAmt";

DROP TABLE IF EXISTS "EcomSettlementExp";
CREATE TABLE "EcomSettlementExp"(
    "Marketplace" smallint NOT NULL,
    "EEMarketplaceID" smallint NOT NULL,
    "SettlementID" nvarchar(100) NOT NULL,
    "EEPaymentID" nvarchar(100) NOT NULL,
    "LocationKey" nvarchar(25) NOT NULL,
    "ExpenseName" nvarchar(255) NOT NULL,
    "ExpenseAmt" float NOT NULL
);
CREATE INDEX 01 ON "EcomSettlementExp"("EEMarketplaceID");
CREATE INDEX 02 ON "EcomSettlementExp"("EEPaymentID");
CREATE INDEX 03 ON "EcomSettlementExp"("LocationKey");
ALTER TABLE "dbo"."EcomSettlementExp" ADD CONSTRAINT DF_EcomSettlementExp_"Marketplace" DEFAULT ((0)) FOR "Marketplace";
ALTER TABLE "dbo"."EcomSettlementExp" ADD CONSTRAINT DF_EcomSettlementExp_"EEMarketplaceID" DEFAULT ((0)) FOR "EEMarketplaceID";
ALTER TABLE "dbo"."EcomSettlementExp" ADD CONSTRAINT DF_EcomSettlementExp_"ExpenseAmt" DEFAULT ((0)) FOR "ExpenseAmt";

DROP TABLE IF EXISTS "EcomSettlementItem";
CREATE TABLE "EcomSettlementItem"(
    "Marketplace" smallint NOT NULL,
    "EEMarketplaceID" smallint NOT NULL,
    "SettlementID" nvarchar(100) NOT NULL,
    "EEPaymentID" nvarchar(100) NOT NULL,
    "LocationKey" nvarchar(25) NOT NULL,
    "OrderID" nvarchar(100) NOT NULL,
    "OrderDate" datetime NOT NULL,
    "OrderItemID" nvarchar(100) NOT NULL,
    "SaleAmt" float NOT NULL,
    "RefundAmt" float NOT NULL,
    "Type" nvarchar(25) NOT NULL,
    "SettledAmt" float NOT NULL,
    "TaxableExp" float NOT NULL,
    "CGSTAmt" float NOT NULL,
    "SGSTAmt" float NOT NULL,
    "IGSTAmt" float NOT NULL,
    "TDSAmt" float NOT NULL,
    "TCS_IGSTAmt" float NOT NULL,
    "TCS_CGSTAmt" float NOT NULL,
    "TCS_SGSTAmt" float NOT NULL,
    "MiscInc" float NOT NULL
);
CREATE INDEX 01 ON "EcomSettlementItem"("EEMarketplaceID");
CREATE INDEX 02 ON "EcomSettlementItem"("OrderID");
CREATE INDEX 03 ON "EcomSettlementItem"("OrderItemID");
CREATE INDEX 04 ON "EcomSettlementItem"("EEPaymentID");
CREATE INDEX 05 ON "EcomSettlementItem"("OrderDate");
CREATE INDEX 06 ON "EcomSettlementItem"("LocationKey");
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"Marketplace" DEFAULT ((0)) FOR "Marketplace";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"EEMarketplaceID" DEFAULT ((0)) FOR "EEMarketplaceID";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"OrderDate" DEFAULT '((0))' FOR "OrderDate";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"SaleAmt" DEFAULT ((0)) FOR "SaleAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"RefundAmt" DEFAULT ((0)) FOR "RefundAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"SettledAmt" DEFAULT ((0)) FOR "SettledAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"TaxableExp" DEFAULT ((0)) FOR "TaxableExp";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"CGSTAmt" DEFAULT ((0)) FOR "CGSTAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"SGSTAmt" DEFAULT ((0)) FOR "SGSTAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"IGSTAmt" DEFAULT ((0)) FOR "IGSTAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"TDSAmt" DEFAULT ((0)) FOR "TDSAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"TCS_IGSTAmt" DEFAULT ((0)) FOR "TCS_IGSTAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"TCS_CGSTAmt" DEFAULT ((0)) FOR "TCS_CGSTAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"TCS_SGSTAmt" DEFAULT ((0)) FOR "TCS_SGSTAmt";
ALTER TABLE "dbo"."EcomSettlementItem" ADD CONSTRAINT DF_EcomSettlementItem_"MiscInc" DEFAULT ((0)) FOR "MiscInc";

DROP TABLE IF EXISTS "EcomSettlementItemExp";
CREATE TABLE "EcomSettlementItemExp"(
    "Marketplace" smallint NOT NULL,
    "EEMarketplaceID" smallint NOT NULL,
    "SettlementID" nvarchar(100) NOT NULL,
    "EEPaymentID" nvarchar(100) NOT NULL,
    "LocationKey" nvarchar(25) NOT NULL,
    "OrderID" nvarchar(100) NOT NULL,
    "OrderDate" datetime NOT NULL,
    "OrderItemID" nvarchar(100) NOT NULL,
    "ExpenseName" nvarchar(255) NOT NULL,
    "ExpenseAmt" float NOT NULL
);
CREATE INDEX 01 ON "EcomSettlementItemExp"("EEMarketplaceID");
CREATE INDEX 02 ON "EcomSettlementItemExp"("OrderID");
CREATE INDEX 03 ON "EcomSettlementItemExp"("OrderItemID");
CREATE INDEX 04 ON "EcomSettlementItemExp"("EEPaymentID");
CREATE INDEX 05 ON "EcomSettlementItemExp"("LocationKey");
ALTER TABLE "dbo"."EcomSettlementItemExp" ADD CONSTRAINT DF_EcomSettlementItemExp_"Marketplace" DEFAULT ((0)) FOR "Marketplace";
ALTER TABLE "dbo"."EcomSettlementItemExp" ADD CONSTRAINT DF_EcomSettlementItemExp_"EEMarketplaceID" DEFAULT ((0)) FOR "EEMarketplaceID";
ALTER TABLE "dbo"."EcomSettlementItemExp" ADD CONSTRAINT DF_EcomSettlementItemExp_"OrderDate" DEFAULT '((0))' FOR "OrderDate";
ALTER TABLE "dbo"."EcomSettlementItemExp" ADD CONSTRAINT DF_EcomSettlementItemExp_"ExpenseAmt" DEFAULT ((0)) FOR "ExpenseAmt";

DROP TABLE IF EXISTS "EmpLADet";
CREATE TABLE "EmpLADet"(
    "EmpCode" int NOT NULL,
    "LAType" smallint NOT NULL,
    "SrNo" smallint NOT NULL,
    "DueDate" datetime NOT NULL,
    "Amount" float NOT NULL,
    "IntAmt" float NOT NULL,
    "Total" float NOT NULL,
    "Remarks" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "EmpLADet"("EmpCode");
CREATE INDEX 02 ON "EmpLADet"("LAType");
CREATE INDEX 03 ON "EmpLADet"("SrNo");
CREATE INDEX 04 ON "EmpLADet"("DueDate");
ALTER TABLE "dbo"."EmpLADet" ADD CONSTRAINT DF_EmpLADet_"EmpCode" DEFAULT ((0)) FOR "EmpCode";
ALTER TABLE "dbo"."EmpLADet" ADD CONSTRAINT DF_EmpLADet_"LAType" DEFAULT ((0)) FOR "LAType";
ALTER TABLE "dbo"."EmpLADet" ADD CONSTRAINT DF_EmpLADet_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."EmpLADet" ADD CONSTRAINT DF_EmpLADet_"DueDate" DEFAULT '((0))' FOR "DueDate";
ALTER TABLE "dbo"."EmpLADet" ADD CONSTRAINT DF_EmpLADet_"Amount" DEFAULT ((0)) FOR "Amount";
ALTER TABLE "dbo"."EmpLADet" ADD CONSTRAINT DF_EmpLADet_"IntAmt" DEFAULT ((0)) FOR "IntAmt";
ALTER TABLE "dbo"."EmpLADet" ADD CONSTRAINT DF_EmpLADet_"Total" DEFAULT ((0)) FOR "Total";

DROP TABLE IF EXISTS "EPaymentDet";
CREATE TABLE "EPaymentDet"(
    "RecType" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "AccSrNo" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "Value1" float NOT NULL,
    "Value2" float NOT NULL,
    "ShortNar" nvarchar(40) NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "ClrDate" datetime NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "Remarks" ntext NOT NULL,
    "Notes" ntext NOT NULL
);
CREATE INDEX 01 ON "EPaymentDet"("RecType");
CREATE INDEX 02 ON "EPaymentDet"("VchCode");
CREATE INDEX 03 ON "EPaymentDet"("MasterCode1");
CREATE INDEX 04 ON "EPaymentDet"("MasterCode2");
CREATE INDEX 05 ON "EPaymentDet"("VchType");
CREATE INDEX 06 ON "EPaymentDet"("ClrDate");
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"AccSrNo" DEFAULT ((0)) FOR "AccSrNo";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"Date2" DEFAULT '((0))' FOR "Date2";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"ClrDate" DEFAULT '((0))' FOR "ClrDate";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."EPaymentDet" ADD CONSTRAINT DF_EPaymentDet_"I2" DEFAULT ((0)) FOR "I2";

DROP TABLE IF EXISTS "ESAccExcludeConfig";
CREATE TABLE "ESAccExcludeConfig"(
    "SrNo" int,
    "AgrpCode" int
);

DROP TABLE IF EXISTS "ESAccountDepartment";
CREATE TABLE "ESAccountDepartment"(
    "Party" int,
    "DepCode" int,
    "Name" varchar(200),
    "Mobile" varchar(200),
    "Email" varchar(200),
    "DOB" datetime,
    "DOA" datetime,
    "GrpNm" text,
    "Grpid" text,
    "WFormat" varchar(50)
);

DROP TABLE IF EXISTS "ESApplySepDet";
CREATE TABLE "ESApplySepDet"(
    "ApplySepDet" int
);

DROP TABLE IF EXISTS "ESApplyValueConfig";
CREATE TABLE "ESApplyValueConfig"(
    "ApplyValue" int,
    "PRedJV" int,
    "SeriesCode" int,
    "OAccCode" int,
    "AgrpCode" int
);

DROP TABLE IF EXISTS "ESBAMsgTempConfig";
CREATE TABLE "ESBAMsgTempConfig"(
    "BSMSBody" text,
    "ASMSBody" text,
    "BAttachPath" varchar(255),
    "AAttachPath" varchar(255)
);

DROP TABLE IF EXISTS "ESBCDFileRecord";
CREATE TABLE "ESBCDFileRecord"(
    "FileName" varchar(50)
);

DROP TABLE IF EXISTS "ESBlockMPointConfig";
CREATE TABLE "ESBlockMPointConfig"(
    "BLKPoint" int,
    "ABLKPoint" int
);

DROP TABLE IF EXISTS "ESCallConfig";
CREATE TABLE "ESCallConfig"(
    "EnableCalling" int,
    "CallMode" int,
    "C1" varchar(250),
    "C2" varchar(250),
    "C3" varchar(250),
    "C4" varchar(250),
    "C5" varchar(250),
    "C6" varchar(250),
    "C7" varchar(250),
    "C8" varchar(250),
    "M1" text,
    "M2" text
);

DROP TABLE IF EXISTS "ESCallSubConfig";
CREATE TABLE "ESCallSubConfig"(
    "CallMode" int,
    "RecType" int,
    "SrNo" int,
    "C1" varchar(250),
    "C2" varchar(250),
    "C3" varchar(250),
    "C4" varchar(250)
);

DROP TABLE IF EXISTS "ESCatalogueConfig";
CREATE TABLE "ESCatalogueConfig"(
    "LetterYN" int,
    "LogoYN" int,
    "CompYN" int,
    "WebSite" varchar(250),
    "TollFree" varchar(250),
    "PrintStkYN" int,
    "ItemGrpYN" int,
    "ItemYN" int,
    "AliasYN" int,
    "ParamYN" int,
    "Colour" int,
    "SSize" int,
    pdffile image,
    "pdffileLogo" image
);

DROP TABLE IF EXISTS "ESCECommit";
CREATE TABLE "ESCECommit"(
    "ID" int IDENTITY(1,1) NOT NULL,
    "ActionDate" datetime,
    "FollowBy" varchar(50),
    "AccCode" int,
    "CommitAmt" float,
    "CommitDate" datetime,
    "RecAmount" float,
    "FollowUpDate" datetime,
    "FStatus" int,
    "CloseOn" datetime,
    "CloseBy" varchar(50)
);

DROP TABLE IF EXISTS "ESCECommitLog";
CREATE TABLE "ESCECommitLog"(
    "CID" int,
    "SubID" int IDENTITY(1,1) NOT NULL,
    "FollowType" int,
    "FollowBy" varchar(50),
    "ActionDate" datetime,
    "AccCode" int,
    "Commit" int,
    "CommitAmt" float,
    "CommitDate" datetime,
    "Rcvd" int,
    "RcvdDate" datetime,
    "RecAmount" float,
    "FollowUpDate" datetime,
    "Remarks" varchar(255),
    "FStatus" int,
    "CRemarks" varchar(100),
    "CloseOn" datetime,
    "CloseBy" varchar(50)
);

DROP TABLE IF EXISTS "ESCEEMailInfo";
CREATE TABLE "ESCEEMailInfo"(
    "Name" varchar(50),
    "C8" varchar(255),
    "C9" varchar(255),
    "C10" varchar(255),
    "C14" varchar(255),
    "I9" int
);

DROP TABLE IF EXISTS "ESCEMsgSendLog";
CREATE TABLE "ESCEMsgSendLog"(
    "Date" datetime,
    "SendType" int,
    "CompCode" varchar(50),
    "MsgType" int,
    "MasterType" int,
    "TemplateCode" int,
    "TemplateName" varchar(50),
    "PartyCode" int,
    "PartyName" varchar(50),
    "MsgCount" int,
    "DocCount" int
);

DROP TABLE IF EXISTS "ESCETaskDet";
CREATE TABLE "ESCETaskDet"(
    "TemplateCode" int,
    "TaskID" int,
    "SNo" int,
    "STaskName" varchar(100),
    "Frequency" int,
    "Sdt" datetime,
    "Days" int,
    "BUser" varchar(200),
    "Salesman" varchar(200),
    "OtherUser" varchar(200),
    "UpdateUser" varchar(200),
    "SStatus" int,
    "RMSg" text,
    "FMsg" text,
    "Completion" text,
    "Rdays" int,
    "RFrequency" int,
    "RTime" datetime,
    "FDays" int,
    "FFrequency" int,
    "FTime" datetime,
    "TaskDesc" text,
    "Responsibleuser" varchar(250)
);

DROP TABLE IF EXISTS "ESCETaskUser";
CREATE TABLE "ESCETaskUser"(
    "TemplateCode" int,
    "Rectype" int,
    "STaskID" int,
    "UserCode" int,
    "UserName" varchar(50)
);

DROP TABLE IF EXISTS "ESCompany";
CREATE TABLE "ESCompany"(
    "Name" varchar(50),
    "PrintName" varchar(50),
    "Address1" varchar(50),
    "Address2" varchar(50),
    "Address3" varchar(50),
    "Address4" varchar(50),
    "TelNo" varchar(100),
    "EMail" varchar(100),
    "ITPAN" varchar(50),
    "GSTNo" varchar(50),
    "BegFY" datetime,
    "CustomerID" varchar(60),
    "WebCustomerID" varchar(60)
);

DROP TABLE IF EXISTS "ESContactInfo";
CREATE TABLE "ESContactInfo"(
    "ID" int IDENTITY(1,1) NOT NULL,
    "ContactName" varchar(250),
    "Mobile" varchar(250),
    "City" varchar(250),
    "State" varchar(250),
    "Address" varchar(250),
    "Email" varchar(250),
    "Website" varchar(250),
    "GroupCode" int,
    "DOB" datetime,
    "DOA" datetime,
    "PartyName" varchar(200),
    "Category" varchar(100),
    "Rating" varchar(40),
    "Longitude" varchar(90),
    "Latitude" varchar(90),
    "Dtdate" datetime
);

DROP TABLE IF EXISTS "ESCouponCon";
CREATE TABLE "ESCouponCon"(
    "CouponAmt" float,
    "Format" int
);

DROP TABLE IF EXISTS "ESCouponConfig";
CREATE TABLE "ESCouponConfig"(
    "Prefix" varchar(50),
    "Suffix" varchar(50),
    "StartNo" int
);

DROP TABLE IF EXISTS "ESCouponDet";
CREATE TABLE "ESCouponDet"(
    "CustMobNo" varchar(50),
    "AutoCPNNo" int,
    "CPNNo" varchar(50),
    "ValidTill" datetime,
    "CPNType" varchar(50),
    "CPNValue" float,
    "Flag" int,
    "VchCode" int,
    "IVchCode" int
);

DROP TABLE IF EXISTS "ESCustDetConfig";
CREATE TABLE "ESCustDetConfig"(
    "MobNo" varchar(50),
    "CardNo" varchar(50),
    "Name" varchar(50),
    "ApplyDet" int,
    "DisOFInfo" int,
    "DisBDInfo" int,
    "CAcc" int,
    "AgrpCode" int,
    "DOBOF" varchar(20),
    "DOMOF" varchar(20),
    "OCRF" int,
    "WACRAPIFormat" varchar(50)
);

DROP TABLE IF EXISTS "ESCustomerDet";
CREATE TABLE "ESCustomerDet"(
    "CustMobNo" varchar(50),
    "CustType" int,
    "CustomerName" varchar(50),
    "Address1" varchar(50),
    "Address2" varchar(50),
    "Address3" varchar(50),
    "Address4" varchar(50),
    "EmailId" varchar(50),
    "BDStatus" int,
    "DOB" datetime,
    "Status" int,
    "DOA" datetime,
    "CRedPoint" int,
    "CRedGift" int,
    "CardNumber" varchar(50),
    "StateCode" int,
    "CCDate" datetime,
    "Validity" int,
    "VMonth" int,
    "VDate" datetime,
    "ValidityA" int,
    "VAmount" float,
    "AccCode" int,
    "LCustomer" int,
    "LDisc" float,
    "LDItem" int,
    "CardIssue" int,
    "IssueDate" datetime
);

DROP TABLE IF EXISTS "ESCustomerTypeMaster";
CREATE TABLE "ESCustomerTypeMaster"(
    "Code" int IDENTITY(1,1) NOT NULL,
    "CustomerType" varchar(50)
);

DROP TABLE IF EXISTS "ESCustTypeConfig";
CREATE TABLE "ESCustTypeConfig"(
    "SlabType" int,
    "SrNo" int,
    "FromAmt" float,
    "ToAmt" float,
    "CustType" int
);

DROP TABLE IF EXISTS "ESDMSScheduler";
CREATE TABLE "ESDMSScheduler"(
    "Rectype" int,
    "LastDt" datetime,
    "NextDt" datetime
);

DROP TABLE IF EXISTS "ESEmailConfigCL";
CREATE TABLE "ESEmailConfigCL"(
    "SenderID" varchar(50),
    "SenderPwd" varchar(50),
    "Name" varchar(50),
    "Server" varchar(50),
    "Port" varchar(50),
    "SSL" int,
    "SEmail" int
);

DROP TABLE IF EXISTS "ESGiftConfig";
CREATE TABLE "ESGiftConfig"(
    "SrNo" int,
    "GiftItem" int,
    "Points" float,
    "MaintainStock" int
);

DROP TABLE IF EXISTS "ESHappyCallDet";
CREATE TABLE "ESHappyCallDet"(
    "Code" int IDENTITY(1,1) NOT NULL,
    "HPDate" datetime,
    "VchCode" int,
    "Issue" int,
    "Description" text,
    "HPReminderDate" datetime
);

DROP TABLE IF EXISTS "ESHappyCallDone";
CREATE TABLE "ESHappyCallDone"(
    "VchCode" int,
    "HPDate" datetime,
    "Status" int
);

DROP TABLE IF EXISTS "ESImgInvAttachmetConfig";
CREATE TABLE "ESImgInvAttachmetConfig"(
    "ImgPath" varchar(255),
    "ImgPathTag" int
);

DROP TABLE IF EXISTS "ESIssueMaster";
CREATE TABLE "ESIssueMaster"(
    "Code" int IDENTITY(1,1) NOT NULL,
    "Issue" varchar(100)
);

DROP TABLE IF EXISTS "ESItemDetails";
CREATE TABLE "ESItemDetails"(
    "ICode" int,
    "IName" varchar(40),
    "IGCode" int,
    "IAlias" varchar(40),
    "Sprice" float,
    "PPrice" float,
    "DTDate" datetime
);

DROP TABLE IF EXISTS "ESItemImageTag";
CREATE TABLE "ESItemImageTag"(
    "Rectype" int,
    "Srno" int,
    "ItemCode" int,
    "Colour" varchar(50),
    "FileType" int,
    pdffile image
);

DROP TABLE IF EXISTS "ESKeyDetail";
CREATE TABLE "ESKeyDetail"(
    "AccessKey" varchar(250),
    "RefreshKey" varchar(250)
);

DROP TABLE IF EXISTS "ESLog";
CREATE TABLE "ESLog"(
    "DtDate" datetime,
    "MsgType" int,
    "PartyCode" int,
    "NoOfDoc" int,
    "RemindOrTran" int
);

DROP TABLE IF EXISTS "ESMatCenterWiseConfig";
CREATE TABLE "ESMatCenterWiseConfig"(
    "mCCode" int,
    "Mobile" varchar(200),
    "Email" varchar(200)
);

DROP TABLE IF EXISTS "ESOFConfigCL";
CREATE TABLE "ESOFConfigCL"(
    "Status" int,
    "OF" int,
    "OFValue" int
);

DROP TABLE IF EXISTS "ESOtherKeyDetail";
CREATE TABLE "ESOtherKeyDetail"(
    "FolderName" varchar(250),
    "FolderID" varchar(250)
);

DROP TABLE IF EXISTS "ESPathConfig";
CREATE TABLE "ESPathConfig"(
    "Path" varchar(255)
);

DROP TABLE IF EXISTS "ESPaymentCallDet";
CREATE TABLE "ESPaymentCallDet"(
    "Code" int IDENTITY(1,1) NOT NULL,
    "PRDate" datetime,
    "VchCode" int,
    "Reminder" int,
    "Description" text,
    "PReminderDate" datetime
);

DROP TABLE IF EXISTS "ESPaymentGateWayConfig";
CREATE TABLE "ESPaymentGateWayConfig"(
    "RecType" int,
    "EnablePGateWay" int,
    "EnvType" int,
    "SrNo" int,
    "CM1" int,
    "CM2" int,
    "C1" varchar(100),
    "C2" varchar(100),
    "C3" varchar(100),
    "C4" varchar(100),
    "C5" varchar(100)
);

DROP TABLE IF EXISTS "ESPExpAgeingConfig";
CREATE TABLE "ESPExpAgeingConfig"(
    srno int,
    "from" int,
    to int,
    "LSlab" int
);

DROP TABLE IF EXISTS "ESPointConfig";
CREATE TABLE "ESPointConfig"(
    "SrNo" int,
    "AgrpCode" int
);

DROP TABLE IF EXISTS "ESPointExpConfig";
CREATE TABLE "ESPointExpConfig"(
    "MPExpiry" int,
    "ExpType" int,
    "ExpDate" datetime,
    "ExpDays" int
);

DROP TABLE IF EXISTS "ESPointIgrpConfig";
CREATE TABLE "ESPointIgrpConfig"(
    "RecType" int,
    "AgrpCode" int,
    "SrNo" int,
    "CustType" int,
    "IgrpCode" int,
    "CValue" float,
    "ApplyValue" float
);

DROP TABLE IF EXISTS "ESPointRefDT";
CREATE TABLE "ESPointRefDT"(
    "CustMobNo" varchar(50),
    "VchType" int,
    "VchCode" int,
    "VchNo" varchar(50),
    "VchDate" datetime,
    "Rectype" int,
    "Points" float,
    "ItemCode" int,
    "DueDate" datetime,
    "Remarks" varchar(50),
    "Refcode" int
);

DROP TABLE IF EXISTS "ESPointRefDT2";
CREATE TABLE "ESPointRefDT2"(
    "CustMobNo" varchar(50),
    "VchType" int,
    "VchCode" int,
    "VchNo" varchar(50),
    "VchDate" datetime,
    "Rectype" int,
    "Points" float,
    "ItemCode" int,
    "DueDate" datetime,
    "Refcode" int
);

DROP TABLE IF EXISTS "ESPrintOfConfig";
CREATE TABLE "ESPrintOfConfig"(
    "Print" int,
    "PrevOF" int,
    "CurrOF" int,
    "RedOF" int,
    "CNCItem" int,
    "NCItem" int,
    "TotOF" int,
    "COF" int,
    "MOF" int,
    "CDPrint" int,
    "CPNDPrint" int,
    "CPNOF" int,
    "CRItem" int,
    "RItem" int,
    "DisableOF" int
);

DROP TABLE IF EXISTS "ESRedPointConfig";
CREATE TABLE "ESRedPointConfig"(
    "SrNo" int,
    "RedPoint" float,
    "CustType" int,
    "Amount" float,
    "ReqOTP" int,
    "MinPRed" float,
    "AutoRedPoint" int,
    "MinSRed" float,
    "AgrpCode" int
);

DROP TABLE IF EXISTS "ESRptData";
CREATE TABLE "ESRptData"(
    "Name" varchar(50),
    "RptID" int
);

DROP TABLE IF EXISTS "ESRptOpt";
CREATE TABLE "ESRptOpt"(
    "rptID" varchar(40),
    "AccCode" int,
    "Itemcode" int,
    "Mccode" int,
    "Fdt" datetime,
    "TDT" datetime,
    "Sdt" datetime,
    "ChkAcc" int,
    "ChkItem" int,
    "ChkMC" int,
    "ChkDt" int,
    "ChkSales" int,
    "SrNo" int,
    "ShowORD" int,
    "ShowZeroStk" int,
    "ShowUnapp" int,
    "ShowSum" int,
    "ShowAmt" int,
    "OFNo" int,
    "OFValue" varchar(40),
    "Interval" int
);

DROP TABLE IF EXISTS "ESSalesDT";
CREATE TABLE "ESSalesDT"(
    "CustMobNo" varchar(50),
    "VchType" int,
    "VchCode" int,
    "VchNo" varchar(50),
    "VchDate" datetime,
    "SalesValue" float,
    "Points" float,
    "RenewAmt" float
);

DROP TABLE IF EXISTS "ESSalesPointConfig";
CREATE TABLE "ESSalesPointConfig"(
    "SrNo" int,
    "Salesvalue" float,
    "CustType" int,
    "Points" float,
    "PointsApply" int,
    "AgrpCode" int
);

DROP TABLE IF EXISTS "ESScheduleCallInfo";
CREATE TABLE "ESScheduleCallInfo"(
    "RecType" int,
    "Date" datetime,
    "CallID" varchar(50),
    "CallSessionID" varchar(50),
    "AccCode" int,
    "AccName" varchar(50),
    "FollowUpType" int,
    "FollowUpID" int,
    "FollowUpSubID" int,
    "AgentName" varchar(50),
    "AgentNumber" varchar(50),
    "MobileNoTo" varchar(50),
    "CallType" varchar(100),
    "CallStatus" varchar(100),
    "DisConnectBy" varchar(50),
    "Ringing_Duration" int,
    "Call_Duration" int,
    "SessionId" varchar(100),
    "RecordingURL" varchar(150)
);

DROP TABLE IF EXISTS "ESSeriesConfig";
CREATE TABLE "ESSeriesConfig"(
    "Series" int,
    "VchType" int
);

DROP TABLE IF EXISTS "ESSMSAPIConfig";
CREATE TABLE "ESSMSAPIConfig"(
    "Format" varchar(100),
    "SSMS" int,
    "Mode" int,
    "Template" varchar(50),
    "PSSMS" int,
    "PFormat" varchar(50),
    "PTemplate" varchar(50),
    "SWA" int,
    "SWATemplate" varchar(50),
    "PWA" int,
    "PWATemplate" varchar(50),
    "SMSOTP" int,
    "OTPFormat" varchar(50),
    "WAOTP" int,
    "SWAInvoice" int,
    "SWAFormat" varchar(120),
    "PWAFormat" varchar(120),
    "WAOTPFormat" varchar(120),
    "AskforSend" int,
    "OTPDisable" int,
    "Attach" varchar(250),
    "Attach1" varchar(250)
);

DROP TABLE IF EXISTS "ESSMSAPIInvFormatconfig";
CREATE TABLE "ESSMSAPIInvFormatconfig"(
    "RecType" int,
    "SrNo" int,
    "SeriesCode" int,
    "FormatName" varchar(100)
);

DROP TABLE IF EXISTS "ESSubPartyConfig";
CREATE TABLE "ESSubPartyConfig"(
    "AccCode" int,
    "SrNo" int,
    "SubParty" varchar(50),
    "MobNo" varchar(50)
);

DROP TABLE IF EXISTS "ESSyncConfig";
CREATE TABLE "ESSyncConfig"(
    "RptName" int,
    "GrpCode" int,
    "SheetNm" varchar(40),
    "SheetID" varchar(100),
    "Fdt" datetime,
    "Tdt" datetime,
    "SubSheet" varchar(200),
    "rptID" varchar(200),
    "SrNo" int,
    "ShowZeroStk" int,
    "ExcelSheet" varchar(200),
    "ExcelSheetNm" varchar(200),
    "ExcelPath" varchar(200),
    "DType" int
);

DROP TABLE IF EXISTS "ESTargetConfig";
CREATE TABLE "ESTargetConfig"(
    "RecType" int,
    "Date" datetime,
    "SrNo" int,
    "TUserName" varchar(50),
    "Target" float,
    "AccCode" int,
    "AccStr" text
);

DROP TABLE IF EXISTS "ESTaskInfo";
CREATE TABLE "ESTaskInfo"(
    "ID" int IDENTITY(1,1) NOT NULL,
    "TaskId" int,
    "MasterType" int,
    "TaskName" varchar(100),
    "SubTaskID" int,
    "SubTaskName" varchar(100),
    "Date" datetime,
    "TaskDate" datetime,
    "Status" int,
    "CompletedOn" datetime,
    "CompletedBy" varchar(50),
    "CompletedRemarks" varchar(200),
    "MasterCode" int
);

DROP TABLE IF EXISTS "ESTemplateFormat";
CREATE TABLE "ESTemplateFormat"(
    "MasterType" int,
    "ColStr" varchar(50)
);

DROP TABLE IF EXISTS "ESUserContactConfig";
CREATE TABLE "ESUserContactConfig"(
    "Sno" int,
    "UserName" varchar(40),
    "Mobile" varchar(250),
    "Email" varchar(250)
);

DROP TABLE IF EXISTS "EsUsermaster";
CREATE TABLE "EsUsermaster"(
    "Code" int IDENTITY(1,1) NOT NULL,
    "MasterType" int,
    "Name" varchar(50),
    "MBNO" varchar(255),
    "Email" varchar(255)
);

DROP TABLE IF EXISTS "ESUserRights";
CREATE TABLE "ESUserRights"(
    "UserName" varchar(100),
    "RightType" varchar(250),
    "UserRight" int
);

DROP TABLE IF EXISTS "ESWAAPIVchConfig";
CREATE TABLE "ESWAAPIVchConfig"(
    "URL" varchar(100),
    "LUserName" varchar(50),
    "LPassword" varchar(50),
    "ChannelID" varchar(50),
    "ReceiverNo" varchar(50)
);

DROP TABLE IF EXISTS "EventLog";
CREATE TABLE "EventLog"(
    "UserName" nvarchar(20) NOT NULL,
    "Date" datetime NOT NULL,
    "WorkedOn" smallint NOT NULL,
    "Description" ntext NOT NULL,
    "UID" int NOT NULL,
    "ComputerName" nvarchar(40) NOT NULL,
    "VersionNo" nvarchar(40) NOT NULL,
    "S1" nvarchar(255) NOT NULL,
    "SessionId" int NOT NULL
);
CREATE INDEX 01 ON "EventLog"("UserName");
CREATE INDEX 02 ON "EventLog"("Date");
CREATE INDEX 03 ON "EventLog"("WorkedOn");
CREATE INDEX 04 ON "EventLog"("UID");
CREATE INDEX 05 ON "EventLog"("SessionId");
ALTER TABLE "dbo"."EventLog" ADD CONSTRAINT DF_EventLog_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."EventLog" ADD CONSTRAINT DF_EventLog_"WorkedOn" DEFAULT ((0)) FOR "WorkedOn";
ALTER TABLE "dbo"."EventLog" ADD CONSTRAINT DF_EventLog_"UID" DEFAULT ((0)) FOR "UID";
ALTER TABLE "dbo"."EventLog" ADD CONSTRAINT DF_EventLog_"SessionId" DEFAULT ((0)) FOR "SessionId";

DROP TABLE IF EXISTS "Excise";
CREATE TABLE "Excise"(
    "RecType" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "DocName" nvarchar(40) NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "SrNo" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "Value" float NOT NULL,
    "Balance" float NOT NULL,
    "Value1" float NOT NULL,
    "Balance1" float NOT NULL,
    "Value2" float NOT NULL,
    "Balance2" float NOT NULL,
    "Value3" float NOT NULL,
    "Value4" float NOT NULL,
    "Value5" float NOT NULL,
    "ValueType" smallint NOT NULL,
    "SupplierType" smallint NOT NULL,
    "ChallanNo" nvarchar(40) NOT NULL,
    "BankCode" nvarchar(20) NOT NULL,
    "DateOfDeposit" datetime NOT NULL,
    "PeriodEnding" datetime NOT NULL,
    "Dummy" smallint NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "BranchCode" int NOT NULL,
    "ClearanceType" smallint NOT NULL,
    "NotificationAvailed" nvarchar(255) NOT NULL,
    "NotificationNo" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "Excise"("RecType","VchCode");
CREATE INDEX 02 ON "Excise"("RecType","Date","ValueType","VchNo","VchCode");
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Value" DEFAULT ((0)) FOR "Value";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Balance" DEFAULT ((0)) FOR "Balance";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Balance1" DEFAULT ((0)) FOR "Balance1";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Balance2" DEFAULT ((0)) FOR "Balance2";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Value3" DEFAULT ((0)) FOR "Value3";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Value4" DEFAULT ((0)) FOR "Value4";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Value5" DEFAULT ((0)) FOR "Value5";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"ValueType" DEFAULT ((0)) FOR "ValueType";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"SupplierType" DEFAULT ((0)) FOR "SupplierType";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"DateOfDeposit" DEFAULT '((0))' FOR "DateOfDeposit";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"PeriodEnding" DEFAULT '((0))' FOR "PeriodEnding";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"Dummy" DEFAULT ((0)) FOR "Dummy";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"BranchCode" DEFAULT ((0)) FOR "BranchCode";
ALTER TABLE "dbo"."Excise" ADD CONSTRAINT DF_Excise_"ClearanceType" DEFAULT ((0)) FOR "ClearanceType";

DROP TABLE IF EXISTS "ExternalData";
CREATE TABLE "ExternalData"(
    "KeyType" smallint NOT NULL,
    "KeyCode" int NOT NULL,
    "AppName" nvarchar(20) NOT NULL,
    "CanEditKeyData" bit NOT NULL,
    "CanDeleteKeyData" bit NOT NULL,
    "I1" smallint NOT NULL,
    "L1" int NOT NULL,
    "D1" float NOT NULL,
    "B1" bit NOT NULL,
    "DT1" datetime NOT NULL,
    "C1" nvarchar(20) NOT NULL,
    "Connected" bit NOT NULL,
    "ConnectedCode" int NOT NULL,
    "WarningType" smallint NOT NULL,
    "C2" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "ExternalData"("KeyType","KeyCode");
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"KeyType" DEFAULT ((0)) FOR "KeyType";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"KeyCode" DEFAULT ((0)) FOR "KeyCode";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"CanEditKeyData" DEFAULT '((0))' FOR "CanEditKeyData";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"CanDeleteKeyData" DEFAULT '((0))' FOR "CanDeleteKeyData";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"L1" DEFAULT ((0)) FOR "L1";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"DT1" DEFAULT '((0))' FOR "DT1";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"Connected" DEFAULT '((0))' FOR "Connected";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"ConnectedCode" DEFAULT ((0)) FOR "ConnectedCode";
ALTER TABLE "dbo"."ExternalData" ADD CONSTRAINT DF_ExternalData_"WarningType" DEFAULT ((0)) FOR "WarningType";

DROP TABLE IF EXISTS "Folio1";
CREATE TABLE "Folio1"(
    "MasterCode" int NOT NULL,
    "MasterType" smallint NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "D7" float NOT NULL,
    "D8" float NOT NULL,
    "D9" float NOT NULL,
    "D10" float NOT NULL,
    "D11" float NOT NULL,
    "D12" float NOT NULL,
    "D13" float NOT NULL,
    "D14" float NOT NULL,
    "D15" float NOT NULL,
    "D16" float NOT NULL,
    "D17" float NOT NULL,
    "D18" float NOT NULL,
    "D19" float NOT NULL,
    "D20" float NOT NULL,
    "D21" float NOT NULL,
    "D22" float NOT NULL,
    "D23" float NOT NULL,
    "D24" float NOT NULL,
    "D25" float NOT NULL,
    "D26" float NOT NULL,
    "D27" float NOT NULL,
    "D28" float NOT NULL,
    "D29" float NOT NULL,
    "D30" float NOT NULL,
    "D31" float NOT NULL,
    "D32" float NOT NULL,
    "D33" float NOT NULL,
    "D34" float NOT NULL,
    "D35" float NOT NULL,
    "D36" float NOT NULL,
    "D37" float NOT NULL,
    "D38" float NOT NULL,
    "D39" float NOT NULL,
    "D40" float NOT NULL,
    "D41" float NOT NULL,
    "D42" float NOT NULL,
    "D43" float NOT NULL,
    "D44" float NOT NULL,
    "D45" float NOT NULL,
    "D46" float NOT NULL,
    "D47" float NOT NULL,
    "D48" float NOT NULL,
    "D49" float NOT NULL,
    "D50" float NOT NULL,
    "D51" float NOT NULL,
    "D52" float NOT NULL,
    "D53" float NOT NULL,
    "D54" float NOT NULL,
    "D55" float NOT NULL,
    "D56" float NOT NULL,
    "D57" float NOT NULL,
    "D58" float NOT NULL,
    "D59" float NOT NULL,
    "D60" float NOT NULL,
    "D61" float NOT NULL,
    "D62" float NOT NULL,
    "D63" float NOT NULL,
    "D64" float NOT NULL,
    "D65" float NOT NULL,
    "D66" float NOT NULL,
    "D67" float NOT NULL,
    "D68" float NOT NULL,
    "D69" float NOT NULL,
    "D70" float NOT NULL,
    "D71" float NOT NULL,
    "D72" float NOT NULL,
    "D73" float NOT NULL,
    "D74" float NOT NULL,
    "D75" float NOT NULL,
    "D76" float NOT NULL,
    "D77" float NOT NULL,
    "D78" float NOT NULL,
    "D79" float NOT NULL,
    "D80" float NOT NULL,
    "D81" float NOT NULL,
    "D82" float NOT NULL,
    "D83" float NOT NULL,
    "D84" float NOT NULL,
    "D85" float NOT NULL,
    "D86" float NOT NULL,
    "D87" float NOT NULL,
    "D88" float NOT NULL,
    "D89" float NOT NULL,
    "D90" float NOT NULL,
    "D91" float NOT NULL,
    "D92" float NOT NULL,
    "D93" float NOT NULL,
    "D94" float NOT NULL,
    "D95" float NOT NULL,
    "D96" float NOT NULL,
    "D97" float NOT NULL,
    "D98" float NOT NULL,
    "D99" float NOT NULL,
    "D100" float NOT NULL,
    "D101" float NOT NULL,
    "D102" float NOT NULL,
    "D103" float NOT NULL,
    "D104" float NOT NULL,
    "D105" float NOT NULL,
    "D106" float NOT NULL,
    "D107" float NOT NULL,
    "D108" float NOT NULL,
    "D109" float NOT NULL,
    "D110" float NOT NULL,
    "D111" float NOT NULL,
    "D112" float NOT NULL,
    "D113" float NOT NULL,
    "D114" float NOT NULL,
    "D115" float NOT NULL,
    "D116" float NOT NULL,
    "D117" float NOT NULL,
    "D118" float NOT NULL,
    "D119" float NOT NULL,
    "D120" float NOT NULL,
    "D121" float NOT NULL,
    "D122" float NOT NULL,
    "D123" float NOT NULL,
    "D124" float NOT NULL,
    "D125" float NOT NULL,
    "D126" float NOT NULL,
    "D127" float NOT NULL,
    "D128" float NOT NULL,
    "D129" float NOT NULL,
    "D130" float NOT NULL,
    "D131" float NOT NULL,
    "D132" float NOT NULL,
    "D133" float NOT NULL,
    "D134" float NOT NULL,
    "D135" float NOT NULL,
    "D136" float NOT NULL,
    "D137" float NOT NULL,
    "D138" float NOT NULL,
    "D139" float NOT NULL,
    "D140" float NOT NULL,
    "D141" float NOT NULL,
    "D142" float NOT NULL,
    "D143" float NOT NULL,
    "D144" float NOT NULL,
    "D145" float NOT NULL,
    "D146" float NOT NULL,
    "D147" float NOT NULL,
    "D148" float NOT NULL,
    "D149" float NOT NULL,
    "D150" float NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "B6" bit NOT NULL,
    "B7" bit NOT NULL,
    "B8" bit NOT NULL,
    "B9" bit NOT NULL,
    "B10" bit NOT NULL,
    "B11" bit NOT NULL,
    "B12" bit NOT NULL
);
CREATE INDEX 01 ON "Folio1"("MasterCode");
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"MasterCode" DEFAULT ((0)) FOR "MasterCode";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"MasterType" DEFAULT ((0)) FOR "MasterType";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D7" DEFAULT ((0)) FOR "D7";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D8" DEFAULT ((0)) FOR "D8";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D9" DEFAULT ((0)) FOR "D9";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D10" DEFAULT ((0)) FOR "D10";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D11" DEFAULT ((0)) FOR "D11";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D12" DEFAULT ((0)) FOR "D12";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D13" DEFAULT ((0)) FOR "D13";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D14" DEFAULT ((0)) FOR "D14";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D15" DEFAULT ((0)) FOR "D15";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D16" DEFAULT ((0)) FOR "D16";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D17" DEFAULT ((0)) FOR "D17";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D18" DEFAULT ((0)) FOR "D18";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D19" DEFAULT ((0)) FOR "D19";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D20" DEFAULT ((0)) FOR "D20";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D21" DEFAULT ((0)) FOR "D21";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D22" DEFAULT ((0)) FOR "D22";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D23" DEFAULT ((0)) FOR "D23";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D24" DEFAULT ((0)) FOR "D24";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D25" DEFAULT ((0)) FOR "D25";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D26" DEFAULT ((0)) FOR "D26";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D27" DEFAULT ((0)) FOR "D27";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D28" DEFAULT ((0)) FOR "D28";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D29" DEFAULT ((0)) FOR "D29";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D30" DEFAULT ((0)) FOR "D30";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D31" DEFAULT ((0)) FOR "D31";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D32" DEFAULT ((0)) FOR "D32";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D33" DEFAULT ((0)) FOR "D33";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D34" DEFAULT ((0)) FOR "D34";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D35" DEFAULT ((0)) FOR "D35";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D36" DEFAULT ((0)) FOR "D36";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D37" DEFAULT ((0)) FOR "D37";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D38" DEFAULT ((0)) FOR "D38";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D39" DEFAULT ((0)) FOR "D39";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D40" DEFAULT ((0)) FOR "D40";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D41" DEFAULT ((0)) FOR "D41";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D42" DEFAULT ((0)) FOR "D42";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D43" DEFAULT ((0)) FOR "D43";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D44" DEFAULT ((0)) FOR "D44";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D45" DEFAULT ((0)) FOR "D45";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D46" DEFAULT ((0)) FOR "D46";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D47" DEFAULT ((0)) FOR "D47";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D48" DEFAULT ((0)) FOR "D48";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D49" DEFAULT ((0)) FOR "D49";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D50" DEFAULT ((0)) FOR "D50";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D51" DEFAULT ((0)) FOR "D51";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D52" DEFAULT ((0)) FOR "D52";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D53" DEFAULT ((0)) FOR "D53";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D54" DEFAULT ((0)) FOR "D54";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D55" DEFAULT ((0)) FOR "D55";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D56" DEFAULT ((0)) FOR "D56";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D57" DEFAULT ((0)) FOR "D57";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D58" DEFAULT ((0)) FOR "D58";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D59" DEFAULT ((0)) FOR "D59";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D60" DEFAULT ((0)) FOR "D60";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D61" DEFAULT ((0)) FOR "D61";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D62" DEFAULT ((0)) FOR "D62";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D63" DEFAULT ((0)) FOR "D63";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D64" DEFAULT ((0)) FOR "D64";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D65" DEFAULT ((0)) FOR "D65";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D66" DEFAULT ((0)) FOR "D66";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D67" DEFAULT ((0)) FOR "D67";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D68" DEFAULT ((0)) FOR "D68";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D69" DEFAULT ((0)) FOR "D69";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D70" DEFAULT ((0)) FOR "D70";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D71" DEFAULT ((0)) FOR "D71";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D72" DEFAULT ((0)) FOR "D72";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D73" DEFAULT ((0)) FOR "D73";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D74" DEFAULT ((0)) FOR "D74";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D75" DEFAULT ((0)) FOR "D75";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D76" DEFAULT ((0)) FOR "D76";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D77" DEFAULT ((0)) FOR "D77";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D78" DEFAULT ((0)) FOR "D78";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D79" DEFAULT ((0)) FOR "D79";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D80" DEFAULT ((0)) FOR "D80";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D81" DEFAULT ((0)) FOR "D81";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D82" DEFAULT ((0)) FOR "D82";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D83" DEFAULT ((0)) FOR "D83";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D84" DEFAULT ((0)) FOR "D84";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D85" DEFAULT ((0)) FOR "D85";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D86" DEFAULT ((0)) FOR "D86";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D87" DEFAULT ((0)) FOR "D87";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D88" DEFAULT ((0)) FOR "D88";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D89" DEFAULT ((0)) FOR "D89";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D90" DEFAULT ((0)) FOR "D90";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D91" DEFAULT ((0)) FOR "D91";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D92" DEFAULT ((0)) FOR "D92";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D93" DEFAULT ((0)) FOR "D93";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D94" DEFAULT ((0)) FOR "D94";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D95" DEFAULT ((0)) FOR "D95";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D96" DEFAULT ((0)) FOR "D96";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D97" DEFAULT ((0)) FOR "D97";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D98" DEFAULT ((0)) FOR "D98";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D99" DEFAULT ((0)) FOR "D99";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D100" DEFAULT ((0)) FOR "D100";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D101" DEFAULT ((0)) FOR "D101";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D102" DEFAULT ((0)) FOR "D102";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D103" DEFAULT ((0)) FOR "D103";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D104" DEFAULT ((0)) FOR "D104";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D105" DEFAULT ((0)) FOR "D105";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D106" DEFAULT ((0)) FOR "D106";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D107" DEFAULT ((0)) FOR "D107";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D108" DEFAULT ((0)) FOR "D108";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D109" DEFAULT ((0)) FOR "D109";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D110" DEFAULT ((0)) FOR "D110";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D111" DEFAULT ((0)) FOR "D111";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D112" DEFAULT ((0)) FOR "D112";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D113" DEFAULT ((0)) FOR "D113";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D114" DEFAULT ((0)) FOR "D114";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D115" DEFAULT ((0)) FOR "D115";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D116" DEFAULT ((0)) FOR "D116";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D117" DEFAULT ((0)) FOR "D117";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D118" DEFAULT ((0)) FOR "D118";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D119" DEFAULT ((0)) FOR "D119";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D120" DEFAULT ((0)) FOR "D120";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D121" DEFAULT ((0)) FOR "D121";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D122" DEFAULT ((0)) FOR "D122";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D123" DEFAULT ((0)) FOR "D123";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D124" DEFAULT ((0)) FOR "D124";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D125" DEFAULT ((0)) FOR "D125";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D126" DEFAULT ((0)) FOR "D126";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D127" DEFAULT ((0)) FOR "D127";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D128" DEFAULT ((0)) FOR "D128";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D129" DEFAULT ((0)) FOR "D129";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D130" DEFAULT ((0)) FOR "D130";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D131" DEFAULT ((0)) FOR "D131";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D132" DEFAULT ((0)) FOR "D132";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D133" DEFAULT ((0)) FOR "D133";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D134" DEFAULT ((0)) FOR "D134";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D135" DEFAULT ((0)) FOR "D135";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D136" DEFAULT ((0)) FOR "D136";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D137" DEFAULT ((0)) FOR "D137";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D138" DEFAULT ((0)) FOR "D138";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D139" DEFAULT ((0)) FOR "D139";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D140" DEFAULT ((0)) FOR "D140";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D141" DEFAULT ((0)) FOR "D141";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D142" DEFAULT ((0)) FOR "D142";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D143" DEFAULT ((0)) FOR "D143";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D144" DEFAULT ((0)) FOR "D144";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D145" DEFAULT ((0)) FOR "D145";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D146" DEFAULT ((0)) FOR "D146";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D147" DEFAULT ((0)) FOR "D147";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D148" DEFAULT ((0)) FOR "D148";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D149" DEFAULT ((0)) FOR "D149";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"D150" DEFAULT ((0)) FOR "D150";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B6" DEFAULT '((0))' FOR "B6";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B7" DEFAULT '((0))' FOR "B7";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B8" DEFAULT '((0))' FOR "B8";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B9" DEFAULT '((0))' FOR "B9";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B10" DEFAULT '((0))' FOR "B10";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B11" DEFAULT '((0))' FOR "B11";
ALTER TABLE "dbo"."Folio1" ADD CONSTRAINT DF_Folio1_"B12" DEFAULT '((0))' FOR "B12";

DROP TABLE IF EXISTS "GetGeneratedEWayBillDet";
CREATE TABLE "GetGeneratedEWayBillDet"(
    "GenByGSTIN" nvarchar(255) NOT NULL,
    "EWayBillNo" nvarchar(255) NOT NULL,
    "EWayBillDate" datetime NOT NULL,
    "DocNo" nvarchar(255) NOT NULL,
    "DocDate" datetime NOT NULL,
    "FromGSTIN" nvarchar(255) NOT NULL,
    "FromTradeName" nvarchar(255) NOT NULL,
    "ToGSTIN" nvarchar(255) NOT NULL,
    "ToTradeName" nvarchar(255) NOT NULL,
    "InvValue" float NOT NULL,
    "HSNCode" nvarchar(255) NOT NULL,
    "HSNDesc" nvarchar(255) NOT NULL,
    "Date1" datetime NOT NULL,
    "RecType" smallint NOT NULL,
    "DeliveryPincode" nvarchar(255) NOT NULL,
    "DeliveryPlace" nvarchar(255) NOT NULL,
    "DeliveryStateCode" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "GetGeneratedEWayBillDet"("EWayBillNo");
CREATE INDEX 02 ON "GetGeneratedEWayBillDet"("EWayBillDate");
ALTER TABLE "dbo"."GetGeneratedEWayBillDet" ADD CONSTRAINT DF_GetGeneratedEWayBillDet_"EWayBillDate" DEFAULT '((0))' FOR "EWayBillDate";
ALTER TABLE "dbo"."GetGeneratedEWayBillDet" ADD CONSTRAINT DF_GetGeneratedEWayBillDet_"DocDate" DEFAULT '((0))' FOR "DocDate";
ALTER TABLE "dbo"."GetGeneratedEWayBillDet" ADD CONSTRAINT DF_GetGeneratedEWayBillDet_"InvValue" DEFAULT ((0)) FOR "InvValue";
ALTER TABLE "dbo"."GetGeneratedEWayBillDet" ADD CONSTRAINT DF_GetGeneratedEWayBillDet_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."GetGeneratedEWayBillDet" ADD CONSTRAINT DF_GetGeneratedEWayBillDet_"RecType" DEFAULT ((0)) FOR "RecType";

DROP TABLE IF EXISTS "GSTInfo";
CREATE TABLE "GSTInfo"(
    "Date" datetime NOT NULL,
    "Amount" float NOT NULL,
    "RecType" smallint NOT NULL,
    "Type" smallint NOT NULL,
    "SrNo" smallint NOT NULL,
    "Description" nvarchar(255) NOT NULL,
    "VchCode" int NOT NULL,
    "I1" smallint NOT NULL,
    "ChallanNo" nvarchar(255) NOT NULL,
    "ChallanDate" datetime NOT NULL,
    "ChequeNo" nvarchar(255) NOT NULL,
    "ChequeDate" datetime NOT NULL,
    "BankName" nvarchar(255) NOT NULL,
    "BankCode" nvarchar(255) NOT NULL,
    "Interest" float NOT NULL,
    "Penalty" float NOT NULL,
    "BankAcType" nvarchar(255) NOT NULL,
    "BankAcNo" nvarchar(255) NOT NULL,
    "CGSTPercent" float NOT NULL,
    "SGSTPercent" float NOT NULL,
    "IGSTPercent" float NOT NULL,
    "CessPercent" float NOT NULL,
    "ACessPercent" float NOT NULL,
    "CGSTAmt" float NOT NULL,
    "SGSTAmt" float NOT NULL,
    "IGSTAmt" float NOT NULL,
    "CessAmt" float NOT NULL,
    "ACessAmt" float NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "D7" float NOT NULL,
    "D8" float NOT NULL,
    "D9" float NOT NULL,
    "D10" float NOT NULL,
    "D11" float NOT NULL,
    "D12" float NOT NULL,
    "D13" float NOT NULL,
    "D14" float NOT NULL,
    "D15" float NOT NULL,
    "LateFee" float NOT NULL
);
CREATE INDEX 01 ON "GSTInfo"("Date");
CREATE INDEX 02 ON "GSTInfo"("VchCode");
CREATE INDEX 03 ON "GSTInfo"("RecType");
CREATE INDEX 04 ON "GSTInfo"("RecType");
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"Amount" DEFAULT ((0)) FOR "Amount";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"ChallanDate" DEFAULT '((0))' FOR "ChallanDate";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"ChequeDate" DEFAULT '((0))' FOR "ChequeDate";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"Interest" DEFAULT ((0)) FOR "Interest";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"Penalty" DEFAULT ((0)) FOR "Penalty";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"CGSTPercent" DEFAULT ((0)) FOR "CGSTPercent";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"SGSTPercent" DEFAULT ((0)) FOR "SGSTPercent";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"IGSTPercent" DEFAULT ((0)) FOR "IGSTPercent";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"CessPercent" DEFAULT ((0)) FOR "CessPercent";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"ACessPercent" DEFAULT ((0)) FOR "ACessPercent";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"CGSTAmt" DEFAULT ((0)) FOR "CGSTAmt";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"SGSTAmt" DEFAULT ((0)) FOR "SGSTAmt";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"IGSTAmt" DEFAULT ((0)) FOR "IGSTAmt";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"ACessAmt" DEFAULT ((0)) FOR "ACessAmt";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D7" DEFAULT ((0)) FOR "D7";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D8" DEFAULT ((0)) FOR "D8";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D9" DEFAULT ((0)) FOR "D9";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D10" DEFAULT ((0)) FOR "D10";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D11" DEFAULT ((0)) FOR "D11";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D12" DEFAULT ((0)) FOR "D12";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D13" DEFAULT ((0)) FOR "D13";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D14" DEFAULT ((0)) FOR "D14";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"D15" DEFAULT ((0)) FOR "D15";
ALTER TABLE "dbo"."GSTInfo" ADD CONSTRAINT DF_GSTInfo_"LateFee" DEFAULT ((0)) FOR "LateFee";

DROP TABLE IF EXISTS "GSTITCPendingVchDet";
CREATE TABLE "GSTITCPendingVchDet"(
    "VchCode" int NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "ItemCode" int NOT NULL,
    "ItemSrNo" smallint NOT NULL,
    "TaxCatCode" int NOT NULL,
    "STPTCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "RecType" smallint NOT NULL,
    "LocType" smallint NOT NULL,
    "Date1" datetime NOT NULL,
    "VchDate" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "PartyName" nvarchar(40) NOT NULL,
    "GSTIN" nvarchar(30) NOT NULL,
    "HSNCode" nvarchar(255) NOT NULL,
    "SENo" nvarchar(255) NOT NULL,
    "PartyStateTinDigit" nvarchar(255) NOT NULL,
    "PartyStateCode" int NOT NULL,
    "BDStateTinDigit" nvarchar(255) NOT NULL,
    "BDStateCode" int NOT NULL,
    "ActualSaleAmt" float NOT NULL,
    "TaxableAmt" float NOT NULL,
    "TaxRate" float NOT NULL,
    "TaxRate1" float NOT NULL,
    "TaxAmt" float NOT NULL,
    "TaxAmt1" float NOT NULL,
    "CessRate" float NOT NULL,
    "CessAmt" float NOT NULL,
    "AddCessRate" float NOT NULL,
    "AddCessAmt" float NOT NULL,
    "StateCessRate" float NOT NULL,
    "StateCessAmt" float NOT NULL,
    "ZeroTaxType" smallint NOT NULL,
    "TaxOnMRP" bit NOT NULL,
    "ItemMainQty" float NOT NULL,
    "ItemAltQty" float NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "GSTRepBasis" smallint NOT NULL,
    "TypeOfDealer" smallint NOT NULL,
    "POSStateTinDigit" nvarchar(255) NOT NULL,
    "POSStateCode" int NOT NULL,
    "D1" float NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "ITCClaimedStatus" smallint NOT NULL,
    "ITCClaimedMonth" smallint NOT NULL,
    "OrgVchNo" nvarchar(255) NOT NULL,
    "OrgVchDate" datetime NOT NULL,
    "GSTR2BStatus" smallint NOT NULL,
    "GSTR2BMonth" smallint NOT NULL,
    "GSTR2BYear" smallint NOT NULL
);
CREATE INDEX 01 ON "GSTITCPendingVchDet"("GSTIN");
CREATE INDEX 02 ON "GSTITCPendingVchDet"("VchNo");
CREATE INDEX 03 ON "GSTITCPendingVchDet"("VchDate");
CREATE INDEX 04 ON "GSTITCPendingVchDet"("ITCClaimedStatus");
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"ItemCode" DEFAULT ((0)) FOR "ItemCode";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"ItemSrNo" DEFAULT ((0)) FOR "ItemSrNo";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"TaxCatCode" DEFAULT ((0)) FOR "TaxCatCode";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"STPTCode" DEFAULT ((0)) FOR "STPTCode";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"LocType" DEFAULT ((0)) FOR "LocType";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"VchDate" DEFAULT '((0))' FOR "VchDate";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"PartyStateCode" DEFAULT ((0)) FOR "PartyStateCode";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"BDStateCode" DEFAULT ((0)) FOR "BDStateCode";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"ActualSaleAmt" DEFAULT ((0)) FOR "ActualSaleAmt";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"TaxRate" DEFAULT ((0)) FOR "TaxRate";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"TaxRate1" DEFAULT ((0)) FOR "TaxRate1";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"TaxAmt" DEFAULT ((0)) FOR "TaxAmt";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"TaxAmt1" DEFAULT ((0)) FOR "TaxAmt1";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"CessRate" DEFAULT ((0)) FOR "CessRate";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"AddCessRate" DEFAULT ((0)) FOR "AddCessRate";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"AddCessAmt" DEFAULT ((0)) FOR "AddCessAmt";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"StateCessRate" DEFAULT ((0)) FOR "StateCessRate";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"StateCessAmt" DEFAULT ((0)) FOR "StateCessAmt";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"ZeroTaxType" DEFAULT ((0)) FOR "ZeroTaxType";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"TaxOnMRP" DEFAULT '((0))' FOR "TaxOnMRP";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"ItemMainQty" DEFAULT ((0)) FOR "ItemMainQty";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"ItemAltQty" DEFAULT ((0)) FOR "ItemAltQty";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"GSTRepBasis" DEFAULT ((0)) FOR "GSTRepBasis";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"TypeOfDealer" DEFAULT ((0)) FOR "TypeOfDealer";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"POSStateCode" DEFAULT ((0)) FOR "POSStateCode";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"ITCClaimedStatus" DEFAULT ((0)) FOR "ITCClaimedStatus";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"ITCClaimedMonth" DEFAULT ((0)) FOR "ITCClaimedMonth";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"OrgVchDate" DEFAULT '((0))' FOR "OrgVchDate";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"GSTR2BStatus" DEFAULT ((0)) FOR "GSTR2BStatus";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"GSTR2BMonth" DEFAULT ((0)) FOR "GSTR2BMonth";
ALTER TABLE "dbo"."GSTITCPendingVchDet" ADD CONSTRAINT DF_GSTITCPendingVchDet_"GSTR2BYear" DEFAULT ((0)) FOR "GSTR2BYear";

DROP TABLE IF EXISTS "GSTR1Info";
CREATE TABLE "GSTR1Info"(
    "RecType" smallint NOT NULL,
    "TranType" smallint NOT NULL,
    "Month" smallint NOT NULL,
    "Year" nvarchar(255) NOT NULL,
    "SrNo" smallint NOT NULL,
    "GSTIN" nvarchar(255) NOT NULL,
    "CompGSTIN" nvarchar(255) NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "CrDate" datetime NOT NULL,
    "CrNo" nvarchar(25) NOT NULL,
    "InvType" nvarchar(255) NOT NULL,
    updby nvarchar(255) NOT NULL,
    "CheckSum" nvarchar(255) NOT NULL,
    "TotalAmt" float NOT NULL,
    "TaxableAmt" float NOT NULL,
    "Rate" float NOT NULL,
    "CGST" float NOT NULL,
    "SGST" float NOT NULL,
    "IGST" float NOT NULL,
    "CessAmt" float NOT NULL,
    "POS" nvarchar(25) NOT NULL,
    cfs bit NOT NULL,
    "cName" nvarchar(255) NOT NULL,
    flag nvarchar(10) NOT NULL,
    rchrg bit NOT NULL,
    "cFlag" bit NOT NULL,
    uqc nvarchar(10) NOT NULL,
    qty float NOT NULL,
    hsnsc nvarchar(255) NOT NULL,
    "Desc" nvarchar(255) NOT NULL,
    "pGST" bit NOT NULL,
    "SupplyType" nvarchar(255) NOT NULL,
    "Type" nvarchar(255) NOT NULL,
    "Cancel" int NOT NULL,
    num int NOT NULL,
    totnum int NOT NULL,
    "Docfrom" nvarchar(255) NOT NULL,
    "DocTo" nvarchar(255) NOT NULL,
    netissue int NOT NULL,
    docnum int NOT NULL,
    "filDate" datetime NOT NULL,
    "filType" nvarchar(255) NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "M1" ntext NOT NULL,
    "ReportType" smallint NOT NULL,
    "C3" nvarchar(255) NOT NULL,
    "C4" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "GSTR1Info"("GSTIN");
CREATE INDEX 02 ON "GSTR1Info"("VchNo");
CREATE INDEX 03 ON "GSTR1Info"("Date");
CREATE INDEX 04 ON "GSTR1Info"("Month");
CREATE INDEX 05 ON "GSTR1Info"("Year");
CREATE INDEX 06 ON "GSTR1Info"("ReportType");
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"Month" DEFAULT ((0)) FOR "Month";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"CrDate" DEFAULT '((0))' FOR "CrDate";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"TotalAmt" DEFAULT ((0)) FOR "TotalAmt";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"Rate" DEFAULT ((0)) FOR "Rate";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"CGST" DEFAULT ((0)) FOR "CGST";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"SGST" DEFAULT ((0)) FOR "SGST";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"IGST" DEFAULT ((0)) FOR "IGST";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_cfs DEFAULT '((0))' FOR cfs;
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_rchrg DEFAULT '((0))' FOR rchrg;
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"cFlag" DEFAULT '((0))' FOR "cFlag";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_qty DEFAULT ((0)) FOR qty;
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"pGST" DEFAULT '((0))' FOR "pGST";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"Cancel" DEFAULT ((0)) FOR "Cancel";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_num DEFAULT ((0)) FOR num;
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_totnum DEFAULT ((0)) FOR totnum;
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_netissue DEFAULT ((0)) FOR netissue;
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_docnum DEFAULT ((0)) FOR docnum;
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"filDate" DEFAULT '((0))' FOR "filDate";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"Date2" DEFAULT '((0))' FOR "Date2";
ALTER TABLE "dbo"."GSTR1Info" ADD CONSTRAINT DF_GSTR1Info_"ReportType" DEFAULT ((0)) FOR "ReportType";

DROP TABLE IF EXISTS "GSTR2AInfo";
CREATE TABLE "GSTR2AInfo"(
    "RecType" smallint NOT NULL,
    "TranType" smallint NOT NULL,
    "Month" smallint NOT NULL,
    "Year" nvarchar(255) NOT NULL,
    "SrNo" int NOT NULL,
    "GSTIN" nvarchar(255) NOT NULL,
    "CompGSTIN" nvarchar(255) NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "OrgDate" datetime NOT NULL,
    "OrgVchNo" nvarchar(25) NOT NULL,
    "InvType" nvarchar(255) NOT NULL,
    updby nvarchar(255) NOT NULL,
    "CheckSum" nvarchar(255) NOT NULL,
    "TotalAmt" float NOT NULL,
    "TaxableAmt" float NOT NULL,
    "Rate" float NOT NULL,
    "CGST" float NOT NULL,
    "SGST" float NOT NULL,
    "IGST" float NOT NULL,
    "CessAmt" float NOT NULL,
    "ITCCGST" float NOT NULL,
    "ITCSGST" float NOT NULL,
    "ITCIGST" float NOT NULL,
    "ITCCessAmt" float NOT NULL,
    "ITCElg" nvarchar(20) NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "POS" smallint NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "CFS" bit NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "Reason" nvarchar(255) NOT NULL,
    "Type" nvarchar(20) NOT NULL,
    "NoteNo" nvarchar(255) NOT NULL,
    "NoteDate" datetime NOT NULL,
    "DiffPercent" float NOT NULL,
    "ITCAvl" bit NOT NULL,
    "TradeName" nvarchar(255) NOT NULL,
    "SupplierFilDate" datetime NOT NULL,
    "SupplierPrd" nvarchar(25) NOT NULL,
    "M1" ntext NOT NULL
);
CREATE INDEX 01 ON "GSTR2AInfo"("GSTIN");
CREATE INDEX 02 ON "GSTR2AInfo"("VchNo");
CREATE INDEX 03 ON "GSTR2AInfo"("Date");
CREATE INDEX 04 ON "GSTR2AInfo"("Month");
CREATE INDEX 05 ON "GSTR2AInfo"("Year");
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"Month" DEFAULT ((0)) FOR "Month";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"OrgDate" DEFAULT '((0))' FOR "OrgDate";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"TotalAmt" DEFAULT ((0)) FOR "TotalAmt";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"Rate" DEFAULT ((0)) FOR "Rate";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"CGST" DEFAULT ((0)) FOR "CGST";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"SGST" DEFAULT ((0)) FOR "SGST";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"IGST" DEFAULT ((0)) FOR "IGST";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"ITCCGST" DEFAULT ((0)) FOR "ITCCGST";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"ITCSGST" DEFAULT ((0)) FOR "ITCSGST";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"ITCIGST" DEFAULT ((0)) FOR "ITCIGST";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"ITCCessAmt" DEFAULT ((0)) FOR "ITCCessAmt";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"POS" DEFAULT ((0)) FOR "POS";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"CFS" DEFAULT '((0))' FOR "CFS";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"Date2" DEFAULT '((0))' FOR "Date2";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"NoteDate" DEFAULT '((0))' FOR "NoteDate";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"DiffPercent" DEFAULT ((0)) FOR "DiffPercent";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"ITCAvl" DEFAULT '((0))' FOR "ITCAvl";
ALTER TABLE "dbo"."GSTR2AInfo" ADD CONSTRAINT DF_GSTR2AInfo_"SupplierFilDate" DEFAULT '((0))' FOR "SupplierFilDate";

DROP TABLE IF EXISTS "GSTR2BInfo";
CREATE TABLE "GSTR2BInfo"(
    "RecType" smallint NOT NULL,
    "TranType" smallint NOT NULL,
    "Month" smallint NOT NULL,
    "Year" nvarchar(255) NOT NULL,
    "SrNo" int NOT NULL,
    "GSTIN" nvarchar(255) NOT NULL,
    "CompGSTIN" nvarchar(255) NOT NULL,
    "TradeName" nvarchar(255) NOT NULL,
    "SupplierFilDate" datetime NOT NULL,
    "SupplierPrd" nvarchar(25) NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "OrgDate" datetime NOT NULL,
    "OrgVchNo" nvarchar(25) NOT NULL,
    "InvType" nvarchar(255) NOT NULL,
    updby nvarchar(255) NOT NULL,
    "CheckSum" nvarchar(255) NOT NULL,
    "Type" nvarchar(20) NOT NULL,
    "TotalAmt" float NOT NULL,
    "TaxableAmt" float NOT NULL,
    "Rate" float NOT NULL,
    "CGST" float NOT NULL,
    "SGST" float NOT NULL,
    "IGST" float NOT NULL,
    "CessAmt" float NOT NULL,
    "ITCCGST" float NOT NULL,
    "ITCSGST" float NOT NULL,
    "ITCIGST" float NOT NULL,
    "ITCCessAmt" float NOT NULL,
    "ITCElg" nvarchar(20) NOT NULL,
    "DiffPercent" float NOT NULL,
    "ITCAvl" bit NOT NULL,
    "Reason" nvarchar(255) NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "POS" smallint NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "CFS" bit NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "NoteNo" nvarchar(255) NOT NULL,
    "NoteDate" datetime NOT NULL,
    "M1" ntext NOT NULL
);
CREATE INDEX 01 ON "GSTR2BInfo"("GSTIN");
CREATE INDEX 02 ON "GSTR2BInfo"("VchNo");
CREATE INDEX 03 ON "GSTR2BInfo"("Date");
CREATE INDEX 04 ON "GSTR2BInfo"("Month");
CREATE INDEX 05 ON "GSTR2BInfo"("Year");
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"Month" DEFAULT ((0)) FOR "Month";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"SupplierFilDate" DEFAULT '((0))' FOR "SupplierFilDate";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"OrgDate" DEFAULT '((0))' FOR "OrgDate";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"TotalAmt" DEFAULT ((0)) FOR "TotalAmt";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"Rate" DEFAULT ((0)) FOR "Rate";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"CGST" DEFAULT ((0)) FOR "CGST";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"SGST" DEFAULT ((0)) FOR "SGST";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"IGST" DEFAULT ((0)) FOR "IGST";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"ITCCGST" DEFAULT ((0)) FOR "ITCCGST";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"ITCSGST" DEFAULT ((0)) FOR "ITCSGST";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"ITCIGST" DEFAULT ((0)) FOR "ITCIGST";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"ITCCessAmt" DEFAULT ((0)) FOR "ITCCessAmt";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"DiffPercent" DEFAULT ((0)) FOR "DiffPercent";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"ITCAvl" DEFAULT '((0))' FOR "ITCAvl";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"POS" DEFAULT ((0)) FOR "POS";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"CFS" DEFAULT '((0))' FOR "CFS";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"Date2" DEFAULT '((0))' FOR "Date2";
ALTER TABLE "dbo"."GSTR2BInfo" ADD CONSTRAINT DF_GSTR2BInfo_"NoteDate" DEFAULT '((0))' FOR "NoteDate";

DROP TABLE IF EXISTS "GSTR3BInfo";
CREATE TABLE "GSTR3BInfo"(
    "RecType" smallint NOT NULL,
    "TranType" smallint NOT NULL,
    "Month" smallint NOT NULL,
    "Year" nvarchar(255) NOT NULL,
    "GSTIN" nvarchar(255) NOT NULL,
    "Type" nvarchar(20) NOT NULL,
    "TaxableAmt" float NOT NULL,
    tax float NOT NULL,
    "CGST" float NOT NULL,
    "SGST" float NOT NULL,
    "IGST" float NOT NULL,
    "CessAmt" float NOT NULL,
    fee float NOT NULL,
    "Inter" float NOT NULL,
    "Intera" float NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "POS" nvarchar(25) NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "ldgID" int NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "Date1" datetime NOT NULL,
    "M1" ntext NOT NULL
);
CREATE INDEX 01 ON "GSTR3BInfo"("GSTIN");
CREATE INDEX 02 ON "GSTR3BInfo"("Month");
CREATE INDEX 03 ON "GSTR3BInfo"("Year");
CREATE INDEX 04 ON "GSTR3BInfo"("RecType");
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"Month" DEFAULT ((0)) FOR "Month";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_tax DEFAULT ((0)) FOR tax;
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"CGST" DEFAULT ((0)) FOR "CGST";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"SGST" DEFAULT ((0)) FOR "SGST";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"IGST" DEFAULT ((0)) FOR "IGST";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_fee DEFAULT ((0)) FOR fee;
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"Inter" DEFAULT ((0)) FOR "Inter";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"Intera" DEFAULT ((0)) FOR "Intera";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"ldgID" DEFAULT ((0)) FOR "ldgID";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."GSTR3BInfo" ADD CONSTRAINT DF_GSTR3BInfo_"Date1" DEFAULT '((0))' FOR "Date1";

DROP TABLE IF EXISTS "GSTR9Table8AInfo";
CREATE TABLE "GSTR9Table8AInfo"(
    "RecType" smallint NOT NULL,
    "TranType" smallint NOT NULL,
    "Month" smallint NOT NULL,
    "DocId" smallint NOT NULL,
    "Year" nvarchar(255) NOT NULL,
    "GSTIN" nvarchar(255) NOT NULL,
    "CompGSTIN" nvarchar(255) NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "OrgDate" datetime NOT NULL,
    "OrgVchNo" nvarchar(25) NOT NULL,
    "InvType" nvarchar(255) NOT NULL,
    "RtnPrd" nvarchar(255) NOT NULL,
    "FillingDt" datetime NOT NULL,
    "TotalAmt" float NOT NULL,
    "TaxableAmt" float NOT NULL,
    "Rate" float NOT NULL,
    "CGST" float NOT NULL,
    "SGST" float NOT NULL,
    "IGST" float NOT NULL,
    "CessAmt" float NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "POS" smallint NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "Reason" nvarchar(255) NOT NULL,
    "NoteType" nvarchar(255) NOT NULL,
    "OrgNoteType" nvarchar(255) NOT NULL,
    "M1" ntext NOT NULL
);
CREATE INDEX 01 ON "GSTR9Table8AInfo"("GSTIN");
CREATE INDEX 02 ON "GSTR9Table8AInfo"("VchNo");
CREATE INDEX 03 ON "GSTR9Table8AInfo"("Date");
CREATE INDEX 04 ON "GSTR9Table8AInfo"("Month");
CREATE INDEX 05 ON "GSTR9Table8AInfo"("Year");
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"Month" DEFAULT ((0)) FOR "Month";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"DocId" DEFAULT ((0)) FOR "DocId";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"OrgDate" DEFAULT '((0))' FOR "OrgDate";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"FillingDt" DEFAULT '((0))' FOR "FillingDt";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"TotalAmt" DEFAULT ((0)) FOR "TotalAmt";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"Rate" DEFAULT ((0)) FOR "Rate";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"CGST" DEFAULT ((0)) FOR "CGST";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"SGST" DEFAULT ((0)) FOR "SGST";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"IGST" DEFAULT ((0)) FOR "IGST";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"POS" DEFAULT ((0)) FOR "POS";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."GSTR9Table8AInfo" ADD CONSTRAINT DF_GSTR9Table8AInfo_"Date2" DEFAULT '((0))' FOR "Date2";

DROP TABLE IF EXISTS "Help1";
CREATE TABLE "Help1"(
    "RecType" smallint NOT NULL,
    "NameAlias" nvarchar(40) NOT NULL,
    "Code" int NOT NULL,
    "MasterType" smallint NOT NULL,
    "NameOrAlias" smallint NOT NULL,
    "AdditionalInfo" nvarchar(255) NOT NULL,
    "ParentGroup" int NOT NULL,
    "MasterSeries" int NOT NULL,
    "Status" smallint NOT NULL,
    "DefaultMCCode" int NOT NULL,
    "AddnInfoBt1" nvarchar(255) NOT NULL,
    "AddnInfoBt2" nvarchar(255) NOT NULL,
    "AddnInfoBt3" nvarchar(255) NOT NULL,
    "AddnInfoBt4" nvarchar(255) NOT NULL
);
CREATE INDEX 11 ON "Help1"("MasterSeries");
CREATE INDEX 16 ON "Help1"("RecType");
CREATE INDEX 21 ON "Help1"("Status");
CREATE INDEX 26 ON "Help1"("NameAlias");
CREATE INDEX 31 ON "Help1"("MasterType");
CREATE INDEX 36 ON "Help1"("NameOrAlias");
CREATE INDEX 41 ON "Help1"("Code");
CREATE INDEX 46 ON "Help1"("AdditionalInfo");
CREATE INDEX 81 ON "Help1"("NameOrAlias","Code");
CREATE INDEX 82 ON "Help1"("MasterSeries","RecType","Status","NameAlias");
ALTER TABLE "dbo"."Help1" ADD CONSTRAINT DF_Help1_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."Help1" ADD CONSTRAINT DF_Help1_"Code" DEFAULT ((0)) FOR "Code";
ALTER TABLE "dbo"."Help1" ADD CONSTRAINT DF_Help1_"MasterType" DEFAULT ((0)) FOR "MasterType";
ALTER TABLE "dbo"."Help1" ADD CONSTRAINT DF_Help1_"NameOrAlias" DEFAULT ((0)) FOR "NameOrAlias";
ALTER TABLE "dbo"."Help1" ADD CONSTRAINT DF_Help1_"ParentGroup" DEFAULT ((0)) FOR "ParentGroup";
ALTER TABLE "dbo"."Help1" ADD CONSTRAINT DF_Help1_"MasterSeries" DEFAULT ((0)) FOR "MasterSeries";
ALTER TABLE "dbo"."Help1" ADD CONSTRAINT DF_Help1_"Status" DEFAULT ((0)) FOR "Status";
ALTER TABLE "dbo"."Help1" ADD CONSTRAINT DF_Help1_"DefaultMCCode" DEFAULT ((0)) FOR "DefaultMCCode";

DROP TABLE IF EXISTS "Help1AddnInfo";
CREATE TABLE "Help1AddnInfo"(
    "Code" int NOT NULL,
    "NameAlias" nvarchar(40) NOT NULL,
    "NameOrAlias" smallint NOT NULL,
    "AddnInfoBt1" nvarchar(255) NOT NULL,
    "AddnInfoBt2" nvarchar(255) NOT NULL,
    "AddnInfoBt3" nvarchar(255) NOT NULL,
    "AddnInfoBt4" nvarchar(255) NOT NULL
);
CREATE INDEX 21 ON "Help1AddnInfo"("Code");
CREATE INDEX 22 ON "Help1AddnInfo"("NameAlias");
CREATE INDEX 23 ON "Help1AddnInfo"("NameOrAlias");
ALTER TABLE "dbo"."Help1AddnInfo" ADD CONSTRAINT DF_Help1AddnInfo_"Code" DEFAULT ((0)) FOR "Code";
ALTER TABLE "dbo"."Help1AddnInfo" ADD CONSTRAINT DF_Help1AddnInfo_"NameOrAlias" DEFAULT ((0)) FOR "NameOrAlias";

DROP TABLE IF EXISTS "Help2";
CREATE TABLE "Help2"(
    "RecType1" smallint NOT NULL,
    "RecType2" smallint NOT NULL,
    "RecType3" int NOT NULL,
    "Name" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "Help2"("RecType1","RecType2","RecType3","Name");
ALTER TABLE "dbo"."Help2" ADD CONSTRAINT DF_Help2_"RecType1" DEFAULT ((0)) FOR "RecType1";
ALTER TABLE "dbo"."Help2" ADD CONSTRAINT DF_Help2_"RecType2" DEFAULT ((0)) FOR "RecType2";
ALTER TABLE "dbo"."Help2" ADD CONSTRAINT DF_Help2_"RecType3" DEFAULT ((0)) FOR "RecType3";

DROP TABLE IF EXISTS "Images";
CREATE TABLE "Images"(
    "Type" smallint NOT NULL,
    "Code" int NOT NULL,
    "Image1" image NOT NULL,
    "FormatType1" nvarchar(255) NOT NULL,
    "Image2" image NOT NULL,
    "FormatType2" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "Images"("Code");
CREATE INDEX 02 ON "Images"("Type");
ALTER TABLE "dbo"."Images" ADD CONSTRAINT DF_Images_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."Images" ADD CONSTRAINT DF_Images_"Code" DEFAULT ((0)) FOR "Code";

DROP TABLE IF EXISTS "IMSInfo";
CREATE TABLE "IMSInfo"(
    "RecType" smallint NOT NULL,
    "TranType" smallint NOT NULL,
    "Month" smallint NOT NULL,
    "Year" nvarchar(255) NOT NULL,
    "GSTIN" nvarchar(255) NOT NULL,
    "CompGSTIN" nvarchar(255) NOT NULL,
    "Action" nvarchar(25) NOT NULL,
    "SupplierPrd" nvarchar(25) NOT NULL,
    "SupplierFileStatus" nvarchar(25) NOT NULL,
    "FormType" nvarchar(25) NOT NULL,
    "Ispendactblocked" nvarchar(25) NOT NULL,
    "PreviousAction" nvarchar(25) NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "OrgDate" datetime NOT NULL,
    "OrgVchNo" nvarchar(25) NOT NULL,
    "InvType" nvarchar(255) NOT NULL,
    "Hash" nvarchar(255) NOT NULL,
    "TotalAmt" float NOT NULL,
    "TaxableAmt" float NOT NULL,
    "CGST" float NOT NULL,
    "SGST" float NOT NULL,
    "IGST" float NOT NULL,
    "CessAmt" float NOT NULL,
    "POS" smallint NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "M1" ntext NOT NULL
);
CREATE INDEX 01 ON "IMSInfo"("GSTIN");
CREATE INDEX 02 ON "IMSInfo"("VchNo");
CREATE INDEX 03 ON "IMSInfo"("Date");
CREATE INDEX 04 ON "IMSInfo"("Month");
CREATE INDEX 05 ON "IMSInfo"("Year");
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"Month" DEFAULT ((0)) FOR "Month";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"OrgDate" DEFAULT '((0))' FOR "OrgDate";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"TotalAmt" DEFAULT ((0)) FOR "TotalAmt";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"CGST" DEFAULT ((0)) FOR "CGST";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"SGST" DEFAULT ((0)) FOR "SGST";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"IGST" DEFAULT ((0)) FOR "IGST";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"POS" DEFAULT ((0)) FOR "POS";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."IMSInfo" ADD CONSTRAINT DF_IMSInfo_"Date2" DEFAULT '((0))' FOR "Date2";

DROP TABLE IF EXISTS "InvConfirmEMailConfigCL";
CREATE TABLE "InvConfirmEMailConfigCL"(
    "TpHeader" text
);

DROP TABLE IF EXISTS "ItemDesc";
CREATE TABLE "ItemDesc"(
    "VchCode" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "Desc1" nvarchar(40) NOT NULL,
    "Desc2" nvarchar(40) NOT NULL,
    "Desc3" nvarchar(40) NOT NULL,
    "Desc4" nvarchar(40) NOT NULL,
    "Desc5" nvarchar(40) NOT NULL,
    "Desc6" nvarchar(40) NOT NULL,
    "Desc7" nvarchar(40) NOT NULL,
    "Desc8" nvarchar(40) NOT NULL,
    "Desc9" nvarchar(40) NOT NULL,
    "Desc10" nvarchar(40) NOT NULL,
    "Desc11" nvarchar(40) NOT NULL,
    "Desc12" nvarchar(40) NOT NULL,
    "Desc13" nvarchar(40) NOT NULL,
    "Desc14" nvarchar(40) NOT NULL,
    "Desc15" nvarchar(40) NOT NULL,
    "Desc16" nvarchar(40) NOT NULL,
    "Desc17" nvarchar(40) NOT NULL,
    "Desc18" nvarchar(40) NOT NULL,
    "Desc19" nvarchar(40) NOT NULL,
    "Desc20" nvarchar(40) NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "I1" smallint NOT NULL,
    "Desc1SL" nvarchar(255) NOT NULL,
    "Desc2SL" nvarchar(255) NOT NULL,
    "Desc3SL" nvarchar(255) NOT NULL,
    "Desc4SL" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "ItemDesc"("VchCode","SrNo");
ALTER TABLE "dbo"."ItemDesc" ADD CONSTRAINT DF_ItemDesc_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."ItemDesc" ADD CONSTRAINT DF_ItemDesc_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."ItemDesc" ADD CONSTRAINT DF_ItemDesc_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."ItemDesc" ADD CONSTRAINT DF_ItemDesc_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."ItemDesc" ADD CONSTRAINT DF_ItemDesc_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."ItemDesc" ADD CONSTRAINT DF_ItemDesc_"I1" DEFAULT ((0)) FOR "I1";

DROP TABLE IF EXISTS "ItemParamDet";
CREATE TABLE "ItemParamDet"(
    "Date" datetime NOT NULL,
    "VchType" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "RecType" smallint NOT NULL,
    "VchItemSN" smallint NOT NULL,
    "ItemCode" int NOT NULL,
    "MCCode" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "CM1" int NOT NULL,
    "C1" nvarchar(20) NOT NULL,
    "C2" nvarchar(20) NOT NULL,
    "C3" nvarchar(20) NOT NULL,
    "C4" nvarchar(20) NOT NULL,
    "C5" nvarchar(20) NOT NULL,
    "C6" nvarchar(20) NOT NULL,
    "C7" nvarchar(20) NOT NULL,
    "C8" nvarchar(20) NOT NULL,
    "C9" nvarchar(20) NOT NULL,
    "C10" nvarchar(20) NOT NULL,
    "C11" nvarchar(255) NOT NULL,
    "C12" nvarchar(255) NOT NULL,
    "C13" nvarchar(255) NOT NULL,
    "Value1" float NOT NULL,
    "Value2" float NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "D7" float NOT NULL,
    "D8" float NOT NULL,
    "D9" float NOT NULL,
    "D10" float NOT NULL,
    "D11" float NOT NULL,
    "BCN" nvarchar(40) NOT NULL,
    "AutoBCN" int NOT NULL,
    "OrgDate" datetime NOT NULL,
    "OrgVchCode" int NOT NULL
);
CREATE INDEX 01 ON "ItemParamDet"("VchCode","VchItemSN","SrNo");
CREATE INDEX 02 ON "ItemParamDet"("ItemCode","MCCode","VchCode","RecType","VchItemSN","SrNo");
CREATE INDEX 03 ON "ItemParamDet"("RecType","ItemCode","MCCode","Date","C1","C2","C3","Value1","D3");
CREATE INDEX 04 ON "ItemParamDet"("BCN");
CREATE INDEX 06 ON "ItemParamDet"("BCN","VchCode");
CREATE INDEX 07 ON "ItemParamDet"("BCN","Value1","MCCode");
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"VchItemSN" DEFAULT ((0)) FOR "VchItemSN";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"ItemCode" DEFAULT ((0)) FOR "ItemCode";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"MCCode" DEFAULT ((0)) FOR "MCCode";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D7" DEFAULT ((0)) FOR "D7";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D8" DEFAULT ((0)) FOR "D8";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D9" DEFAULT ((0)) FOR "D9";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D10" DEFAULT ((0)) FOR "D10";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"D11" DEFAULT ((0)) FOR "D11";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"AutoBCN" DEFAULT ((0)) FOR "AutoBCN";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"OrgDate" DEFAULT '((0))' FOR "OrgDate";
ALTER TABLE "dbo"."ItemParamDet" ADD CONSTRAINT DF_ItemParamDet_"OrgVchCode" DEFAULT ((0)) FOR "OrgVchCode";

DROP TABLE IF EXISTS "ItemSerialNo";
CREATE TABLE "ItemSerialNo"(
    "VchCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "VchItemSN" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "ItemCode" int NOT NULL,
    "MCCode" int NOT NULL,
    "GridSN" int NOT NULL,
    "SerialNo" nvarchar(255) NOT NULL,
    "AutoSrNo" int NOT NULL,
    "Value1" float NOT NULL,
    "Value2" float NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "MonthVal" smallint NOT NULL,
    "C1" nvarchar(40) NOT NULL,
    "C2" nvarchar(40) NOT NULL,
    "C3" nvarchar(40) NOT NULL,
    "C4" nvarchar(40) NOT NULL,
    "C5" nvarchar(40) NOT NULL,
    "C6" nvarchar(40) NOT NULL,
    "C7" nvarchar(40) NOT NULL,
    "C8" nvarchar(40) NOT NULL,
    "C9" nvarchar(40) NOT NULL,
    "C10" nvarchar(40) NOT NULL,
    "WarrantyMonth" smallint NOT NULL
);
CREATE INDEX 01 ON "ItemSerialNo"("ItemCode","SerialNo","Date","VchType","VchNo","VchCode");
CREATE INDEX 02 ON "ItemSerialNo"("VchCode","VchItemSN","GridSN");
CREATE INDEX 03 ON "ItemSerialNo"("ItemCode","MCCode","SerialNo","Value1","Date","VchCode");
CREATE INDEX 04 ON "ItemSerialNo"("ItemCode","SerialNo","Value1","Date","VchCode");
CREATE INDEX 05 ON "ItemSerialNo"("ItemCode","MCCode","VchCode","VchItemSN","GridSN","SerialNo");
CREATE INDEX 06 ON "ItemSerialNo"("ItemCode","Value1","Date","VchType","VchCode","VchItemSN","GridSN","SerialNo");
CREATE INDEX 07 ON "ItemSerialNo"("ItemCode","VchType","VchCode","AutoSrNo");
CREATE INDEX 08 ON "ItemSerialNo"("ItemCode","MCCode","VchCode","SerialNo","Value1");
CREATE INDEX 09 ON "ItemSerialNo"("ItemCode","MCCode","SerialNo","Value1");
CREATE INDEX 10 ON "ItemSerialNo"("ItemCode","AutoSrNo");
CREATE INDEX 11 ON "ItemSerialNo"("ItemCode","Date","AutoSrNo");
CREATE INDEX 12 ON "ItemSerialNo"("ItemCode","MonthVal","AutoSrNo");
CREATE INDEX 13 ON "ItemSerialNo"("SerialNo","Value1","MCCode");
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"VchItemSN" DEFAULT ((0)) FOR "VchItemSN";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"ItemCode" DEFAULT ((0)) FOR "ItemCode";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"MCCode" DEFAULT ((0)) FOR "MCCode";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"GridSN" DEFAULT ((0)) FOR "GridSN";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"AutoSrNo" DEFAULT ((0)) FOR "AutoSrNo";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"MonthVal" DEFAULT ((0)) FOR "MonthVal";
ALTER TABLE "dbo"."ItemSerialNo" ADD CONSTRAINT DF_ItemSerialNo_"WarrantyMonth" DEFAULT ((0)) FOR "WarrantyMonth";

DROP TABLE IF EXISTS "ItemSNInstallDet";
CREATE TABLE "ItemSNInstallDet"(
    "InstallCode" int NOT NULL,
    "InstallDate" datetime NOT NULL,
    "ItemCode" int NOT NULL,
    "SerialNo" nvarchar(255) NOT NULL,
    "InvoiceNo" nvarchar(25) NOT NULL,
    "InvoiceDate" datetime NOT NULL,
    "PartyCode" int NOT NULL,
    "Organization" nvarchar(40) NOT NULL,
    "TradeDesc" nvarchar(40) NOT NULL,
    "ContactPerson" nvarchar(40) NOT NULL,
    "Designation" nvarchar(40) NOT NULL,
    "Address1" nvarchar(40) NOT NULL,
    "Address2" nvarchar(40) NOT NULL,
    "CountryCode" int NOT NULL,
    "StateCode" int NOT NULL,
    "CityCode" int NOT NULL,
    "PinCode" nvarchar(10) NOT NULL,
    "MobileNo" nvarchar(40) NOT NULL,
    "PhoneNo" nvarchar(40) NOT NULL,
    "FaxNo" nvarchar(40) NOT NULL,
    "EmailID" nvarchar(40) NOT NULL,
    "Narration" nvarchar(94) NOT NULL,
    "WarrMonth" smallint NOT NULL
);
CREATE INDEX 01 ON "ItemSNInstallDet"("ItemCode","SerialNo");
CREATE INDEX 02 ON "ItemSNInstallDet"("InstallCode");
CREATE INDEX 03 ON "ItemSNInstallDet"("PartyCode");
CREATE INDEX 04 ON "ItemSNInstallDet"("CountryCode");
CREATE INDEX 05 ON "ItemSNInstallDet"("StateCode");
CREATE INDEX 06 ON "ItemSNInstallDet"("CityCode");
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"InstallCode" DEFAULT ((0)) FOR "InstallCode";
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"InstallDate" DEFAULT '((0))' FOR "InstallDate";
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"ItemCode" DEFAULT ((0)) FOR "ItemCode";
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"InvoiceDate" DEFAULT '((0))' FOR "InvoiceDate";
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"PartyCode" DEFAULT ((0)) FOR "PartyCode";
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"CountryCode" DEFAULT ((0)) FOR "CountryCode";
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"StateCode" DEFAULT ((0)) FOR "StateCode";
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"CityCode" DEFAULT ((0)) FOR "CityCode";
ALTER TABLE "dbo"."ItemSNInstallDet" ADD CONSTRAINT DF_ItemSNInstallDet_"WarrMonth" DEFAULT ((0)) FOR "WarrMonth";

DROP TABLE IF EXISTS "JobFinishedRefs";
CREATE TABLE "JobFinishedRefs"(
    "JobID" nvarchar(255) NOT NULL,
    "TranType" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "CM1" int NOT NULL,
    "Value1" float NOT NULL,
    "Value2" float NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "C3" nvarchar(255) NOT NULL,
    "Date1" datetime NOT NULL,
    "Rectype" smallint NOT NULL,
    "C4" nvarchar(255) NOT NULL,
    "C5" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "JobFinishedRefs"("MasterCode1");
CREATE INDEX 02 ON "JobFinishedRefs"("JobID");
CREATE INDEX 03 ON "JobFinishedRefs"("Date");
CREATE INDEX 04 ON "JobFinishedRefs"("CM1");
CREATE INDEX 05 ON "JobFinishedRefs"("TranType");
CREATE INDEX 06 ON "JobFinishedRefs"("VchType");
CREATE INDEX 07 ON "JobFinishedRefs"("MasterCode2");
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."JobFinishedRefs" ADD CONSTRAINT DF_JobFinishedRefs_"Rectype" DEFAULT ((0)) FOR "Rectype";

DROP TABLE IF EXISTS "Locks";
CREATE TABLE "Locks"(
    "Type" datetime NOT NULL,
    "IBR" bit NOT NULL,
    "MBU" bit NOT NULL,
    "CSU" bit NOT NULL,
    "STU" bit NOT NULL,
    "Working" bit NOT NULL,
    "BSSTD" bit NOT NULL,
    "TERBR" bit NOT NULL,
    "BRS" bit NOT NULL,
    "CCCF" bit NOT NULL,
    "SuppTypeF" bit NOT NULL,
    "BSNF" bit NOT NULL,
    "BST" bit NOT NULL,
    "OSPO" bit NOT NULL,
    "OBAMC" bit NOT NULL,
    "TDSSHE" bit NOT NULL,
    "TESRNO" bit NOT NULL,
    "MAJOR" smallint NOT NULL,
    "MINOR" smallint NOT NULL,
    "RW35" bit NOT NULL,
    "MEBR" bit NOT NULL,
    "MEBR1" bit NOT NULL,
    "MFFSA" bit NOT NULL,
    "SMPL" bit NOT NULL,
    "GSTU" bit NOT NULL,
    "MUSPO" bit NOT NULL,
    "DFYW" bit NOT NULL,
    "BATCH" bit NOT NULL,
    "BATCHMRPSRNOPARAM" bit NOT NULL,
    "ENTRYTAXRATE" bit NOT NULL,
    "STPTMC" bit NOT NULL,
    "CHALLANNO" bit NOT NULL,
    "PARAMDET" bit NOT NULL,
    "MASTFP" bit NOT NULL,
    "MASTFP1" bit NOT NULL,
    "RMVLOCDB" bit NOT NULL,
    "POSSERIESFTBSNAME" bit NOT NULL,
    "STSCGUPDT" bit NOT NULL,
    "ItemSrNoLen" bit NOT NULL,
    "RGMAST" bit NOT NULL,
    "MainDbVer" smallint NOT NULL,
    "PartialDbVer" smallint NOT NULL,
    "COMPEGRPMAST" bit NOT NULL,
    "COMPCONTGRPMAST" bit NOT NULL,
    "AREAMAST" bit NOT NULL,
    "CONTDEPTMAST" bit NOT NULL,
    "SOURCEMAST" bit NOT NULL,
    "SUBSTATUSMAST" bit NOT NULL,
    "NXTACTIONMAST" bit NOT NULL,
    "TRADEMAST" bit NOT NULL,
    "B1" bit NOT NULL,
    "FAQGRPMAST" bit NOT NULL,
    "PENDSUBSTATUSMAST" bit NOT NULL,
    "TRACKINGNO" bit NOT NULL,
    "WinUser" nvarchar(255) NOT NULL,
    "PIIPD" nvarchar(255) NOT NULL,
    "TOFQ" bit NOT NULL,
    "CompanyName" nvarchar(255) NOT NULL,
    "URefBal" bit NOT NULL
);
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"Type" DEFAULT '((0))' FOR "Type";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"IBR" DEFAULT '((0))' FOR "IBR";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MBU" DEFAULT '((0))' FOR "MBU";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"CSU" DEFAULT '((0))' FOR "CSU";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"STU" DEFAULT '((0))' FOR "STU";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"Working" DEFAULT '((0))' FOR "Working";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"BSSTD" DEFAULT '((0))' FOR "BSSTD";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"TERBR" DEFAULT '((0))' FOR "TERBR";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"BRS" DEFAULT '((0))' FOR "BRS";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"CCCF" DEFAULT '((0))' FOR "CCCF";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"SuppTypeF" DEFAULT '((0))' FOR "SuppTypeF";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"BSNF" DEFAULT '((0))' FOR "BSNF";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"BST" DEFAULT '((0))' FOR "BST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"OSPO" DEFAULT '((0))' FOR "OSPO";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"OBAMC" DEFAULT '((0))' FOR "OBAMC";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"TDSSHE" DEFAULT '((0))' FOR "TDSSHE";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"TESRNO" DEFAULT '((0))' FOR "TESRNO";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MAJOR" DEFAULT ((0)) FOR "MAJOR";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MINOR" DEFAULT ((0)) FOR "MINOR";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"RW35" DEFAULT '((0))' FOR "RW35";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MEBR" DEFAULT '((0))' FOR "MEBR";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MEBR1" DEFAULT '((0))' FOR "MEBR1";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MFFSA" DEFAULT '((0))' FOR "MFFSA";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"SMPL" DEFAULT '((0))' FOR "SMPL";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"GSTU" DEFAULT '((0))' FOR "GSTU";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MUSPO" DEFAULT '((0))' FOR "MUSPO";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"DFYW" DEFAULT '((0))' FOR "DFYW";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"BATCH" DEFAULT '((0))' FOR "BATCH";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"BATCHMRPSRNOPARAM" DEFAULT '((0))' FOR "BATCHMRPSRNOPARAM";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"ENTRYTAXRATE" DEFAULT '((0))' FOR "ENTRYTAXRATE";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"STPTMC" DEFAULT '((0))' FOR "STPTMC";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"CHALLANNO" DEFAULT '((0))' FOR "CHALLANNO";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"PARAMDET" DEFAULT '((0))' FOR "PARAMDET";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MASTFP" DEFAULT '((0))' FOR "MASTFP";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MASTFP1" DEFAULT '((0))' FOR "MASTFP1";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"RMVLOCDB" DEFAULT '((0))' FOR "RMVLOCDB";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"POSSERIESFTBSNAME" DEFAULT '((0))' FOR "POSSERIESFTBSNAME";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"STSCGUPDT" DEFAULT '((0))' FOR "STSCGUPDT";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"ItemSrNoLen" DEFAULT '((0))' FOR "ItemSrNoLen";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"RGMAST" DEFAULT '((0))' FOR "RGMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"MainDbVer" DEFAULT ((0)) FOR "MainDbVer";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"PartialDbVer" DEFAULT ((0)) FOR "PartialDbVer";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"COMPEGRPMAST" DEFAULT '((0))' FOR "COMPEGRPMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"COMPCONTGRPMAST" DEFAULT '((0))' FOR "COMPCONTGRPMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"AREAMAST" DEFAULT '((0))' FOR "AREAMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"CONTDEPTMAST" DEFAULT '((0))' FOR "CONTDEPTMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"SOURCEMAST" DEFAULT '((0))' FOR "SOURCEMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"SUBSTATUSMAST" DEFAULT '((0))' FOR "SUBSTATUSMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"NXTACTIONMAST" DEFAULT '((0))' FOR "NXTACTIONMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"TRADEMAST" DEFAULT '((0))' FOR "TRADEMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"FAQGRPMAST" DEFAULT '((0))' FOR "FAQGRPMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"PENDSUBSTATUSMAST" DEFAULT '((0))' FOR "PENDSUBSTATUSMAST";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"TRACKINGNO" DEFAULT '((0))' FOR "TRACKINGNO";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"TOFQ" DEFAULT '((0))' FOR "TOFQ";
ALTER TABLE "dbo"."Locks" ADD CONSTRAINT DF_Locks_"URefBal" DEFAULT '((0))' FOR "URefBal";

DROP TABLE IF EXISTS "Master1";
CREATE TABLE "Master1"(
    "Code" int NOT NULL,
    "MasterType" smallint NOT NULL,
    "Name" nvarchar(40) NOT NULL,
    "Alias" nvarchar(40) NOT NULL,
    "PrintName" nvarchar(60) NOT NULL,
    "ParentGrp" int NOT NULL,
    "Stamp" int NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "CM6" int NOT NULL,
    "CM7" int NOT NULL,
    "CM8" int NOT NULL,
    "CM9" int NOT NULL,
    "CM10" int NOT NULL,
    "CM11" int NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "D7" float NOT NULL,
    "D8" float NOT NULL,
    "D9" float NOT NULL,
    "D10" float NOT NULL,
    "D11" float NOT NULL,
    "D12" float NOT NULL,
    "D13" float NOT NULL,
    "D14" float NOT NULL,
    "D15" float NOT NULL,
    "D16" float NOT NULL,
    "D17" float NOT NULL,
    "D18" float NOT NULL,
    "D19" float NOT NULL,
    "D20" float NOT NULL,
    "D21" float NOT NULL,
    "D22" float NOT NULL,
    "D23" float NOT NULL,
    "D24" float NOT NULL,
    "D25" float NOT NULL,
    "D26" float NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "I4" smallint NOT NULL,
    "I5" smallint NOT NULL,
    "I6" smallint NOT NULL,
    "I7" smallint NOT NULL,
    "I8" smallint NOT NULL,
    "I9" smallint NOT NULL,
    "I10" smallint NOT NULL,
    "I11" smallint NOT NULL,
    "I12" smallint NOT NULL,
    "I13" smallint NOT NULL,
    "I14" smallint NOT NULL,
    "I15" smallint NOT NULL,
    "I16" smallint NOT NULL,
    "I17" smallint NOT NULL,
    "I18" smallint NOT NULL,
    "I19" smallint NOT NULL,
    "I20" smallint NOT NULL,
    "I21" smallint NOT NULL,
    "I22" smallint NOT NULL,
    "I23" smallint NOT NULL,
    "I24" smallint NOT NULL,
    "I25" smallint NOT NULL,
    "I26" smallint NOT NULL,
    "I27" smallint NOT NULL,
    "I28" smallint NOT NULL,
    "Level" smallint NOT NULL,
    "SrNo" smallint NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "B6" bit NOT NULL,
    "B7" bit NOT NULL,
    "B8" bit NOT NULL,
    "B9" bit NOT NULL,
    "B10" bit NOT NULL,
    "B11" bit NOT NULL,
    "B12" bit NOT NULL,
    "B13" bit NOT NULL,
    "B14" bit NOT NULL,
    "B15" bit NOT NULL,
    "B16" bit NOT NULL,
    "B17" bit NOT NULL,
    "B18" bit NOT NULL,
    "B19" bit NOT NULL,
    "B20" bit NOT NULL,
    "B21" bit NOT NULL,
    "B22" bit NOT NULL,
    "B23" bit NOT NULL,
    "B24" bit NOT NULL,
    "B25" bit NOT NULL,
    "B26" bit NOT NULL,
    "B27" bit NOT NULL,
    "B28" bit NOT NULL,
    "B29" bit NOT NULL,
    "B30" bit NOT NULL,
    "B31" bit NOT NULL,
    "B32" bit NOT NULL,
    "B33" bit NOT NULL,
    "B34" bit NOT NULL,
    "B35" bit NOT NULL,
    "B36" bit NOT NULL,
    "B37" bit NOT NULL,
    "B38" bit NOT NULL,
    "B39" bit NOT NULL,
    "B40" bit NOT NULL,
    "External" bit NOT NULL,
    "L1" int NOT NULL,
    "L2" int NOT NULL,
    "Notes1" nvarchar(80) NOT NULL,
    "Notes2" nvarchar(80) NOT NULL,
    "MasterNotes" ntext NOT NULL,
    "CreatedBy" nvarchar(20) NOT NULL,
    "CreationTime" datetime NOT NULL,
    "ModifiedBy" nvarchar(20) NOT NULL,
    "ModificationTime" datetime NOT NULL,
    "AuthorisedBy" nvarchar(20) NOT NULL,
    "AuthorisationTime" datetime NOT NULL,
    "ApprovalStatus" smallint NOT NULL,
    "SyncStatus" bit NOT NULL,
    "MasterSeriesGrp" ntext NOT NULL,
    "Source" smallint NOT NULL,
    "BlockedMaster" bit NOT NULL,
    "BlockedNotes" ntext NOT NULL,
    "DeactiveMaster" bit NOT NULL,
    "C1" nvarchar(80) NOT NULL,
    "C2" nvarchar(80) NOT NULL,
    "C3" nvarchar(255) NOT NULL,
    "C4" nvarchar(255) NOT NULL,
    "C5" nvarchar(255) NOT NULL,
    "C6" nvarchar(255) NOT NULL,
    "HSNCode" nvarchar(255) NOT NULL,
    "SENO" nvarchar(255) NOT NULL,
    "M1" ntext NOT NULL,
    "M2" ntext NOT NULL,
    "BlockedVchType" nvarchar(255) NOT NULL,
    "TPF1" bit NOT NULL,
    "TPF2" bit NOT NULL,
    "RejectionStatus" smallint NOT NULL,
    "NameSL" nvarchar(255) NOT NULL,
    "AliasSL" nvarchar(255) NOT NULL,
    "PrintNameSL" nvarchar(255) NOT NULL,
    "SelfImageLink" nvarchar(255) NOT NULL,
    "SelfImageName" nvarchar(255) NOT NULL,
    "OldIdentity" ntext NOT NULL,
    "C7" nvarchar(255) NOT NULL,
    "I29" smallint NOT NULL,
    "I30" smallint NOT NULL,
    "Required" int,
    "SPCode" int,
    "AMCode" int
);
CREATE UNIQUE INDEX 01 ON "Master1"("Code");
CREATE INDEX 02 ON "Master1"("MasterType","Name");
CREATE INDEX 03 ON "Master1"("MasterType","Alias");
CREATE INDEX 04 ON "Master1"("CM1");
CREATE INDEX 05 ON "Master1"("CM2");
CREATE INDEX 06 ON "Master1"("CM3");
CREATE INDEX 07 ON "Master1"("CM4");
CREATE INDEX 08 ON "Master1"("CM5");
CREATE INDEX 17 ON "Master1"("CM6");
CREATE INDEX 18 ON "Master1"("CM7");
CREATE INDEX 20 ON "Master1"("CM8");
CREATE INDEX 31 ON "Master1"("MasterType");
CREATE INDEX 32 ON "Master1"("Name");
CREATE INDEX 33 ON "Master1"("Alias");
CREATE INDEX 34 ON "Master1"("ParentGrp");
CREATE INDEX 35 ON "Master1"("D11");
CREATE INDEX 36 ON "Master1"("C2");
CREATE INDEX 37 ON "Master1"("SyncStatus");
CREATE INDEX 38 ON "Master1"("Source");
CREATE INDEX 39 ON "Master1"("I10");
CREATE INDEX 40 ON "Master1"("CM9");
CREATE INDEX 41 ON "Master1"("CM10");
CREATE INDEX 42 ON "Master1"("CM11");
CREATE INDEX 43 ON "Master1"("I17");
CREATE INDEX 44 ON "Master1"("I18");
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"Code" DEFAULT ((0)) FOR "Code";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"MasterType" DEFAULT ((0)) FOR "MasterType";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"ParentGrp" DEFAULT ((0)) FOR "ParentGrp";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"Stamp" DEFAULT ((0)) FOR "Stamp";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM6" DEFAULT ((0)) FOR "CM6";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM7" DEFAULT ((0)) FOR "CM7";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM8" DEFAULT ((0)) FOR "CM8";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM9" DEFAULT ((0)) FOR "CM9";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM10" DEFAULT ((0)) FOR "CM10";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CM11" DEFAULT ((0)) FOR "CM11";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D7" DEFAULT ((0)) FOR "D7";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D8" DEFAULT ((0)) FOR "D8";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D9" DEFAULT ((0)) FOR "D9";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D10" DEFAULT ((0)) FOR "D10";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D11" DEFAULT ((0)) FOR "D11";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D12" DEFAULT ((0)) FOR "D12";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D13" DEFAULT ((0)) FOR "D13";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D14" DEFAULT ((0)) FOR "D14";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D15" DEFAULT ((0)) FOR "D15";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D16" DEFAULT ((0)) FOR "D16";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D17" DEFAULT ((0)) FOR "D17";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D18" DEFAULT ((0)) FOR "D18";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D19" DEFAULT ((0)) FOR "D19";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D20" DEFAULT ((0)) FOR "D20";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D21" DEFAULT ((0)) FOR "D21";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D22" DEFAULT ((0)) FOR "D22";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D23" DEFAULT ((0)) FOR "D23";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D24" DEFAULT ((0)) FOR "D24";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D25" DEFAULT ((0)) FOR "D25";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"D26" DEFAULT ((0)) FOR "D26";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I4" DEFAULT ((0)) FOR "I4";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I5" DEFAULT ((0)) FOR "I5";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I6" DEFAULT ((0)) FOR "I6";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I7" DEFAULT ((0)) FOR "I7";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I8" DEFAULT ((0)) FOR "I8";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I9" DEFAULT ((0)) FOR "I9";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I10" DEFAULT ((0)) FOR "I10";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I11" DEFAULT ((0)) FOR "I11";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I12" DEFAULT ((0)) FOR "I12";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I13" DEFAULT ((0)) FOR "I13";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I14" DEFAULT ((0)) FOR "I14";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I15" DEFAULT ((0)) FOR "I15";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I16" DEFAULT ((0)) FOR "I16";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I17" DEFAULT ((0)) FOR "I17";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I18" DEFAULT ((0)) FOR "I18";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I19" DEFAULT ((0)) FOR "I19";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I20" DEFAULT ((0)) FOR "I20";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I21" DEFAULT ((0)) FOR "I21";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I22" DEFAULT ((0)) FOR "I22";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I23" DEFAULT ((0)) FOR "I23";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I24" DEFAULT ((0)) FOR "I24";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I25" DEFAULT ((0)) FOR "I25";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I26" DEFAULT ((0)) FOR "I26";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I27" DEFAULT ((0)) FOR "I27";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I28" DEFAULT ((0)) FOR "I28";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"Level" DEFAULT ((0)) FOR "Level";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B6" DEFAULT '((0))' FOR "B6";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B7" DEFAULT '((0))' FOR "B7";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B8" DEFAULT '((0))' FOR "B8";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B9" DEFAULT '((0))' FOR "B9";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B10" DEFAULT '((0))' FOR "B10";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B11" DEFAULT '((0))' FOR "B11";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B12" DEFAULT '((0))' FOR "B12";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B13" DEFAULT '((0))' FOR "B13";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B14" DEFAULT '((0))' FOR "B14";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B15" DEFAULT '((0))' FOR "B15";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B16" DEFAULT '((0))' FOR "B16";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B17" DEFAULT '((0))' FOR "B17";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B18" DEFAULT '((0))' FOR "B18";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B19" DEFAULT '((0))' FOR "B19";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B20" DEFAULT '((0))' FOR "B20";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B21" DEFAULT '((0))' FOR "B21";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B22" DEFAULT '((0))' FOR "B22";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B23" DEFAULT '((0))' FOR "B23";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B24" DEFAULT '((0))' FOR "B24";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B25" DEFAULT '((0))' FOR "B25";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B26" DEFAULT '((0))' FOR "B26";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B27" DEFAULT '((0))' FOR "B27";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B28" DEFAULT '((0))' FOR "B28";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B29" DEFAULT '((0))' FOR "B29";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B30" DEFAULT '((0))' FOR "B30";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B31" DEFAULT '((0))' FOR "B31";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B32" DEFAULT '((0))' FOR "B32";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B33" DEFAULT '((0))' FOR "B33";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B34" DEFAULT '((0))' FOR "B34";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B35" DEFAULT '((0))' FOR "B35";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B36" DEFAULT '((0))' FOR "B36";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B37" DEFAULT '((0))' FOR "B37";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B38" DEFAULT '((0))' FOR "B38";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B39" DEFAULT '((0))' FOR "B39";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"B40" DEFAULT '((0))' FOR "B40";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"External" DEFAULT '((0))' FOR "External";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"L1" DEFAULT ((0)) FOR "L1";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"L2" DEFAULT ((0)) FOR "L2";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"CreationTime" DEFAULT '((0))' FOR "CreationTime";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"ModificationTime" DEFAULT '((0))' FOR "ModificationTime";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"AuthorisationTime" DEFAULT '((0))' FOR "AuthorisationTime";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"ApprovalStatus" DEFAULT ((0)) FOR "ApprovalStatus";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"SyncStatus" DEFAULT '((0))' FOR "SyncStatus";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"Source" DEFAULT ((0)) FOR "Source";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"BlockedMaster" DEFAULT '((0))' FOR "BlockedMaster";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"DeactiveMaster" DEFAULT '((0))' FOR "DeactiveMaster";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"TPF1" DEFAULT '((0))' FOR "TPF1";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"TPF2" DEFAULT '((0))' FOR "TPF2";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"RejectionStatus" DEFAULT ((0)) FOR "RejectionStatus";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I29" DEFAULT ((0)) FOR "I29";
ALTER TABLE "dbo"."Master1" ADD CONSTRAINT DF_Master1_"I30" DEFAULT ((0)) FOR "I30";

DROP TABLE IF EXISTS "MasterAddressInfo";
CREATE TABLE "MasterAddressInfo"(
    "MasterCode" int NOT NULL,
    "Address1" nvarchar(40) NOT NULL,
    "Address2" nvarchar(40) NOT NULL,
    "Address3" nvarchar(40) NOT NULL,
    "Address4" nvarchar(40) NOT NULL,
    "TelNo" nvarchar(40) NOT NULL,
    "Fax" nvarchar(30) NOT NULL,
    "Email" nvarchar(255) NOT NULL,
    "Mobile" nvarchar(255) NOT NULL,
    "LST" nvarchar(30) NOT NULL,
    "CST" nvarchar(30) NOT NULL,
    "ST37" nvarchar(30) NOT NULL,
    "TINNo" nvarchar(30) NOT NULL,
    "LBTNo" nvarchar(255) NOT NULL,
    "ITPAN" nvarchar(20) NOT NULL,
    "ITWard" nvarchar(20) NOT NULL,
    "Contact" nvarchar(40) NOT NULL,
    "ExciseRegNo" nvarchar(30) NOT NULL,
    "ECCCode" nvarchar(20) NOT NULL,
    "PLANo" nvarchar(20) NOT NULL,
    "Division" nvarchar(80) NOT NULL,
    "Range" nvarchar(80) NOT NULL,
    "Collectorate" nvarchar(40) NOT NULL,
    "OF1" nvarchar(255) NOT NULL,
    "OF2" nvarchar(255) NOT NULL,
    "OF3" nvarchar(255) NOT NULL,
    "OF4" nvarchar(255) NOT NULL,
    "OF5" nvarchar(255) NOT NULL,
    "OF6" nvarchar(255) NOT NULL,
    "OF7" nvarchar(255) NOT NULL,
    "OF8" nvarchar(255) NOT NULL,
    "OF9" nvarchar(255) NOT NULL,
    "OF10" nvarchar(255) NOT NULL,
    "SupplierType" nvarchar(25) NOT NULL,
    "ServiceTaxNo" nvarchar(30) NOT NULL,
    "TelNoResi" nvarchar(40) NOT NULL,
    "GSTNo" nvarchar(30) NOT NULL,
    "CountryCodeLong" int NOT NULL,
    "StateCodeLong" int NOT NULL,
    "CityCodeLong" int NOT NULL,
    "RegionCodeLong" int NOT NULL,
    "AreaCodeLong" int NOT NULL,
    "ContDeptCodeLong" int NOT NULL,
    "PINCode" nvarchar(10) NOT NULL,
    "DLNo" nvarchar(255) NOT NULL,
    "DLNo2" nvarchar(255) NOT NULL,
    "Transport" nvarchar(30) NOT NULL,
    "Station" nvarchar(30) NOT NULL,
    "AccNo" nvarchar(40) NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "Date3" datetime NOT NULL,
    "Date4" datetime NOT NULL,
    "Date5" datetime NOT NULL,
    "Date6" datetime NOT NULL,
    "Date7" datetime NOT NULL,
    "Date8" datetime NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "C3" nvarchar(255) NOT NULL,
    "C4" nvarchar(255) NOT NULL,
    "C5" nvarchar(255) NOT NULL,
    "C6" nvarchar(255) NOT NULL,
    "C7" nvarchar(255) NOT NULL,
    "C8" nvarchar(255) NOT NULL,
    "C9" nvarchar(255) NOT NULL,
    "C10" nvarchar(255) NOT NULL,
    "M1" ntext NOT NULL,
    "Distance" float NOT NULL,
    "TransportMode" smallint NOT NULL,
    "Address1SL" nvarchar(255) NOT NULL,
    "Address2SL" nvarchar(255) NOT NULL,
    "Address3SL" nvarchar(255) NOT NULL,
    "Address4SL" nvarchar(255) NOT NULL,
    "WhatsAppNo" nvarchar(255) NOT NULL
);
CREATE UNIQUE INDEX 01 ON "MasterAddressInfo"("MasterCode");
CREATE INDEX 02 ON "MasterAddressInfo"("CountryCodeLong");
CREATE INDEX 03 ON "MasterAddressInfo"("StateCodeLong");
CREATE INDEX 04 ON "MasterAddressInfo"("CityCodeLong");
CREATE INDEX 05 ON "MasterAddressInfo"("RegionCodeLong");
CREATE INDEX 06 ON "MasterAddressInfo"("Mobile");
CREATE INDEX 07 ON "MasterAddressInfo"("Email");
CREATE INDEX 08 ON "MasterAddressInfo"("ITPAN");
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"MasterCode" DEFAULT ((0)) FOR "MasterCode";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"CountryCodeLong" DEFAULT ((0)) FOR "CountryCodeLong";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"StateCodeLong" DEFAULT ((0)) FOR "StateCodeLong";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"CityCodeLong" DEFAULT ((0)) FOR "CityCodeLong";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"RegionCodeLong" DEFAULT ((0)) FOR "RegionCodeLong";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"AreaCodeLong" DEFAULT ((0)) FOR "AreaCodeLong";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"ContDeptCodeLong" DEFAULT ((0)) FOR "ContDeptCodeLong";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Date2" DEFAULT '((0))' FOR "Date2";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Date3" DEFAULT '((0))' FOR "Date3";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Date4" DEFAULT '((0))' FOR "Date4";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Date5" DEFAULT '((0))' FOR "Date5";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Date6" DEFAULT '((0))' FOR "Date6";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Date7" DEFAULT '((0))' FOR "Date7";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Date8" DEFAULT '((0))' FOR "Date8";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"Distance" DEFAULT ((0)) FOR "Distance";
ALTER TABLE "dbo"."MasterAddressInfo" ADD CONSTRAINT DF_MasterAddressInfo_"TransportMode" DEFAULT ((0)) FOR "TransportMode";

DROP TABLE IF EXISTS "MasterSupport";
CREATE TABLE "MasterSupport"(
    "MasterCode" int NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "D7" float NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "I4" smallint NOT NULL,
    "I5" smallint NOT NULL,
    "I6" smallint NOT NULL,
    "I7" smallint NOT NULL,
    "I8" smallint NOT NULL,
    "I9" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "MasterType" smallint NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "B1" bit NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "C3" nvarchar(255) NOT NULL,
    "C4" nvarchar(255) NOT NULL,
    "C5" nvarchar(255) NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "B6" bit NOT NULL,
    "D8" float NOT NULL,
    "D9" float NOT NULL,
    "D10" float NOT NULL,
    "D11" float NOT NULL,
    "D12" float NOT NULL,
    "RecType" smallint NOT NULL,
    "Date1" datetime NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "CM6" int NOT NULL,
    "Date2" datetime NOT NULL,
    "Date3" datetime NOT NULL,
    "M1" ntext NOT NULL,
    "D13" float NOT NULL,
    "D14" float NOT NULL,
    "D15" float NOT NULL,
    "D16" float NOT NULL,
    "SrNo" smallint NOT NULL
);
CREATE INDEX 03 ON "MasterSupport"("CM2");
CREATE INDEX 04 ON "MasterSupport"("CM3");
CREATE INDEX 11 ON "MasterSupport"("MasterCode");
CREATE INDEX 12 ON "MasterSupport"("CM1");
CREATE INDEX 13 ON "MasterSupport"("MasterType");
CREATE INDEX 14 ON "MasterSupport"("Date");
CREATE INDEX 15 ON "MasterSupport"("I1");
CREATE INDEX 16 ON "MasterSupport"("I2");
CREATE INDEX 17 ON "MasterSupport"("C1");
CREATE INDEX 18 ON "MasterSupport"("RecType");
CREATE INDEX 19 ON "MasterSupport"("Date1");
CREATE INDEX 20 ON "MasterSupport"("CM4");
CREATE INDEX 21 ON "MasterSupport"("CM5");
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"MasterCode" DEFAULT ((0)) FOR "MasterCode";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D7" DEFAULT ((0)) FOR "D7";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I4" DEFAULT ((0)) FOR "I4";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I5" DEFAULT ((0)) FOR "I5";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I6" DEFAULT ((0)) FOR "I6";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I7" DEFAULT ((0)) FOR "I7";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I8" DEFAULT ((0)) FOR "I8";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"I9" DEFAULT ((0)) FOR "I9";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"MasterType" DEFAULT ((0)) FOR "MasterType";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"B6" DEFAULT '((0))' FOR "B6";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D8" DEFAULT ((0)) FOR "D8";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D9" DEFAULT ((0)) FOR "D9";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D10" DEFAULT ((0)) FOR "D10";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D11" DEFAULT ((0)) FOR "D11";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D12" DEFAULT ((0)) FOR "D12";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"CM6" DEFAULT ((0)) FOR "CM6";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"Date2" DEFAULT '((0))' FOR "Date2";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"Date3" DEFAULT '((0))' FOR "Date3";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D13" DEFAULT ((0)) FOR "D13";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D14" DEFAULT ((0)) FOR "D14";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D15" DEFAULT ((0)) FOR "D15";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"D16" DEFAULT ((0)) FOR "D16";
ALTER TABLE "dbo"."MasterSupport" ADD CONSTRAINT DF_MasterSupport_"SrNo" DEFAULT ((0)) FOR "SrNo";

DROP TABLE IF EXISTS "MastFootPrint";
CREATE TABLE "MastFootPrint"(
    "MasterCode" int NOT NULL,
    "Name" nvarchar(40) NOT NULL,
    "MasterType" smallint NOT NULL,
    "Stamp" int NOT NULL,
    "PartialFP" ntext NOT NULL,
    "RemainFP" ntext NOT NULL
);
CREATE INDEX 01 ON "MastFootPrint"("MasterCode");
CREATE INDEX 02 ON "MastFootPrint"("MasterType","Name");
ALTER TABLE "dbo"."MastFootPrint" ADD CONSTRAINT DF_MastFootPrint_"MasterCode" DEFAULT ((0)) FOR "MasterCode";
ALTER TABLE "dbo"."MastFootPrint" ADD CONSTRAINT DF_MastFootPrint_"MasterType" DEFAULT ((0)) FOR "MasterType";
ALTER TABLE "dbo"."MastFootPrint" ADD CONSTRAINT DF_MastFootPrint_"Stamp" DEFAULT ((0)) FOR "Stamp";

DROP TABLE IF EXISTS "OEDDet";
CREATE TABLE "OEDDet"(
    "VchCode" int NOT NULL,
    "OEDRate" float NOT NULL,
    "OEDAmount" float NOT NULL,
    "CessRate" float NOT NULL,
    "CessAmount" float NOT NULL,
    "HECessRate" float NOT NULL,
    "HECessAmount" float NOT NULL,
    "D1" float NOT NULL,
    "I1" smallint NOT NULL,
    "L1" int NOT NULL
);
CREATE INDEX 01 ON "OEDDet"("VchCode");
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"OEDRate" DEFAULT ((0)) FOR "OEDRate";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"OEDAmount" DEFAULT ((0)) FOR "OEDAmount";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"CessRate" DEFAULT ((0)) FOR "CessRate";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"CessAmount" DEFAULT ((0)) FOR "CessAmount";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"HECessRate" DEFAULT ((0)) FOR "HECessRate";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"HECessAmount" DEFAULT ((0)) FOR "HECessAmount";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."OEDDet" ADD CONSTRAINT DF_OEDDet_"L1" DEFAULT ((0)) FOR "L1";

DROP TABLE IF EXISTS "OrgSalePurc";
CREATE TABLE "OrgSalePurc"(
    "VchCode" int NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "VchDate" datetime NOT NULL,
    "TaxableAmt" float NOT NULL,
    "TaxAmt" float NOT NULL,
    "TaxAmt1" float NOT NULL,
    "SchgAmt" float NOT NULL,
    "RegType" smallint NOT NULL
);
CREATE INDEX 01 ON "OrgSalePurc"("VchCode");
ALTER TABLE "dbo"."OrgSalePurc" ADD CONSTRAINT DF_OrgSalePurc_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."OrgSalePurc" ADD CONSTRAINT DF_OrgSalePurc_"VchDate" DEFAULT '((0))' FOR "VchDate";
ALTER TABLE "dbo"."OrgSalePurc" ADD CONSTRAINT DF_OrgSalePurc_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."OrgSalePurc" ADD CONSTRAINT DF_OrgSalePurc_"TaxAmt" DEFAULT ((0)) FOR "TaxAmt";
ALTER TABLE "dbo"."OrgSalePurc" ADD CONSTRAINT DF_OrgSalePurc_"TaxAmt1" DEFAULT ((0)) FOR "TaxAmt1";
ALTER TABLE "dbo"."OrgSalePurc" ADD CONSTRAINT DF_OrgSalePurc_"SchgAmt" DEFAULT ((0)) FOR "SchgAmt";
ALTER TABLE "dbo"."OrgSalePurc" ADD CONSTRAINT DF_OrgSalePurc_"RegType" DEFAULT ((0)) FOR "RegType";

DROP TABLE IF EXISTS "PackingDetails";
CREATE TABLE "PackingDetails"(
    "SrNo" int NOT NULL,
    "VchCode" int NOT NULL,
    "PackageNo" nvarchar(255) NOT NULL,
    "Weight" float NOT NULL,
    "EstimatedValue" float NOT NULL,
    "Size" nvarchar(255) NOT NULL,
    "Description" nvarchar(255) NOT NULL,
    "Remarks" nvarchar(255) NOT NULL,
    "MarkaNo" nvarchar(255) NOT NULL,
    "Quantity" float NOT NULL,
    "Unit" int NOT NULL,
    "PackingMode" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "PackingDetails"("SrNo");
CREATE INDEX 03 ON "PackingDetails"("VchCode");
CREATE INDEX 02 ON "PackingDetails"("PackageNo");
CREATE INDEX 04 ON "PackingDetails"("Unit");
ALTER TABLE "dbo"."PackingDetails" ADD CONSTRAINT DF_PackingDetails_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."PackingDetails" ADD CONSTRAINT DF_PackingDetails_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."PackingDetails" ADD CONSTRAINT DF_PackingDetails_"Weight" DEFAULT ((0)) FOR "Weight";
ALTER TABLE "dbo"."PackingDetails" ADD CONSTRAINT DF_PackingDetails_"EstimatedValue" DEFAULT ((0)) FOR "EstimatedValue";
ALTER TABLE "dbo"."PackingDetails" ADD CONSTRAINT DF_PackingDetails_"Quantity" DEFAULT ((0)) FOR "Quantity";
ALTER TABLE "dbo"."PackingDetails" ADD CONSTRAINT DF_PackingDetails_"Unit" DEFAULT ((0)) FOR "Unit";

DROP TABLE IF EXISTS "Patches";
CREATE TABLE "Patches"(
    "DummyFld" bit NOT NULL,
    "MasterNotes" bit NOT NULL,
    "MBO" bit NOT NULL,
    "UFSU" bit NOT NULL,
    "DUFITC" bit NOT NULL,
    "CheckList" bit NOT NULL,
    "SPACC" bit NOT NULL,
    "UMBDB1" bit NOT NULL,
    "BCNAltQty" bit NOT NULL,
    "UMB1" bit NOT NULL,
    "ExpBatch" bit NOT NULL,
    "QuoteDefaultSeries" bit NOT NULL,
    "BatchStkTfr" bit NOT NULL,
    "ImpactBSSalePurc" bit NOT NULL,
    "DiscMarkupConfig" bit NOT NULL,
    "PickQtnAltQty" bit NOT NULL,
    "VchAudit" bit NOT NULL,
    "DiscHelpData" bit NOT NULL,
    "ItemSrNoLen" bit NOT NULL,
    "SalaryDefaultSeries" bit NOT NULL,
    "FinalResults" bit NOT NULL,
    "PDCT3" bit NOT NULL,
    "PaidDays" bit NOT NULL,
    "PUSJMC" bit NOT NULL,
    "CRSalesDefaultSeries" bit NOT NULL,
    "UFRD" bit NOT NULL,
    "DefaultSettlementMode" bit NOT NULL,
    "DefaultExciseType" bit NOT NULL,
    "BatchDate" smallint NOT NULL,
    "IndentDefaultSeries" bit NOT NULL,
    "UserRights" bit NOT NULL,
    "AccCodes" bit NOT NULL,
    "ItemMastDefaultPrice" bit NOT NULL,
    "ItemMastTreatMRPAsSP" bit NOT NULL,
    "Help1AddnInfo" bit NOT NULL,
    "ItemParamNettAmt" bit NOT NULL,
    "PricingModeDiscConfig" bit NOT NULL,
    "PIRDiscAmt" bit NOT NULL,
    "UpgradeForSchemeMast" bit NOT NULL,
    "UpgradeForTaxCategory" bit NOT NULL,
    "UpgradeForSTPTinHelp1" bit NOT NULL,
    "RCMPURC" bit NOT NULL,
    "GSTSumItemWiseFields" bit NOT NULL,
    "VchGSTSumItemWiseLocType" bit NOT NULL,
    "UpdateStateAndTypeOfDealerInVchGST" bit NOT NULL,
    "GSTAdvanceAmt" bit NOT NULL,
    "UpgradeForNoneUnit" bit NOT NULL,
    "GSTPurcBillNo" bit NOT NULL,
    "StateMastOtherUpgrade" bit NOT NULL,
    "UpdateRCMAccTaxType" bit NOT NULL,
    "UNITINHSN" bit NOT NULL,
    "ItemMastTaxInclFld" bit NOT NULL,
    "QLFld" bit NOT NULL,
    "UPGUAE" bit NOT NULL,
    "EWAYBILL" bit NOT NULL,
    "EWAYBILLCONFIG" bit NOT NULL,
    "UpdateRegExpenseAccName" bit NOT NULL,
    "POSItemAliasFld" bit NOT NULL,
    "ConfigUAE" bit NOT NULL,
    "ConfigEWayBill" bit NOT NULL,
    "ITEMSPACC" bit NOT NULL,
    "UMBSV" bit NOT NULL,
    "ItemCategory" bit NOT NULL,
    "AccountCategory" bit NOT NULL,
    "UFOESA" bit NOT NULL,
    "DUFBAF" bit NOT NULL,
    "UVGS" bit NOT NULL,
    "RESAVEGSTR1JSON" bit NOT NULL,
    "GroupParamOnSP" bit NOT NULL,
    "ITEMBCN" bit NOT NULL,
    "UFTDSCAT" bit NOT NULL,
    "UFTCSTDS" bit NOT NULL,
    "MRPNegativeStockWarning" smallint NOT NULL,
    "ItemParamCriticalLevelUpdate" bit NOT NULL,
    "TEMCWiseRef" bit NOT NULL,
    "SupplierDutyDet" bit NOT NULL,
    "StateCodesUpdate" bit NOT NULL,
    "UpdateShowTaxSummary" bit NOT NULL,
    "CountryCodesUpdate" bit NOT NULL,
    "UpdateCurCodeInCurrency" bit NOT NULL,
    "RevisionNoLen" bit NOT NULL,
    "UpdateHelp1" bit NOT NULL,
    "MAVchListing" bit NOT NULL,
    "UpdateSBIFormat" bit NOT NULL
);
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"DummyFld" DEFAULT '((0))' FOR "DummyFld";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"MasterNotes" DEFAULT '((0))' FOR "MasterNotes";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"MBO" DEFAULT '((0))' FOR "MBO";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UFSU" DEFAULT '((0))' FOR "UFSU";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"DUFITC" DEFAULT '((0))' FOR "DUFITC";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"CheckList" DEFAULT '((0))' FOR "CheckList";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"SPACC" DEFAULT '((0))' FOR "SPACC";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UMBDB1" DEFAULT '((0))' FOR "UMBDB1";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"BCNAltQty" DEFAULT '((0))' FOR "BCNAltQty";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UMB1" DEFAULT '((0))' FOR "UMB1";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ExpBatch" DEFAULT '((0))' FOR "ExpBatch";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"QuoteDefaultSeries" DEFAULT '((0))' FOR "QuoteDefaultSeries";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"BatchStkTfr" DEFAULT '((0))' FOR "BatchStkTfr";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ImpactBSSalePurc" DEFAULT '((0))' FOR "ImpactBSSalePurc";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"DiscMarkupConfig" DEFAULT '((0))' FOR "DiscMarkupConfig";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"PickQtnAltQty" DEFAULT '((0))' FOR "PickQtnAltQty";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"VchAudit" DEFAULT '((0))' FOR "VchAudit";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"DiscHelpData" DEFAULT '((0))' FOR "DiscHelpData";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ItemSrNoLen" DEFAULT '((0))' FOR "ItemSrNoLen";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"SalaryDefaultSeries" DEFAULT '((0))' FOR "SalaryDefaultSeries";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"FinalResults" DEFAULT '((0))' FOR "FinalResults";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"PDCT3" DEFAULT '((0))' FOR "PDCT3";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"PaidDays" DEFAULT '((0))' FOR "PaidDays";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"PUSJMC" DEFAULT '((0))' FOR "PUSJMC";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"CRSalesDefaultSeries" DEFAULT '((0))' FOR "CRSalesDefaultSeries";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UFRD" DEFAULT '((0))' FOR "UFRD";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"DefaultSettlementMode" DEFAULT '((0))' FOR "DefaultSettlementMode";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"DefaultExciseType" DEFAULT '((0))' FOR "DefaultExciseType";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"BatchDate" DEFAULT ((0)) FOR "BatchDate";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"IndentDefaultSeries" DEFAULT '((0))' FOR "IndentDefaultSeries";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UserRights" DEFAULT '((0))' FOR "UserRights";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"AccCodes" DEFAULT '((0))' FOR "AccCodes";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ItemMastDefaultPrice" DEFAULT '((0))' FOR "ItemMastDefaultPrice";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ItemMastTreatMRPAsSP" DEFAULT '((0))' FOR "ItemMastTreatMRPAsSP";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"Help1AddnInfo" DEFAULT '((0))' FOR "Help1AddnInfo";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ItemParamNettAmt" DEFAULT '((0))' FOR "ItemParamNettAmt";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"PricingModeDiscConfig" DEFAULT '((0))' FOR "PricingModeDiscConfig";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"PIRDiscAmt" DEFAULT '((0))' FOR "PIRDiscAmt";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpgradeForSchemeMast" DEFAULT '((0))' FOR "UpgradeForSchemeMast";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpgradeForTaxCategory" DEFAULT '((0))' FOR "UpgradeForTaxCategory";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpgradeForSTPTinHelp1" DEFAULT '((0))' FOR "UpgradeForSTPTinHelp1";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"RCMPURC" DEFAULT '((0))' FOR "RCMPURC";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"GSTSumItemWiseFields" DEFAULT '((0))' FOR "GSTSumItemWiseFields";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"VchGSTSumItemWiseLocType" DEFAULT '((0))' FOR "VchGSTSumItemWiseLocType";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpdateStateAndTypeOfDealerInVchGST" DEFAULT '((0))' FOR "UpdateStateAndTypeOfDealerInVchGST";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"GSTAdvanceAmt" DEFAULT '((0))' FOR "GSTAdvanceAmt";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpgradeForNoneUnit" DEFAULT '((0))' FOR "UpgradeForNoneUnit";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"GSTPurcBillNo" DEFAULT '((0))' FOR "GSTPurcBillNo";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"StateMastOtherUpgrade" DEFAULT '((0))' FOR "StateMastOtherUpgrade";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpdateRCMAccTaxType" DEFAULT '((0))' FOR "UpdateRCMAccTaxType";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UNITINHSN" DEFAULT '((0))' FOR "UNITINHSN";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ItemMastTaxInclFld" DEFAULT '((0))' FOR "ItemMastTaxInclFld";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"QLFld" DEFAULT '((0))' FOR "QLFld";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UPGUAE" DEFAULT '((0))' FOR "UPGUAE";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"EWAYBILL" DEFAULT '((0))' FOR "EWAYBILL";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"EWAYBILLCONFIG" DEFAULT '((0))' FOR "EWAYBILLCONFIG";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpdateRegExpenseAccName" DEFAULT '((0))' FOR "UpdateRegExpenseAccName";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"POSItemAliasFld" DEFAULT '((0))' FOR "POSItemAliasFld";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ConfigUAE" DEFAULT '((0))' FOR "ConfigUAE";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ConfigEWayBill" DEFAULT '((0))' FOR "ConfigEWayBill";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ITEMSPACC" DEFAULT '((0))' FOR "ITEMSPACC";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UMBSV" DEFAULT '((0))' FOR "UMBSV";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ItemCategory" DEFAULT '((0))' FOR "ItemCategory";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"AccountCategory" DEFAULT '((0))' FOR "AccountCategory";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UFOESA" DEFAULT '((0))' FOR "UFOESA";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"DUFBAF" DEFAULT '((0))' FOR "DUFBAF";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UVGS" DEFAULT '((0))' FOR "UVGS";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"RESAVEGSTR1JSON" DEFAULT '((0))' FOR "RESAVEGSTR1JSON";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"GroupParamOnSP" DEFAULT '((0))' FOR "GroupParamOnSP";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ITEMBCN" DEFAULT '((0))' FOR "ITEMBCN";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UFTDSCAT" DEFAULT '((0))' FOR "UFTDSCAT";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UFTCSTDS" DEFAULT '((0))' FOR "UFTCSTDS";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"MRPNegativeStockWarning" DEFAULT ((0)) FOR "MRPNegativeStockWarning";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"ItemParamCriticalLevelUpdate" DEFAULT '((0))' FOR "ItemParamCriticalLevelUpdate";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"TEMCWiseRef" DEFAULT '((0))' FOR "TEMCWiseRef";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"SupplierDutyDet" DEFAULT '((0))' FOR "SupplierDutyDet";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"StateCodesUpdate" DEFAULT '((0))' FOR "StateCodesUpdate";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpdateShowTaxSummary" DEFAULT '((0))' FOR "UpdateShowTaxSummary";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"CountryCodesUpdate" DEFAULT '((0))' FOR "CountryCodesUpdate";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpdateCurCodeInCurrency" DEFAULT '((0))' FOR "UpdateCurCodeInCurrency";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"RevisionNoLen" DEFAULT '((0))' FOR "RevisionNoLen";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpdateHelp1" DEFAULT '((0))' FOR "UpdateHelp1";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"MAVchListing" DEFAULT '((0))' FOR "MAVchListing";
ALTER TABLE "dbo"."Patches" ADD CONSTRAINT DF_Patches_"UpdateSBIFormat" DEFAULT '((0))' FOR "UpdateSBIFormat";

DROP TABLE IF EXISTS "PhyStkSubDet";
CREATE TABLE "PhyStkSubDet"(
    "RecType" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "DueDate" datetime NOT NULL,
    "No" nvarchar(25) NOT NULL,
    "Value1" float NOT NULL,
    "Value2" float NOT NULL,
    "Value3" float NOT NULL,
    "Balance1" float NOT NULL,
    "Balance2" float NOT NULL,
    "Balance3" float NOT NULL,
    "ItemSrNo" smallint NOT NULL,
    "MfgDate" datetime NOT NULL,
    "NewRefAmount" float NOT NULL,
    "MonthVal" smallint NOT NULL,
    "WarrantyMonth" smallint NOT NULL,
    "OrgDate" datetime NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "C3" nvarchar(255) NOT NULL,
    "C4" nvarchar(255) NOT NULL,
    "C5" nvarchar(255) NOT NULL,
    "C6" nvarchar(255) NOT NULL,
    "C7" nvarchar(255) NOT NULL,
    "C8" nvarchar(255) NOT NULL,
    "C9" nvarchar(255) NOT NULL,
    "C10" nvarchar(255) NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "B1" bit NOT NULL
);
CREATE INDEX 01 ON "PhyStkSubDet"("MasterCode1");
CREATE INDEX 02 ON "PhyStkSubDet"("MasterCode2");
CREATE INDEX 03 ON "PhyStkSubDet"("Date");
CREATE INDEX 04 ON "PhyStkSubDet"("VchType");
CREATE INDEX 05 ON "PhyStkSubDet"("VchCode");
CREATE INDEX 06 ON "PhyStkSubDet"("RecType");
CREATE INDEX 07 ON "PhyStkSubDet"("SrNo");
CREATE INDEX 08 ON "PhyStkSubDet"("No");
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"DueDate" DEFAULT '((0))' FOR "DueDate";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"Value3" DEFAULT ((0)) FOR "Value3";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"Balance1" DEFAULT ((0)) FOR "Balance1";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"Balance2" DEFAULT ((0)) FOR "Balance2";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"Balance3" DEFAULT ((0)) FOR "Balance3";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"ItemSrNo" DEFAULT ((0)) FOR "ItemSrNo";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"MfgDate" DEFAULT '((0))' FOR "MfgDate";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"NewRefAmount" DEFAULT ((0)) FOR "NewRefAmount";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"MonthVal" DEFAULT ((0)) FOR "MonthVal";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"WarrantyMonth" DEFAULT ((0)) FOR "WarrantyMonth";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"OrgDate" DEFAULT '((0))' FOR "OrgDate";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."PhyStkSubDet" ADD CONSTRAINT DF_PhyStkSubDet_"B1" DEFAULT '((0))' FOR "B1";

DROP TABLE IF EXISTS "POSDet";
CREATE TABLE "POSDet"(
    "VchCode" int NOT NULL,
    "CashAmt" float NOT NULL,
    "ChequeAmt" float NOT NULL,
    "CCAmt1" float NOT NULL,
    "CCAmt2" float NOT NULL,
    "CCAmt3" float NOT NULL,
    "CashNarr" nvarchar(40) NOT NULL,
    "ChequeNarr" nvarchar(40) NOT NULL,
    "CCNarr1" nvarchar(40) NOT NULL,
    "CCNarr2" nvarchar(40) NOT NULL,
    "CCNarr3" nvarchar(40) NOT NULL,
    "CashRecdAmt" float NOT NULL,
    "CashAccCode" int NOT NULL,
    "CCAccCode1" int NOT NULL,
    "CCAccCode2" int NOT NULL,
    "CCAccCode3" int NOT NULL,
    "ChequeAccCode" int NOT NULL
);
CREATE INDEX 01 ON "POSDet"("VchCode");
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CashAmt" DEFAULT ((0)) FOR "CashAmt";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"ChequeAmt" DEFAULT ((0)) FOR "ChequeAmt";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CCAmt1" DEFAULT ((0)) FOR "CCAmt1";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CCAmt2" DEFAULT ((0)) FOR "CCAmt2";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CCAmt3" DEFAULT ((0)) FOR "CCAmt3";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CashRecdAmt" DEFAULT ((0)) FOR "CashRecdAmt";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CashAccCode" DEFAULT ((0)) FOR "CashAccCode";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CCAccCode1" DEFAULT ((0)) FOR "CCAccCode1";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CCAccCode2" DEFAULT ((0)) FOR "CCAccCode2";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"CCAccCode3" DEFAULT ((0)) FOR "CCAccCode3";
ALTER TABLE "dbo"."POSDet" ADD CONSTRAINT DF_POSDet_"ChequeAccCode" DEFAULT ((0)) FOR "ChequeAccCode";

DROP TABLE IF EXISTS "QueryLog";
CREATE TABLE "QueryLog"(
    "UserName" nvarchar(20) NOT NULL,
    "Date" datetime NOT NULL,
    "Qry" ntext NOT NULL,
    "RecType" smallint NOT NULL,
    "ErrStr" ntext NOT NULL
);
CREATE INDEX 01 ON "QueryLog"("Date");
CREATE INDEX 02 ON "QueryLog"("RecType");
ALTER TABLE "dbo"."QueryLog" ADD CONSTRAINT DF_QueryLog_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."QueryLog" ADD CONSTRAINT DF_QueryLog_"RecType" DEFAULT ((0)) FOR "RecType";

DROP TABLE IF EXISTS "RCCDetails";
CREATE TABLE "RCCDetails"(
    "Template" int,
    "Rectype" int,
    "SN" int,
    "Email" varchar(50),
    "Department" int,
    "GroupID" varchar(100),
    "MastField" varchar(100),
    "Vchtype" int,
    "TType" int,
    "SSeriescode" int,
    "MsgType" int
);

DROP TABLE IF EXISTS "RepColSize";
CREATE TABLE "RepColSize"(
    "RepID" smallint NOT NULL,
    "SubID" smallint NOT NULL,
    "ColID" smallint NOT NULL,
    "ColSize" int NOT NULL,
    "FormatName" nvarchar(35) NOT NULL,
    "CustomRepFormatName" nvarchar(255) NOT NULL,
    "WideScreen" bit NOT NULL
);
CREATE INDEX 01 ON "RepColSize"("RepID");
CREATE INDEX 02 ON "RepColSize"("RepID","SubID");
ALTER TABLE "dbo"."RepColSize" ADD CONSTRAINT DF_RepColSize_"RepID" DEFAULT ((0)) FOR "RepID";
ALTER TABLE "dbo"."RepColSize" ADD CONSTRAINT DF_RepColSize_"SubID" DEFAULT ((0)) FOR "SubID";
ALTER TABLE "dbo"."RepColSize" ADD CONSTRAINT DF_RepColSize_"ColID" DEFAULT ((0)) FOR "ColID";
ALTER TABLE "dbo"."RepColSize" ADD CONSTRAINT DF_RepColSize_"ColSize" DEFAULT ((0)) FOR "ColSize";
ALTER TABLE "dbo"."RepColSize" ADD CONSTRAINT DF_RepColSize_"WideScreen" DEFAULT '((0))' FOR "WideScreen";

DROP TABLE IF EXISTS "RepOptValues";
CREATE TABLE "RepOptValues"(
    "RepID" smallint NOT NULL,
    "ReportType" smallint NOT NULL,
    "ValueType" smallint NOT NULL,
    "Value" nvarchar(255) NOT NULL,
    "MasterType" smallint NOT NULL,
    "FieldID" smallint NOT NULL,
    "FieldValue" ntext NOT NULL,
    "SubRepID" smallint NOT NULL,
    "FormatName" nvarchar(40) NOT NULL
);
CREATE INDEX 01 ON "RepOptValues"("RepID","ReportType");
ALTER TABLE "dbo"."RepOptValues" ADD CONSTRAINT DF_RepOptValues_"RepID" DEFAULT ((0)) FOR "RepID";
ALTER TABLE "dbo"."RepOptValues" ADD CONSTRAINT DF_RepOptValues_"ReportType" DEFAULT ((0)) FOR "ReportType";
ALTER TABLE "dbo"."RepOptValues" ADD CONSTRAINT DF_RepOptValues_"ValueType" DEFAULT ((0)) FOR "ValueType";
ALTER TABLE "dbo"."RepOptValues" ADD CONSTRAINT DF_RepOptValues_"MasterType" DEFAULT ((0)) FOR "MasterType";
ALTER TABLE "dbo"."RepOptValues" ADD CONSTRAINT DF_RepOptValues_"FieldID" DEFAULT ((0)) FOR "FieldID";
ALTER TABLE "dbo"."RepOptValues" ADD CONSTRAINT DF_RepOptValues_"SubRepID" DEFAULT ((0)) FOR "SubRepID";

DROP TABLE IF EXISTS "ReportNotes";
CREATE TABLE "ReportNotes"(
    "NoteID" int NOT NULL,
    "RepID" smallint NOT NULL,
    "SubRepID" smallint NOT NULL,
    "NoteRepID" smallint NOT NULL,
    "MasterCode" int NOT NULL,
    "UserName" nvarchar(255) NOT NULL,
    "Date" datetime NOT NULL,
    "Description" ntext NOT NULL,
    "NotesCarried" bit NOT NULL,
    "FinYear" datetime NOT NULL
);
CREATE INDEX 01 ON "ReportNotes"("NoteID");
CREATE INDEX 02 ON "ReportNotes"("RepID");
CREATE INDEX 03 ON "ReportNotes"("SubRepID");
CREATE INDEX 04 ON "ReportNotes"("NoteRepID");
CREATE INDEX 05 ON "ReportNotes"("MasterCode");
CREATE INDEX 06 ON "ReportNotes"("UserName");
CREATE INDEX 07 ON "ReportNotes"("Date");
CREATE INDEX 08 ON "ReportNotes"("NotesCarried");
CREATE INDEX 09 ON "ReportNotes"("FinYear");
ALTER TABLE "dbo"."ReportNotes" ADD CONSTRAINT DF_ReportNotes_"NoteID" DEFAULT ((0)) FOR "NoteID";
ALTER TABLE "dbo"."ReportNotes" ADD CONSTRAINT DF_ReportNotes_"RepID" DEFAULT ((0)) FOR "RepID";
ALTER TABLE "dbo"."ReportNotes" ADD CONSTRAINT DF_ReportNotes_"SubRepID" DEFAULT ((0)) FOR "SubRepID";
ALTER TABLE "dbo"."ReportNotes" ADD CONSTRAINT DF_ReportNotes_"NoteRepID" DEFAULT ((0)) FOR "NoteRepID";
ALTER TABLE "dbo"."ReportNotes" ADD CONSTRAINT DF_ReportNotes_"MasterCode" DEFAULT ((0)) FOR "MasterCode";
ALTER TABLE "dbo"."ReportNotes" ADD CONSTRAINT DF_ReportNotes_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."ReportNotes" ADD CONSTRAINT DF_ReportNotes_"NotesCarried" DEFAULT '((0))' FOR "NotesCarried";
ALTER TABLE "dbo"."ReportNotes" ADD CONSTRAINT DF_ReportNotes_"FinYear" DEFAULT '((0))' FOR "FinYear";

DROP TABLE IF EXISTS "RTemplateAccMaster";
CREATE TABLE "RTemplateAccMaster"(
    "Template" int,
    "SN" int,
    "TpAcc" int,
    "Contact" varchar(200),
    "MBNo" varchar(200),
    "EMail" varchar(200),
    "MsgType" int,
    "Send" int,
    "Rectype" int,
    "DOB" datetime,
    "DOA" datetime,
    "I1" int,
    "Amount" float
);

DROP TABLE IF EXISTS "RTemplateMaster";
CREATE TABLE "RTemplateMaster"(
    "Code" int IDENTITY(1,1) NOT NULL,
    "Name" varchar(50),
    "Mode" int,
    "SalesManCC" int,
    "PickWhatsApp" int,
    "Frequency" int,
    "TpTime" datetime,
    "TpDay" int,
    "PendingBills" int,
    "ChkGrace1" int,
    "GDays1" int,
    "OverDue" int,
    "ChkGrace2" int,
    "GDays2" int,
    "EarlyReminder" int,
    "ChkGrace3" int,
    "GDays3" int,
    "Paylink" int,
    "ExpDays" int,
    "PayMode" int,
    "ChkLedger" int,
    "LedgerYear" int,
    "ChkAgeing" int,
    "ChkAgeingfifo" int,
    "NoInvoices" int,
    "ChkDocAttach" int,
    "ChkInline" int,
    "TPSubject" varchar(250),
    "ChkShowParty" int,
    "TpBody" text,
    "GrpCode" int,
    "SalesmanCode" int,
    "OFNO" int,
    "OFData" varchar(40),
    "AccCat" int,
    "Username" varchar(40),
    "SSL" int,
    "TpBody2" text,
    "chkLedgerRec" int,
    "MasterType" int,
    "DtDate" datetime,
    "Closing" float,
    "SalesRef" int,
    "MinBal" float,
    "BalLimitPer" float,
    "Broker" int,
    "BrokerCode" int,
    "TemplateStatus" int,
    "Vchtype" int,
    "I1" int,
    "I2" int,
    "D1" float,
    "D2" float,
    "I3" int,
    "AccCode" int,
    "AccType" int,
    "ItemCode" int,
    "Itemtype" int,
    "DtType" int,
    dt1 datetime,
    dt2 datetime,
    "MCType" int,
    "mCCode" int,
    "FileName" varchar(250),
    "FileExt" varchar(10),
    "FileName1" varchar(250),
    "FileExt1" varchar(10),
    "FileName2" varchar(250),
    "FileExt2" varchar(10),
    "FileName3" varchar(250),
    "FileExt3" varchar(10),
    "FileName4" varchar(250),
    "FileExt4" varchar(10),
    "Balance" float,
    "ChkFifoDays" int,
    "FifoDays" float,
    "ChkBillNarr" int,
    "Filename5" varchar(250),
    "Filename6" varchar(250),
    "I4" int,
    "CM1" int,
    "I5" int,
    "SendBodyInPDF" int,
    "CreationDt" datetime,
    "CreatedBy" varchar(40),
    "ModifyOn" datetime,
    "ModifyBy" varchar(40),
    "DayBasis" int,
    "TpBody1" text,
    "dtDate1" datetime
);

DROP TABLE IF EXISTS "RTemplateMonthDays";
CREATE TABLE "RTemplateMonthDays"(
    "TempCode" int,
    "SNO" int,
    days int,
    "DValue" float
);

DROP TABLE IF EXISTS "STDet";
CREATE TABLE "STDet"(
    "VchCode" int NOT NULL,
    "STCategory" smallint NOT NULL,
    "STAssValue" float NOT NULL,
    "STRate" float NOT NULL,
    "SBCRate" float NOT NULL,
    "KKCRate" float NOT NULL,
    "STCessRate" float NOT NULL,
    "STHECessRate" float NOT NULL
);
CREATE INDEX 01 ON "STDet"("VchCode");
ALTER TABLE "dbo"."STDet" ADD CONSTRAINT DF_STDet_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."STDet" ADD CONSTRAINT DF_STDet_"STCategory" DEFAULT ((0)) FOR "STCategory";
ALTER TABLE "dbo"."STDet" ADD CONSTRAINT DF_STDet_"STAssValue" DEFAULT ((0)) FOR "STAssValue";
ALTER TABLE "dbo"."STDet" ADD CONSTRAINT DF_STDet_"STRate" DEFAULT ((0)) FOR "STRate";
ALTER TABLE "dbo"."STDet" ADD CONSTRAINT DF_STDet_"SBCRate" DEFAULT ((0)) FOR "SBCRate";
ALTER TABLE "dbo"."STDet" ADD CONSTRAINT DF_STDet_"KKCRate" DEFAULT ((0)) FOR "KKCRate";
ALTER TABLE "dbo"."STDet" ADD CONSTRAINT DF_STDet_"STCessRate" DEFAULT ((0)) FOR "STCessRate";
ALTER TABLE "dbo"."STDet" ADD CONSTRAINT DF_STDet_"STHECessRate" DEFAULT ((0)) FOR "STHECessRate";

DROP TABLE IF EXISTS "TaskMonthDays";
CREATE TABLE "TaskMonthDays"(
    "rptID" int,
    "Sno" int,
    "Days" int
);

DROP TABLE IF EXISTS "TCS";
CREATE TABLE "TCS"(
    "Method" smallint NOT NULL,
    "RefNo" nvarchar(25) NOT NULL,
    "RefCode" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "EntryDate" datetime NOT NULL,
    "DateOfCredit" datetime NOT NULL,
    "VchAmt" float NOT NULL,
    "TCSRate" float NOT NULL,
    "TCSAmt" float NOT NULL,
    "SurchargeRate" float NOT NULL,
    "SurchargeAmt" float NOT NULL,
    "Interest" float NOT NULL,
    "OtherAmt" float NOT NULL,
    "LowerRate" bit NOT NULL,
    "Reason" nvarchar(20) NOT NULL,
    "ChallanNo" nvarchar(20) NOT NULL,
    "ChequeNo" nvarchar(20) NOT NULL,
    "ChequeDate" datetime NOT NULL,
    "Quarter" smallint NOT NULL,
    "RecType" smallint NOT NULL,
    "CategoryCode" nvarchar(20) NOT NULL,
    "SubCategoryCode" nvarchar(20) NOT NULL,
    "BSRCode" nvarchar(255) NOT NULL
);
CREATE INDEX 01 ON "TCS"("MasterCode2");
CREATE INDEX 02 ON "TCS"("Method");
CREATE INDEX 03 ON "TCS"("EntryDate");
CREATE INDEX 04 ON "TCS"("VchCode");
CREATE INDEX 05 ON "TCS"("MasterCode1");
CREATE INDEX 06 ON "TCS"("RefNo");
CREATE INDEX 07 ON "TCS"("SrNo");
CREATE INDEX 08 ON "TCS"("RefCode");
CREATE INDEX 09 ON "TCS"("RecType");
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"Method" DEFAULT ((0)) FOR "Method";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"RefCode" DEFAULT ((0)) FOR "RefCode";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"EntryDate" DEFAULT '((0))' FOR "EntryDate";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"DateOfCredit" DEFAULT '((0))' FOR "DateOfCredit";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"VchAmt" DEFAULT ((0)) FOR "VchAmt";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"TCSRate" DEFAULT ((0)) FOR "TCSRate";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"TCSAmt" DEFAULT ((0)) FOR "TCSAmt";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"SurchargeRate" DEFAULT ((0)) FOR "SurchargeRate";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"SurchargeAmt" DEFAULT ((0)) FOR "SurchargeAmt";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"Interest" DEFAULT ((0)) FOR "Interest";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"OtherAmt" DEFAULT ((0)) FOR "OtherAmt";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"LowerRate" DEFAULT '((0))' FOR "LowerRate";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"ChequeDate" DEFAULT '((0))' FOR "ChequeDate";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"Quarter" DEFAULT ((0)) FOR "Quarter";
ALTER TABLE "dbo"."TCS" ADD CONSTRAINT DF_TCS_"RecType" DEFAULT ((0)) FOR "RecType";

DROP TABLE IF EXISTS "TDS";
CREATE TABLE "TDS"(
    "Method" smallint NOT NULL,
    "RefNo" nvarchar(25) NOT NULL,
    "RefCode" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "EntryDate" datetime NOT NULL,
    "DateOfCredit" datetime NOT NULL,
    "VchAmt" float NOT NULL,
    "TDSRate" float NOT NULL,
    "TDSAmt" float NOT NULL,
    "SurchargeRate" float NOT NULL,
    "SurchargeAmt" float NOT NULL,
    "CessRate" float NOT NULL,
    "CessAmt" float NOT NULL,
    "SHECessRate" float NOT NULL,
    "SHECessAmt" float NOT NULL,
    "Interest" float NOT NULL,
    "OtherAmt" float NOT NULL,
    "LowerRate" bit NOT NULL,
    "Reason" nvarchar(20) NOT NULL,
    "CertificateNo" nvarchar(255) NOT NULL,
    "ChallanNo" nvarchar(20) NOT NULL,
    "ChequeNo" nvarchar(20) NOT NULL,
    "ChequeDate" datetime NOT NULL,
    "Quarter" smallint NOT NULL,
    "RecType" smallint NOT NULL,
    "BSRCode" nvarchar(20) NOT NULL
);
CREATE INDEX 01 ON "TDS"("MasterCode2","Method","EntryDate","VchCode");
CREATE INDEX 02 ON "TDS"("MasterCode1","Method","RefNo");
CREATE INDEX 03 ON "TDS"("VchCode","MasterCode1","SrNo");
CREATE INDEX 04 ON "TDS"("RefCode","Method");
CREATE INDEX 05 ON "TDS"("RecType");
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"Method" DEFAULT ((0)) FOR "Method";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"RefCode" DEFAULT ((0)) FOR "RefCode";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"EntryDate" DEFAULT '((0))' FOR "EntryDate";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"DateOfCredit" DEFAULT '((0))' FOR "DateOfCredit";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"VchAmt" DEFAULT ((0)) FOR "VchAmt";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"TDSRate" DEFAULT ((0)) FOR "TDSRate";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"TDSAmt" DEFAULT ((0)) FOR "TDSAmt";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"SurchargeRate" DEFAULT ((0)) FOR "SurchargeRate";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"SurchargeAmt" DEFAULT ((0)) FOR "SurchargeAmt";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"CessRate" DEFAULT ((0)) FOR "CessRate";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"CessAmt" DEFAULT ((0)) FOR "CessAmt";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"SHECessRate" DEFAULT ((0)) FOR "SHECessRate";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"SHECessAmt" DEFAULT ((0)) FOR "SHECessAmt";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"Interest" DEFAULT ((0)) FOR "Interest";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"OtherAmt" DEFAULT ((0)) FOR "OtherAmt";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"LowerRate" DEFAULT '((0))' FOR "LowerRate";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"ChequeDate" DEFAULT '((0))' FOR "ChequeDate";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"Quarter" DEFAULT ((0)) FOR "Quarter";
ALTER TABLE "dbo"."TDS" ADD CONSTRAINT DF_TDS_"RecType" DEFAULT ((0)) FOR "RecType";

DROP TABLE IF EXISTS "TradingExcise";
CREATE TABLE "TradingExcise"(
    "RefCode" int NOT NULL,
    "Stamp" int NOT NULL,
    "Method" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "RefNo" nvarchar(25) NOT NULL,
    "PartyCode" int NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "Date" datetime NOT NULL,
    "ItemCode" int NOT NULL,
    "Qty" float NOT NULL,
    "Balance" float NOT NULL,
    "Status" smallint NOT NULL,
    "AssValue" float NOT NULL,
    "DutyRate" float NOT NULL,
    "DutyType" smallint NOT NULL,
    "DutyAmt" float NOT NULL,
    "DutyRate1" float NOT NULL,
    "DutyType1" smallint NOT NULL,
    "DutyAmt1" float NOT NULL,
    "DutyRate2" float NOT NULL,
    "DutyType2" smallint NOT NULL,
    "DutyAmt2" float NOT NULL,
    "DutyRate3" float NOT NULL,
    "DutyType3" smallint NOT NULL,
    "DutyAmt3" float NOT NULL,
    "MfrQty" float NOT NULL,
    "MfrCode" int NOT NULL,
    "MfrBillNo" nvarchar(25) NOT NULL,
    "MfrBillDate" datetime NOT NULL,
    "RG23DPageNo" nvarchar(25) NOT NULL,
    "RG23DSrNo" nvarchar(25) NOT NULL,
    "AutoRG23DPageNo" int NOT NULL,
    "AutoRG23DSrNo" int NOT NULL,
    "SuppRG23DPageNo" nvarchar(25) NOT NULL,
    "SuppRG23DSrNo" nvarchar(25) NOT NULL,
    "MCCode" int NOT NULL,
    "SuppAssValue" float NOT NULL,
    "SuppDutyAmt" float NOT NULL,
    "SuppDutyAmt1" float NOT NULL,
    "SuppDutyAmt2" float NOT NULL,
    "SuppDutyAmt3" float NOT NULL,
    "CarryRefZeroQty" bit NOT NULL,
    "MfrInvoicePrepDateTime" nvarchar(25) NOT NULL,
    "MfrGoodsRemovalDateTime" nvarchar(25) NOT NULL,
    "ActualSuppAssValue" float NOT NULL,
    "ActualSuppDutyAmt" float NOT NULL,
    "ActualSuppDutyAmt1" float NOT NULL,
    "ActualSuppDutyAmt2" float NOT NULL,
    "ActualSuppDutyAmt3" float NOT NULL,
    "ActualSuppQty" float NOT NULL,
    "SuppOrgDetailsSpecified" bit NOT NULL
);
CREATE INDEX 01 ON "TradingExcise"("RefCode","Method","Date","VchType","VchNo","VchCode");
CREATE INDEX 02 ON "TradingExcise"("ItemCode","Method","Status");
CREATE INDEX 03 ON "TradingExcise"("ItemCode","Method","RefNo");
CREATE INDEX 04 ON "TradingExcise"("VchCode","ItemCode","SrNo");
CREATE INDEX 05 ON "TradingExcise"("VchCode","ItemCode","RefNo");
CREATE INDEX 06 ON "TradingExcise"("MCCode","ItemCode","Method","Status");
CREATE INDEX 07 ON "TradingExcise"("MCCode","ItemCode","Method","RefNo");
CREATE INDEX 08 ON "TradingExcise"("VchCode","MCCode","ItemCode","SrNo");
CREATE INDEX 09 ON "TradingExcise"("VchCode","MCCode","ItemCode","RefNo");
CREATE INDEX 10 ON "TradingExcise"("AutoRG23DPageNo","AutoRG23DSrNo");
CREATE INDEX 11 ON "TradingExcise"("MCCode","AutoRG23DPageNo","AutoRG23DSrNo");
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"RefCode" DEFAULT ((0)) FOR "RefCode";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"Stamp" DEFAULT ((0)) FOR "Stamp";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"Method" DEFAULT ((0)) FOR "Method";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"PartyCode" DEFAULT ((0)) FOR "PartyCode";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"ItemCode" DEFAULT ((0)) FOR "ItemCode";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"Qty" DEFAULT ((0)) FOR "Qty";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"Balance" DEFAULT ((0)) FOR "Balance";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"Status" DEFAULT ((0)) FOR "Status";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"AssValue" DEFAULT ((0)) FOR "AssValue";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyRate" DEFAULT ((0)) FOR "DutyRate";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyType" DEFAULT ((0)) FOR "DutyType";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyAmt" DEFAULT ((0)) FOR "DutyAmt";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyRate1" DEFAULT ((0)) FOR "DutyRate1";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyType1" DEFAULT ((0)) FOR "DutyType1";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyAmt1" DEFAULT ((0)) FOR "DutyAmt1";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyRate2" DEFAULT ((0)) FOR "DutyRate2";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyType2" DEFAULT ((0)) FOR "DutyType2";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyAmt2" DEFAULT ((0)) FOR "DutyAmt2";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyRate3" DEFAULT ((0)) FOR "DutyRate3";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyType3" DEFAULT ((0)) FOR "DutyType3";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"DutyAmt3" DEFAULT ((0)) FOR "DutyAmt3";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"MfrQty" DEFAULT ((0)) FOR "MfrQty";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"MfrCode" DEFAULT ((0)) FOR "MfrCode";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"MfrBillDate" DEFAULT '((0))' FOR "MfrBillDate";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"AutoRG23DPageNo" DEFAULT ((0)) FOR "AutoRG23DPageNo";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"AutoRG23DSrNo" DEFAULT ((0)) FOR "AutoRG23DSrNo";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"MCCode" DEFAULT ((0)) FOR "MCCode";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"SuppAssValue" DEFAULT ((0)) FOR "SuppAssValue";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"SuppDutyAmt" DEFAULT ((0)) FOR "SuppDutyAmt";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"SuppDutyAmt1" DEFAULT ((0)) FOR "SuppDutyAmt1";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"SuppDutyAmt2" DEFAULT ((0)) FOR "SuppDutyAmt2";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"SuppDutyAmt3" DEFAULT ((0)) FOR "SuppDutyAmt3";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"CarryRefZeroQty" DEFAULT '((0))' FOR "CarryRefZeroQty";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"ActualSuppAssValue" DEFAULT ((0)) FOR "ActualSuppAssValue";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"ActualSuppDutyAmt" DEFAULT ((0)) FOR "ActualSuppDutyAmt";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"ActualSuppDutyAmt1" DEFAULT ((0)) FOR "ActualSuppDutyAmt1";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"ActualSuppDutyAmt2" DEFAULT ((0)) FOR "ActualSuppDutyAmt2";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"ActualSuppDutyAmt3" DEFAULT ((0)) FOR "ActualSuppDutyAmt3";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"ActualSuppQty" DEFAULT ((0)) FOR "ActualSuppQty";
ALTER TABLE "dbo"."TradingExcise" ADD CONSTRAINT DF_TradingExcise_"SuppOrgDetailsSpecified" DEFAULT '((0))' FOR "SuppOrgDetailsSpecified";

DROP TABLE IF EXISTS "Tran1";
CREATE TABLE "Tran1"(
    "VchCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "StockUpdationDate" datetime NOT NULL,
    "Status" smallint NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "Stamp" int NOT NULL,
    "AutoVchNo" int NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "CM6" int NOT NULL,
    "FormRecAmt" float NOT NULL,
    "FormIssAmt" float NOT NULL,
    "CurConRate" float NOT NULL,
    "VchAmtBaseCur" float NOT NULL,
    "VchSalePurcAmt" float NOT NULL,
    "ExciseApplicable" bit NOT NULL,
    "ExciseDocName" nvarchar(20) NOT NULL,
    "ExciseValue" float NOT NULL,
    "ExciseType" smallint NOT NULL,
    "ExcisableAmount" float NOT NULL,
    "ExciseRate" float NOT NULL,
    "OrgVchAmtBaseCur" float NOT NULL,
    "TEApplicable" bit NOT NULL,
    "TDSApplicable" bit NOT NULL,
    "FormRecStatus" smallint NOT NULL,
    "FormIssStatus" smallint NOT NULL,
    "ChallanStatus" smallint NOT NULL,
    "STApplicable" bit NOT NULL,
    "STType" smallint NOT NULL,
    "DocPrinted" bit NOT NULL,
    "External" bit NOT NULL,
    "CreatedBy" nvarchar(20) NOT NULL,
    "CreationTime" datetime NOT NULL,
    "AuthorisedBy" nvarchar(20) NOT NULL,
    "AuthorisationTime" datetime NOT NULL,
    "ModifiedBy" nvarchar(20) NOT NULL,
    "ModificationTime" datetime NOT NULL,
    "PriceCategory" smallint NOT NULL,
    "VATInfo" bit NOT NULL,
    "POSEnabled" bit NOT NULL,
    "AutoGeneratedType" smallint NOT NULL,
    "VchCancelled" bit NOT NULL,
    "BrokerageMode" smallint NOT NULL,
    "Brokerage" float NOT NULL,
    "BrokerageAmt" float NOT NULL,
    "TranType" smallint NOT NULL,
    "FreeQtyUsed" bit NOT NULL,
    "Cancelled" bit NOT NULL,
    "D1" float NOT NULL,
    "ApprovalStatus" smallint NOT NULL,
    "SyncStatus" bit NOT NULL,
    "Source" smallint NOT NULL,
    "AuditStatus" smallint NOT NULL,
    "ExtraExpense" float NOT NULL,
    "ExtraExpenseNar1" nvarchar(40) NOT NULL,
    "ExtraExpenseNar2" nvarchar(40) NOT NULL,
    c1 nvarchar(255) NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "I4" smallint NOT NULL,
    "I5" smallint NOT NULL,
    "I6" smallint NOT NULL,
    "I7" smallint NOT NULL,
    "I8" smallint NOT NULL,
    "I9" smallint NOT NULL,
    "I10" smallint NOT NULL,
    "B1" bit NOT NULL,
    "TPF1" bit NOT NULL,
    "TPF2" bit NOT NULL,
    "RejectionStatus" smallint NOT NULL,
    "L1" int NOT NULL,
    "SourceDet" nvarchar(255) NOT NULL,
    "NepaliDate" nvarchar(255) NOT NULL,
    "NepaliFY" nvarchar(255) NOT NULL,
    "CM7" int NOT NULL,
    "TCSApplicable" bit NOT NULL,
    "ReturnStatus" smallint NOT NULL,
    "ReturnStatusAnnual" smallint NOT NULL,
    "GSTInfo" bit NOT NULL,
    "GSTRecType" smallint NOT NULL,
    "InputType" smallint NOT NULL,
    "GSTRepBasis" smallint NOT NULL,
    "GSTR2Status" smallint NOT NULL,
    "CheckSum" nvarchar(255) NOT NULL,
    "SyncWithIRD" bit NOT NULL,
    "IsRealtime" bit NOT NULL,
    "ConsignmentType" smallint NOT NULL,
    "ITCClaimedStatus" smallint NOT NULL,
    "ITCClaimedMonth" smallint NOT NULL,
    "EInvIRN" nvarchar(255) NOT NULL,
    "EInvAckNo" nvarchar(255) NOT NULL,
    "EInvAckDate" datetime NOT NULL,
    "EInvSignedQRCode" ntext NOT NULL,
    "EInvSignedInvoice" ntext NOT NULL,
    "EInvSignedInvoice2" ntext NOT NULL,
    "EInvSignedInvoice3" ntext NOT NULL,
    "EInvSignedInvoice4" ntext NOT NULL,
    "EInvSignedInvoice5" ntext NOT NULL,
    "SelfImageLink" nvarchar(255) NOT NULL,
    "BusyDocLink" nvarchar(255) NOT NULL,
    "SelfImageName" nvarchar(255) NOT NULL,
    "BusyDocName" nvarchar(255) NOT NULL,
    "GSTR2BStatus" smallint NOT NULL,
    "GSTR2BMonth" smallint NOT NULL,
    "GSTR2BYear" smallint NOT NULL,
    "OldIdentity" ntext NOT NULL,
    "EcomOrderID" nvarchar(100) NOT NULL,
    "DispatchC" int,
    "DispOTP" varchar(40),
    "SW" int,
    "TranEmail" int,
    "DEMailSend" int,
    "VAttachStr" varchar(255),
    "InvPLink" varchar(255),
    "SOAdvance" float,
    "PayUInvoiceID" varchar(50),
    "Renew" int,
    "RenewDT" datetime,
    "RenewAmt" float,
    "Newcard" int,
    "NewCardDT" datetime,
    "NCardAmt" float,
    "RJVBusyVchCode" int
);
CREATE UNIQUE INDEX 01 ON "Tran1"("VchCode");
CREATE INDEX 02 ON "Tran1"("MasterCode1");
CREATE INDEX 03 ON "Tran1"("MasterCode2");
CREATE INDEX 19 ON "Tran1"("CM5");
CREATE INDEX 21 ON "Tran1"("Date");
CREATE INDEX 22 ON "Tran1"("VchType");
CREATE INDEX 23 ON "Tran1"("VchNo");
CREATE INDEX 24 ON "Tran1"("VchSeriesCode");
CREATE INDEX 26 ON "Tran1"("CM1");
CREATE INDEX 27 ON "Tran1"("CM2");
CREATE INDEX 28 ON "Tran1"("CM3");
CREATE INDEX 29 ON "Tran1"("CM4");
CREATE INDEX 30 ON "Tran1"("AutoGeneratedType");
CREATE INDEX 31 ON "Tran1"("StockUpdationDate");
CREATE INDEX 32 ON "Tran1"("SyncStatus");
CREATE INDEX 33 ON "Tran1"("Source");
CREATE INDEX 34 ON "Tran1"("CM7");
CREATE INDEX 35 ON "Tran1"("TranType");
CREATE INDEX 62 ON "Tran1"("VchType","Date");
CREATE INDEX 63 ON "Tran1"("VchSeriesCode","AutoVchNo");
CREATE INDEX 64 ON "Tran1"("VchSeriesCode","Date","VchNo");
CREATE INDEX 36 ON "Tran1"("GSTRecType");
CREATE INDEX 65 ON "Tran1"("ConsignmentType");
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"StockUpdationDate" DEFAULT '((0))' FOR "StockUpdationDate";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"Status" DEFAULT ((0)) FOR "Status";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"Stamp" DEFAULT ((0)) FOR "Stamp";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"AutoVchNo" DEFAULT ((0)) FOR "AutoVchNo";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CM6" DEFAULT ((0)) FOR "CM6";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"FormRecAmt" DEFAULT ((0)) FOR "FormRecAmt";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"FormIssAmt" DEFAULT ((0)) FOR "FormIssAmt";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CurConRate" DEFAULT ((0)) FOR "CurConRate";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"VchAmtBaseCur" DEFAULT ((0)) FOR "VchAmtBaseCur";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"VchSalePurcAmt" DEFAULT ((0)) FOR "VchSalePurcAmt";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ExciseApplicable" DEFAULT '((0))' FOR "ExciseApplicable";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ExciseValue" DEFAULT ((0)) FOR "ExciseValue";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ExciseType" DEFAULT ((0)) FOR "ExciseType";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ExcisableAmount" DEFAULT ((0)) FOR "ExcisableAmount";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ExciseRate" DEFAULT ((0)) FOR "ExciseRate";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"OrgVchAmtBaseCur" DEFAULT ((0)) FOR "OrgVchAmtBaseCur";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"TEApplicable" DEFAULT '((0))' FOR "TEApplicable";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"TDSApplicable" DEFAULT '((0))' FOR "TDSApplicable";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"FormRecStatus" DEFAULT ((0)) FOR "FormRecStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"FormIssStatus" DEFAULT ((0)) FOR "FormIssStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ChallanStatus" DEFAULT ((0)) FOR "ChallanStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"STApplicable" DEFAULT '((0))' FOR "STApplicable";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"STType" DEFAULT ((0)) FOR "STType";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"DocPrinted" DEFAULT '((0))' FOR "DocPrinted";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"External" DEFAULT '((0))' FOR "External";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CreationTime" DEFAULT '((0))' FOR "CreationTime";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"AuthorisationTime" DEFAULT '((0))' FOR "AuthorisationTime";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ModificationTime" DEFAULT '((0))' FOR "ModificationTime";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"PriceCategory" DEFAULT ((0)) FOR "PriceCategory";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"VATInfo" DEFAULT '((0))' FOR "VATInfo";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"POSEnabled" DEFAULT '((0))' FOR "POSEnabled";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"AutoGeneratedType" DEFAULT ((0)) FOR "AutoGeneratedType";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"VchCancelled" DEFAULT '((0))' FOR "VchCancelled";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"BrokerageMode" DEFAULT ((0)) FOR "BrokerageMode";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"Brokerage" DEFAULT ((0)) FOR "Brokerage";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"BrokerageAmt" DEFAULT ((0)) FOR "BrokerageAmt";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"FreeQtyUsed" DEFAULT '((0))' FOR "FreeQtyUsed";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"Cancelled" DEFAULT '((0))' FOR "Cancelled";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ApprovalStatus" DEFAULT ((0)) FOR "ApprovalStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"SyncStatus" DEFAULT '((0))' FOR "SyncStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"Source" DEFAULT ((0)) FOR "Source";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"AuditStatus" DEFAULT ((0)) FOR "AuditStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ExtraExpense" DEFAULT ((0)) FOR "ExtraExpense";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"Date2" DEFAULT '((0))' FOR "Date2";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I4" DEFAULT ((0)) FOR "I4";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I5" DEFAULT ((0)) FOR "I5";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I6" DEFAULT ((0)) FOR "I6";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I7" DEFAULT ((0)) FOR "I7";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I8" DEFAULT ((0)) FOR "I8";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I9" DEFAULT ((0)) FOR "I9";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"I10" DEFAULT ((0)) FOR "I10";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"TPF1" DEFAULT '((0))' FOR "TPF1";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"TPF2" DEFAULT '((0))' FOR "TPF2";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"RejectionStatus" DEFAULT ((0)) FOR "RejectionStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"L1" DEFAULT ((0)) FOR "L1";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"CM7" DEFAULT ((0)) FOR "CM7";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"TCSApplicable" DEFAULT '((0))' FOR "TCSApplicable";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ReturnStatus" DEFAULT ((0)) FOR "ReturnStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ReturnStatusAnnual" DEFAULT ((0)) FOR "ReturnStatusAnnual";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"GSTInfo" DEFAULT '((0))' FOR "GSTInfo";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"GSTRecType" DEFAULT ((0)) FOR "GSTRecType";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"InputType" DEFAULT ((0)) FOR "InputType";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"GSTRepBasis" DEFAULT ((0)) FOR "GSTRepBasis";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"GSTR2Status" DEFAULT ((0)) FOR "GSTR2Status";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"SyncWithIRD" DEFAULT '((0))' FOR "SyncWithIRD";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"IsRealtime" DEFAULT '((0))' FOR "IsRealtime";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ConsignmentType" DEFAULT ((0)) FOR "ConsignmentType";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ITCClaimedStatus" DEFAULT ((0)) FOR "ITCClaimedStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"ITCClaimedMonth" DEFAULT ((0)) FOR "ITCClaimedMonth";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"EInvAckDate" DEFAULT '((0))' FOR "EInvAckDate";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"GSTR2BStatus" DEFAULT ((0)) FOR "GSTR2BStatus";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"GSTR2BMonth" DEFAULT ((0)) FOR "GSTR2BMonth";
ALTER TABLE "dbo"."Tran1" ADD CONSTRAINT DF_Tran1_"GSTR2BYear" DEFAULT ((0)) FOR "GSTR2BYear";

DROP TABLE IF EXISTS "Tran10";
CREATE TABLE "Tran10"(
    "RecType" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "I4" smallint NOT NULL,
    "SrNo" smallint NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "D7" float NOT NULL,
    "D8" float NOT NULL,
    "D9" float NOT NULL,
    "D10" float NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "C3" nvarchar(255) NOT NULL,
    "C4" nvarchar(255) NOT NULL,
    "C5" nvarchar(255) NOT NULL,
    "C6" nvarchar(255) NOT NULL,
    "C7" nvarchar(255) NOT NULL,
    "C8" nvarchar(255) NOT NULL,
    "C9" nvarchar(255) NOT NULL,
    "C10" nvarchar(255) NOT NULL,
    "Date" datetime NOT NULL,
    "MasterCode3" int NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "M1" ntext NOT NULL
);
CREATE INDEX 01 ON "Tran10"("MasterCode1");
CREATE INDEX 02 ON "Tran10"("MasterCode2");
CREATE INDEX 03 ON "Tran10"("VchType");
CREATE INDEX 04 ON "Tran10"("C1");
CREATE INDEX 05 ON "Tran10"("MasterCode3");
CREATE INDEX 06 ON "Tran10"("Date");
CREATE INDEX 08 ON "Tran10"("RecType");
CREATE INDEX 11 ON "Tran10"("RecType","MasterCode1");
CREATE INDEX 12 ON "Tran10"("RecType","MasterCode2");
CREATE INDEX 13 ON "Tran10"("RecType","VchType");
CREATE INDEX 14 ON "Tran10"("MasterCode1","MasterCode2");
CREATE INDEX 15 ON "Tran10"("VchType","RecType","MasterCode1","SrNo");
CREATE INDEX 09 ON "Tran10"("C6");
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"I4" DEFAULT ((0)) FOR "I4";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D7" DEFAULT ((0)) FOR "D7";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D8" DEFAULT ((0)) FOR "D8";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D9" DEFAULT ((0)) FOR "D9";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"D10" DEFAULT ((0)) FOR "D10";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"MasterCode3" DEFAULT ((0)) FOR "MasterCode3";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."Tran10" ADD CONSTRAINT DF_Tran10_"B3" DEFAULT '((0))' FOR "B3";

DROP TABLE IF EXISTS "Tran11";
CREATE TABLE "Tran11"(
    "RecType" smallint NOT NULL,
    "TranType" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "ShortNar" nvarchar(40) NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "B1" bit NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "CM6" int NOT NULL,
    "CM7" int NOT NULL,
    "CM8" int NOT NULL,
    "Date1" datetime NOT NULL,
    "Date2" datetime NOT NULL,
    "Date3" datetime NOT NULL,
    "Date4" datetime NOT NULL,
    "Date5" datetime NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "M1" ntext NOT NULL,
    "M2" ntext NOT NULL
);
CREATE INDEX 01 ON "Tran11"("MasterCode1");
CREATE INDEX 02 ON "Tran11"("C1");
CREATE INDEX 03 ON "Tran11"("Date");
CREATE INDEX 04 ON "Tran11"("CM3");
CREATE INDEX 05 ON "Tran11"("TranType");
CREATE INDEX 06 ON "Tran11"("VchType");
CREATE INDEX 07 ON "Tran11"("RecType");
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"CM6" DEFAULT ((0)) FOR "CM6";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"CM7" DEFAULT ((0)) FOR "CM7";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"CM8" DEFAULT ((0)) FOR "CM8";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"Date1" DEFAULT '((0))' FOR "Date1";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"Date2" DEFAULT '((0))' FOR "Date2";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"Date3" DEFAULT '((0))' FOR "Date3";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"Date4" DEFAULT '((0))' FOR "Date4";
ALTER TABLE "dbo"."Tran11" ADD CONSTRAINT DF_Tran11_"Date5" DEFAULT '((0))' FOR "Date5";

DROP TABLE IF EXISTS "Tran12";
CREATE TABLE "Tran12"(
    "VchCode" int NOT NULL,
    "Date" datetime NOT NULL,
    "UserName" nvarchar(40) NOT NULL,
    "NoOfCopies" smallint NOT NULL
);
CREATE INDEX 01 ON "Tran12"("VchCode");
CREATE INDEX 02 ON "Tran12"("Date");
ALTER TABLE "dbo"."Tran12" ADD CONSTRAINT DF_Tran12_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Tran12" ADD CONSTRAINT DF_Tran12_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran12" ADD CONSTRAINT DF_Tran12_"NoOfCopies" DEFAULT ((0)) FOR "NoOfCopies";

DROP TABLE IF EXISTS "Tran2";
CREATE TABLE "Tran2"(
    "RecType" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "Value1" float NOT NULL,
    "Value2" float NOT NULL,
    "Value3" float NOT NULL,
    "Balance1" float NOT NULL,
    "Balance2" float NOT NULL,
    "Balance3" float NOT NULL,
    "ItemBal1" float NOT NULL,
    "ItemBal2" float NOT NULL,
    "ItemBal3" float NOT NULL,
    "CashFlow" float NOT NULL,
    "ShortNar" nvarchar(40) NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "D4" float NOT NULL,
    "D5" float NOT NULL,
    "D6" float NOT NULL,
    "D7" float NOT NULL,
    "D8" float NOT NULL,
    "D9" float NOT NULL,
    "D10" float NOT NULL,
    "D11" float NOT NULL,
    "D12" float NOT NULL,
    "D13" float NOT NULL,
    "D14" float NOT NULL,
    "D15" float NOT NULL,
    "D16" float NOT NULL,
    "D17" float NOT NULL,
    "D18" float NOT NULL,
    "D19" float NOT NULL,
    "D20" float NOT NULL,
    "D21" float NOT NULL,
    "D22" float NOT NULL,
    "D23" float NOT NULL,
    "D24" float NOT NULL,
    "D25" float NOT NULL,
    "D26" float NOT NULL,
    "D27" float NOT NULL,
    "D28" float NOT NULL,
    "D29" float NOT NULL,
    "D30" float NOT NULL,
    "D31" float NOT NULL,
    "D32" float NOT NULL,
    "D33" float NOT NULL,
    "D34" float NOT NULL,
    "D35" float NOT NULL,
    "D36" float NOT NULL,
    "D37" float NOT NULL,
    "D38" float NOT NULL,
    "D39" float NOT NULL,
    "I1" smallint NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "CM4" int NOT NULL,
    "CM5" int NOT NULL,
    "CM6" int NOT NULL,
    "CM7" int NOT NULL,
    "CM8" int NOT NULL,
    "CM9" int NOT NULL,
    "CM10" int NOT NULL,
    "CM11" int NOT NULL,
    "CM12" int NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "B6" bit NOT NULL,
    "B7" bit NOT NULL,
    "B8" bit NOT NULL,
    "ClrDate" datetime NOT NULL,
    "PriceCategory" smallint NOT NULL,
    "CFMode" smallint NOT NULL,
    "C1" nvarchar(255) NOT NULL,
    "C2" nvarchar(255) NOT NULL,
    "C3" nvarchar(255) NOT NULL,
    "C4" nvarchar(255) NOT NULL,
    "TranType" smallint NOT NULL,
    "IsReturnQty" bit NOT NULL,
    "ReconStatus" bit NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "I4" smallint NOT NULL,
    "I5" smallint NOT NULL,
    "I6" smallint NOT NULL,
    "I7" smallint NOT NULL,
    "I8" smallint NOT NULL,
    "I9" smallint NOT NULL,
    "I10" smallint NOT NULL,
    "TrackingStatus" smallint NOT NULL,
    "TrackingNo" nvarchar(255) NOT NULL,
    "ConsignmentType" smallint NOT NULL,
    "ConsignmentCleared" bit NOT NULL,
    "EcomOrderItemID" nvarchar(100) NOT NULL
);
CREATE INDEX 01 ON "Tran2"("MasterCode1","Date");
CREATE INDEX 02 ON "Tran2"("MasterCode2");
CREATE INDEX 03 ON "Tran2"("CM1","Date");
CREATE INDEX 08 ON "Tran2"("VchCode");
CREATE INDEX 31 ON "Tran2"("RecType");
CREATE INDEX 32 ON "Tran2"("VchType");
CREATE INDEX 33 ON "Tran2"("VchNo");
CREATE INDEX 34 ON "Tran2"("Date");
CREATE INDEX 36 ON "Tran2"("VchSeriesCode");
CREATE INDEX 38 ON "Tran2"("CM2");
CREATE INDEX 39 ON "Tran2"("CM3");
CREATE INDEX 40 ON "Tran2"("CM4");
CREATE INDEX 41 ON "Tran2"("CM5");
CREATE INDEX 42 ON "Tran2"("D18");
CREATE INDEX 43 ON "Tran2"("D26");
CREATE INDEX 44 ON "Tran2"("CM6");
CREATE INDEX 45 ON "Tran2"("IsReturnQty");
CREATE INDEX 46 ON "Tran2"("C3");
CREATE INDEX 47 ON "Tran2"("TrackingNo");
CREATE INDEX 48 ON "Tran2"("TrackingStatus");
CREATE INDEX 49 ON "Tran2"("TranType");
CREATE INDEX 50 ON "Tran2"("CM7");
CREATE INDEX 51 ON "Tran2"("CM8");
CREATE INDEX 52 ON "Tran2"("CM9");
CREATE INDEX 53 ON "Tran2"("CM10");
CREATE INDEX 54 ON "Tran2"("CM11");
CREATE INDEX 55 ON "Tran2"("CM12");
CREATE INDEX 56 ON "Tran2"("ConsignmentType");
CREATE INDEX 57 ON "Tran2"("ConsignmentCleared");
CREATE INDEX 81 ON "Tran2"("MasterCode2");
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"Value3" DEFAULT ((0)) FOR "Value3";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"Balance1" DEFAULT ((0)) FOR "Balance1";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"Balance2" DEFAULT ((0)) FOR "Balance2";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"Balance3" DEFAULT ((0)) FOR "Balance3";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"ItemBal1" DEFAULT ((0)) FOR "ItemBal1";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"ItemBal2" DEFAULT ((0)) FOR "ItemBal2";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"ItemBal3" DEFAULT ((0)) FOR "ItemBal3";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CashFlow" DEFAULT ((0)) FOR "CashFlow";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D4" DEFAULT ((0)) FOR "D4";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D5" DEFAULT ((0)) FOR "D5";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D6" DEFAULT ((0)) FOR "D6";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D7" DEFAULT ((0)) FOR "D7";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D8" DEFAULT ((0)) FOR "D8";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D9" DEFAULT ((0)) FOR "D9";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D10" DEFAULT ((0)) FOR "D10";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D11" DEFAULT ((0)) FOR "D11";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D12" DEFAULT ((0)) FOR "D12";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D13" DEFAULT ((0)) FOR "D13";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D14" DEFAULT ((0)) FOR "D14";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D15" DEFAULT ((0)) FOR "D15";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D16" DEFAULT ((0)) FOR "D16";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D17" DEFAULT ((0)) FOR "D17";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D18" DEFAULT ((0)) FOR "D18";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D19" DEFAULT ((0)) FOR "D19";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D20" DEFAULT ((0)) FOR "D20";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D21" DEFAULT ((0)) FOR "D21";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D22" DEFAULT ((0)) FOR "D22";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D23" DEFAULT ((0)) FOR "D23";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D24" DEFAULT ((0)) FOR "D24";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D25" DEFAULT ((0)) FOR "D25";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D26" DEFAULT ((0)) FOR "D26";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D27" DEFAULT ((0)) FOR "D27";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D28" DEFAULT ((0)) FOR "D28";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D29" DEFAULT ((0)) FOR "D29";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D30" DEFAULT ((0)) FOR "D30";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D31" DEFAULT ((0)) FOR "D31";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D32" DEFAULT ((0)) FOR "D32";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D33" DEFAULT ((0)) FOR "D33";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D34" DEFAULT ((0)) FOR "D34";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D35" DEFAULT ((0)) FOR "D35";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D36" DEFAULT ((0)) FOR "D36";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D37" DEFAULT ((0)) FOR "D37";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D38" DEFAULT ((0)) FOR "D38";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"D39" DEFAULT ((0)) FOR "D39";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM4" DEFAULT ((0)) FOR "CM4";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM5" DEFAULT ((0)) FOR "CM5";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM6" DEFAULT ((0)) FOR "CM6";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM7" DEFAULT ((0)) FOR "CM7";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM8" DEFAULT ((0)) FOR "CM8";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM9" DEFAULT ((0)) FOR "CM9";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM10" DEFAULT ((0)) FOR "CM10";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM11" DEFAULT ((0)) FOR "CM11";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CM12" DEFAULT ((0)) FOR "CM12";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"B6" DEFAULT '((0))' FOR "B6";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"B7" DEFAULT '((0))' FOR "B7";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"B8" DEFAULT '((0))' FOR "B8";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"ClrDate" DEFAULT '((0))' FOR "ClrDate";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"PriceCategory" DEFAULT ((0)) FOR "PriceCategory";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"CFMode" DEFAULT ((0)) FOR "CFMode";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"IsReturnQty" DEFAULT '((0))' FOR "IsReturnQty";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"ReconStatus" DEFAULT '((0))' FOR "ReconStatus";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I4" DEFAULT ((0)) FOR "I4";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I5" DEFAULT ((0)) FOR "I5";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I6" DEFAULT ((0)) FOR "I6";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I7" DEFAULT ((0)) FOR "I7";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I8" DEFAULT ((0)) FOR "I8";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I9" DEFAULT ((0)) FOR "I9";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"I10" DEFAULT ((0)) FOR "I10";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"TrackingStatus" DEFAULT ((0)) FOR "TrackingStatus";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"ConsignmentType" DEFAULT ((0)) FOR "ConsignmentType";
ALTER TABLE "dbo"."Tran2" ADD CONSTRAINT DF_Tran2_"ConsignmentCleared" DEFAULT '((0))' FOR "ConsignmentCleared";

DROP TABLE IF EXISTS "Tran3";
CREATE TABLE "Tran3"(
    "RefCode" int NOT NULL,
    "RecType" smallint NOT NULL,
    "Method" smallint NOT NULL,
    "VchCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "RefGrp" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "DueDate" datetime NOT NULL,
    "No" nvarchar(25) NOT NULL,
    "Status" smallint NOT NULL,
    "Type" smallint NOT NULL,
    "BrokerCode" int NOT NULL,
    "Value1" float NOT NULL,
    "Value2" float NOT NULL,
    "Value3" float NOT NULL,
    "Balance1" float NOT NULL,
    "Balance2" float NOT NULL,
    "Balance3" float NOT NULL,
    "ItemSrNo" smallint NOT NULL,
    "MfgDate" datetime NOT NULL,
    "TranType" smallint NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "CM3" int NOT NULL,
    "ApprovalStatus" smallint NOT NULL,
    "NewRefAmount" float NOT NULL,
    "Narration" nvarchar(255) NOT NULL,
    "BranchCode" int NOT NULL,
    "NewRefVchType" smallint NOT NULL,
    "NewRefVchCode" int NOT NULL
);
CREATE INDEX 04 ON "Tran3"("MasterCode1");
CREATE INDEX 05 ON "Tran3"("MasterCode2");
CREATE INDEX 09 ON "Tran3"("RefGrp");
CREATE INDEX 21 ON "Tran3"("Date");
CREATE INDEX 22 ON "Tran3"("VchType");
CREATE INDEX 23 ON "Tran3"("VchCode");
CREATE INDEX 24 ON "Tran3"("RefCode");
CREATE INDEX 25 ON "Tran3"("RecType");
CREATE INDEX 26 ON "Tran3"("Type");
CREATE INDEX 27 ON "Tran3"("Method");
CREATE INDEX 28 ON "Tran3"("DueDate");
CREATE INDEX 29 ON "Tran3"("No");
CREATE INDEX 20 ON "Tran3"("SrNo");
CREATE INDEX 31 ON "Tran3"("Status");
CREATE INDEX 32 ON "Tran3"("ApprovalStatus");
CREATE INDEX 33 ON "Tran3"("TranType");
CREATE INDEX 34 ON "Tran3"("Value1");
CREATE INDEX 35 ON "Tran3"("CM1");
CREATE INDEX 36 ON "Tran3"("CM2");
CREATE INDEX 37 ON "Tran3"("BrokerCode");
CREATE INDEX 38 ON "Tran3"("BranchCode");
CREATE INDEX 61 ON "Tran3"("RecType","MasterCode1","MasterCode2","No");
CREATE INDEX 62 ON "Tran3"("RefCode","Date");
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"RefCode" DEFAULT ((0)) FOR "RefCode";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Method" DEFAULT ((0)) FOR "Method";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"RefGrp" DEFAULT ((0)) FOR "RefGrp";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"DueDate" DEFAULT '((0))' FOR "DueDate";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Status" DEFAULT ((0)) FOR "Status";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"BrokerCode" DEFAULT ((0)) FOR "BrokerCode";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Value3" DEFAULT ((0)) FOR "Value3";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Balance1" DEFAULT ((0)) FOR "Balance1";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Balance2" DEFAULT ((0)) FOR "Balance2";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"Balance3" DEFAULT ((0)) FOR "Balance3";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"ItemSrNo" DEFAULT ((0)) FOR "ItemSrNo";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"MfgDate" DEFAULT '((0))' FOR "MfgDate";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"CM3" DEFAULT ((0)) FOR "CM3";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"ApprovalStatus" DEFAULT ((0)) FOR "ApprovalStatus";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"NewRefAmount" DEFAULT ((0)) FOR "NewRefAmount";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"BranchCode" DEFAULT ((0)) FOR "BranchCode";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"NewRefVchType" DEFAULT ((0)) FOR "NewRefVchType";
ALTER TABLE "dbo"."Tran3" ADD CONSTRAINT DF_Tran3_"NewRefVchCode" DEFAULT ((0)) FOR "NewRefVchCode";

DROP TABLE IF EXISTS "Tran4";
CREATE TABLE "Tran4"(
    "SrNo" int NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL,
    "BranchCode" int NOT NULL,
    "RecType" smallint NOT NULL
);
CREATE INDEX 01 ON "Tran4"("MasterCode1","MasterCode2");
CREATE INDEX 02 ON "Tran4"("MasterCode1","SrNo");
CREATE INDEX 03 ON "Tran4"("MasterCode2");
CREATE INDEX 06 ON "Tran4"("BranchCode");
CREATE INDEX 07 ON "Tran4"("RecType");
ALTER TABLE "dbo"."Tran4" ADD CONSTRAINT DF_Tran4_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Tran4" ADD CONSTRAINT DF_Tran4_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."Tran4" ADD CONSTRAINT DF_Tran4_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."Tran4" ADD CONSTRAINT DF_Tran4_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Tran4" ADD CONSTRAINT DF_Tran4_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."Tran4" ADD CONSTRAINT DF_Tran4_"D3" DEFAULT ((0)) FOR "D3";
ALTER TABLE "dbo"."Tran4" ADD CONSTRAINT DF_Tran4_"BranchCode" DEFAULT ((0)) FOR "BranchCode";
ALTER TABLE "dbo"."Tran4" ADD CONSTRAINT DF_Tran4_"RecType" DEFAULT ((0)) FOR "RecType";

DROP TABLE IF EXISTS "Tran5";
CREATE TABLE "Tran5"(
    "VchCode" int NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "VchNo" nvarchar(25) NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "Value1" float NOT NULL,
    "Value2" float NOT NULL,
    "Balance1" float NOT NULL,
    "Balance2" float NOT NULL,
    "TranType" smallint NOT NULL,
    "ShortNar" nvarchar(40) NOT NULL,
    "TrackingNo" nvarchar(255) NOT NULL,
    "TrackingStatus" smallint NOT NULL
);
CREATE INDEX 01 ON "Tran5"("MasterCode1","Date","VchType","VchNo","VchCode");
CREATE INDEX 02 ON "Tran5"("VchCode","MasterCode1","TranType","SrNo");
CREATE INDEX 03 ON "Tran5"("VchCode","TranType","SrNo");
CREATE INDEX 04 ON "Tran5"("MasterCode1","MasterCode2","Date","VchNo","VchCode");
CREATE INDEX 05 ON "Tran5"("MasterCode1","VchType","Date","VchNo","VchCode");
CREATE INDEX 06 ON "Tran5"("MasterCode1","MasterCode2","Value1","Date");
CREATE INDEX 07 ON "Tran5"("MasterCode2","MasterCode1","Value1","Date");
CREATE INDEX 08 ON "Tran5"("MasterCode1","VchType","Value1","Date");
CREATE INDEX 09 ON "Tran5"("VchType","MasterCode1","Value1","Date");
CREATE INDEX 10 ON "Tran5"("VchCode","MasterCode2","SrNo");
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"Value1" DEFAULT ((0)) FOR "Value1";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"Value2" DEFAULT ((0)) FOR "Value2";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"Balance1" DEFAULT ((0)) FOR "Balance1";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"Balance2" DEFAULT ((0)) FOR "Balance2";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"TranType" DEFAULT ((0)) FOR "TranType";
ALTER TABLE "dbo"."Tran5" ADD CONSTRAINT DF_Tran5_"TrackingStatus" DEFAULT ((0)) FOR "TrackingStatus";

DROP TABLE IF EXISTS "Tran6";
CREATE TABLE "Tran6"(
    "SrNo" int NOT NULL,
    "MasterCode1" int NOT NULL,
    "MasterCode2" int NOT NULL,
    "StockType" smallint NOT NULL,
    "D1" float NOT NULL,
    "D2" float NOT NULL,
    "D3" float NOT NULL
);
CREATE INDEX 01 ON "Tran6"("MasterCode1","MasterCode2","StockType");
CREATE INDEX 02 ON "Tran6"("MasterCode1","StockType","SrNo");
CREATE INDEX 03 ON "Tran6"("MasterCode2");
ALTER TABLE "dbo"."Tran6" ADD CONSTRAINT DF_Tran6_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Tran6" ADD CONSTRAINT DF_Tran6_"MasterCode1" DEFAULT ((0)) FOR "MasterCode1";
ALTER TABLE "dbo"."Tran6" ADD CONSTRAINT DF_Tran6_"MasterCode2" DEFAULT ((0)) FOR "MasterCode2";
ALTER TABLE "dbo"."Tran6" ADD CONSTRAINT DF_Tran6_"StockType" DEFAULT ((0)) FOR "StockType";
ALTER TABLE "dbo"."Tran6" ADD CONSTRAINT DF_Tran6_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."Tran6" ADD CONSTRAINT DF_Tran6_"D2" DEFAULT ((0)) FOR "D2";
ALTER TABLE "dbo"."Tran6" ADD CONSTRAINT DF_Tran6_"D3" DEFAULT ((0)) FOR "D3";

DROP TABLE IF EXISTS "Tran7";
CREATE TABLE "Tran7"(
    "MasterCode" int NOT NULL
);
CREATE INDEX 01 ON "Tran7"("MasterCode");
ALTER TABLE "dbo"."Tran7" ADD CONSTRAINT DF_Tran7_"MasterCode" DEFAULT ((0)) FOR "MasterCode";

DROP TABLE IF EXISTS "Tran8";
CREATE TABLE "Tran8"(
    "VchCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "FormRecDate" datetime NOT NULL,
    "FormNo" nvarchar(25) NOT NULL,
    "PartyCode" int NOT NULL,
    "FormCode" int NOT NULL,
    "Stamp" int NOT NULL,
    "Nar1" nvarchar(94) NOT NULL,
    "AutoVchNo" int NOT NULL,
    "CreatedBy" nvarchar(20) NOT NULL,
    "CreationTime" datetime NOT NULL,
    "AuthorisedBy" nvarchar(20) NOT NULL,
    "AuthorisationTime" datetime NOT NULL,
    "ModifiedBy" nvarchar(20) NOT NULL,
    "ModificationTime" datetime NOT NULL,
    "StateCode" smallint NOT NULL,
    "Series" nvarchar(255) NOT NULL,
    "IssuingOffice" nvarchar(255) NOT NULL
);
CREATE UNIQUE INDEX 01 ON "Tran8"("VchCode");
CREATE INDEX 02 ON "Tran8"("VchType","Date","FormNo","VchCode");
CREATE INDEX 03 ON "Tran8"("VchType","FormNo");
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"FormRecDate" DEFAULT '((0))' FOR "FormRecDate";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"PartyCode" DEFAULT ((0)) FOR "PartyCode";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"FormCode" DEFAULT ((0)) FOR "FormCode";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"Stamp" DEFAULT ((0)) FOR "Stamp";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"AutoVchNo" DEFAULT ((0)) FOR "AutoVchNo";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"CreationTime" DEFAULT '((0))' FOR "CreationTime";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"AuthorisationTime" DEFAULT '((0))' FOR "AuthorisationTime";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"ModificationTime" DEFAULT '((0))' FOR "ModificationTime";
ALTER TABLE "dbo"."Tran8" ADD CONSTRAINT DF_Tran8_"StateCode" DEFAULT ((0)) FOR "StateCode";

DROP TABLE IF EXISTS "Tran9";
CREATE TABLE "Tran9"(
    "VchCode" int NOT NULL,
    "PartyCode" int NOT NULL,
    "FormCode" int NOT NULL,
    "SrNo" smallint NOT NULL,
    "VchType" smallint NOT NULL,
    "Date" datetime NOT NULL,
    "FormNo" nvarchar(25) NOT NULL,
    "BillCode" int NOT NULL,
    "Amount" float NOT NULL
);
CREATE INDEX 01 ON "Tran9"("VchCode","SrNo");
CREATE INDEX 02 ON "Tran9"("VchType","BillCode");
ALTER TABLE "dbo"."Tran9" ADD CONSTRAINT DF_Tran9_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."Tran9" ADD CONSTRAINT DF_Tran9_"PartyCode" DEFAULT ((0)) FOR "PartyCode";
ALTER TABLE "dbo"."Tran9" ADD CONSTRAINT DF_Tran9_"FormCode" DEFAULT ((0)) FOR "FormCode";
ALTER TABLE "dbo"."Tran9" ADD CONSTRAINT DF_Tran9_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."Tran9" ADD CONSTRAINT DF_Tran9_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."Tran9" ADD CONSTRAINT DF_Tran9_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."Tran9" ADD CONSTRAINT DF_Tran9_"BillCode" DEFAULT ((0)) FOR "BillCode";
ALTER TABLE "dbo"."Tran9" ADD CONSTRAINT DF_Tran9_"Amount" DEFAULT ((0)) FOR "Amount";

DROP TABLE IF EXISTS "VATInfo";
CREATE TABLE "VATInfo"(
    "Date" datetime NOT NULL,
    "Amount" float NOT NULL,
    "RecType" smallint NOT NULL,
    "Type" smallint NOT NULL,
    "SrNo" smallint NOT NULL,
    "Description" nvarchar(80) NOT NULL,
    "VchCode" int NOT NULL,
    "ChallanNo" nvarchar(40) NOT NULL,
    "ChallanDate" datetime NOT NULL,
    "ChequeNo" nvarchar(10) NOT NULL,
    "ChequeDate" datetime NOT NULL,
    "BankName" nvarchar(40) NOT NULL,
    "BankCode" nvarchar(20) NOT NULL,
    "Interest" float NOT NULL,
    "Penalty" float NOT NULL,
    "BankAcType" nvarchar(10) NOT NULL,
    "BankAcNo" nvarchar(15) NOT NULL,
    "SurchargeAmt" float NOT NULL,
    "SaleAmt" float NOT NULL,
    "TaxPercent" float NOT NULL,
    "SurchargePercent" float NOT NULL,
    "PaymtToTaxFreePlanet" bit NOT NULL
);
CREATE INDEX 01 ON "VATInfo"("Date");
CREATE INDEX 02 ON "VATInfo"("VchCode");
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"Date" DEFAULT '((0))' FOR "Date";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"Amount" DEFAULT ((0)) FOR "Amount";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"Type" DEFAULT ((0)) FOR "Type";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"SrNo" DEFAULT ((0)) FOR "SrNo";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"ChallanDate" DEFAULT '((0))' FOR "ChallanDate";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"ChequeDate" DEFAULT '((0))' FOR "ChequeDate";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"Interest" DEFAULT ((0)) FOR "Interest";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"Penalty" DEFAULT ((0)) FOR "Penalty";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"SurchargeAmt" DEFAULT ((0)) FOR "SurchargeAmt";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"SaleAmt" DEFAULT ((0)) FOR "SaleAmt";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"TaxPercent" DEFAULT ((0)) FOR "TaxPercent";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"SurchargePercent" DEFAULT ((0)) FOR "SurchargePercent";
ALTER TABLE "dbo"."VATInfo" ADD CONSTRAINT DF_VATInfo_"PaymtToTaxFreePlanet" DEFAULT '((0))' FOR "PaymtToTaxFreePlanet";

DROP TABLE IF EXISTS "VchDataMobileApp";
CREATE TABLE "VchDataMobileApp"(
    "AutoCode" int NOT NULL,
    "CSExternalVchJson" ntext NOT NULL,
    "DownloadSyncStatus" smallint NOT NULL,
    "RecType" smallint NOT NULL,
    "JSONData1" ntext NOT NULL,
    "JSONData2" ntext NOT NULL,
    "JSONData3" ntext NOT NULL,
    "JSONData4" ntext NOT NULL
);
CREATE INDEX 01 ON "VchDataMobileApp"("AutoCode");
CREATE INDEX 02 ON "VchDataMobileApp"("DownloadSyncStatus");
CREATE INDEX 03 ON "VchDataMobileApp"("RecType");
ALTER TABLE "dbo"."VchDataMobileApp" ADD CONSTRAINT DF_VchDataMobileApp_"AutoCode" DEFAULT ((0)) FOR "AutoCode";
ALTER TABLE "dbo"."VchDataMobileApp" ADD CONSTRAINT DF_VchDataMobileApp_"DownloadSyncStatus" DEFAULT ((0)) FOR "DownloadSyncStatus";
ALTER TABLE "dbo"."VchDataMobileApp" ADD CONSTRAINT DF_VchDataMobileApp_"RecType" DEFAULT ((0)) FOR "RecType";

DROP TABLE IF EXISTS "VchGSTSumItemWise";
CREATE TABLE "VchGSTSumItemWise"(
    "VchCode" int NOT NULL,
    "ItemCode" int NOT NULL,
    "ItemSrNo" smallint NOT NULL,
    "PartyCode" int NOT NULL,
    "TaxCatCode" int NOT NULL,
    "STPTCode" int NOT NULL,
    "VchNo" nvarchar(255) NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "VchDate" datetime NOT NULL,
    "VchType" smallint NOT NULL,
    "HSNCode" nvarchar(255) NOT NULL,
    "SENo" nvarchar(255) NOT NULL,
    "PartyStateTinDigit" nvarchar(255) NOT NULL,
    "PartyStateCode" int NOT NULL,
    "BDStateTinDigit" nvarchar(255) NOT NULL,
    "BDStateCode" int NOT NULL,
    "TaxableAmt" float NOT NULL,
    "TaxRate" float NOT NULL,
    "TaxRate1" float NOT NULL,
    "TaxAmt" float NOT NULL,
    "TaxAmt1" float NOT NULL,
    "SurchargeRate" float NOT NULL,
    "SurchargeAmt" float NOT NULL,
    "ACessRate" float NOT NULL,
    "ACessAmt" float NOT NULL,
    "StateCessRate" float NOT NULL,
    "StateCessAmt" float NOT NULL,
    "LocType" smallint NOT NULL,
    "ZeroTaxType" smallint NOT NULL,
    "ActualSaleAmt" float NOT NULL,
    "TaxOnMRP" bit NOT NULL,
    "ItemMainQty" float NOT NULL,
    "ItemAltQty" float NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "OrgVchNo" nvarchar(255) NOT NULL,
    "OrgVchDate" datetime NOT NULL,
    "RecType" smallint NOT NULL,
    "GSTRepBasis" smallint NOT NULL,
    "TypeOfDealer" smallint NOT NULL,
    "POSStateTinDigit" nvarchar(255) NOT NULL,
    "POSStateCode" int NOT NULL,
    "D1" float NOT NULL,
    "CM1" int NOT NULL,
    "CM2" int NOT NULL,
    "ITCClaimedStatus" smallint NOT NULL,
    "ITCClaimedMonth" smallint NOT NULL,
    "GSTIN" nvarchar(255) NOT NULL,
    "GSTR2BStatus" smallint NOT NULL,
    "GSTR2BMonth" smallint NOT NULL,
    "GSTR2BYear" smallint NOT NULL
);
CREATE INDEX 01 ON "VchGSTSumItemWise"("VchCode");
CREATE INDEX 02 ON "VchGSTSumItemWise"("ItemCode");
CREATE INDEX 03 ON "VchGSTSumItemWise"("PartyCode");
CREATE INDEX 04 ON "VchGSTSumItemWise"("TaxCatCode");
CREATE INDEX 05 ON "VchGSTSumItemWise"("STPTCode");
CREATE INDEX 08 ON "VchGSTSumItemWise"("HSNCode");
CREATE INDEX 09 ON "VchGSTSumItemWise"("SENo");
CREATE INDEX 06 ON "VchGSTSumItemWise"("LocType");
CREATE INDEX 07 ON "VchGSTSumItemWise"("ZeroTaxType");
CREATE INDEX 12 ON "VchGSTSumItemWise"("OrgVchNo");
CREATE INDEX 13 ON "VchGSTSumItemWise"("RecType");
CREATE INDEX 14 ON "VchGSTSumItemWise"("TaxRate");
CREATE INDEX 15 ON "VchGSTSumItemWise"("TaxRate1");
CREATE INDEX 16 ON "VchGSTSumItemWise"("PartyStateTinDigit");
CREATE INDEX 17 ON "VchGSTSumItemWise"("PartyStateCode");
CREATE INDEX 18 ON "VchGSTSumItemWise"("OrgVchDate");
CREATE INDEX 19 ON "VchGSTSumItemWise"("VchNo");
CREATE INDEX 20 ON "VchGSTSumItemWise"("VchDate");
CREATE INDEX 21 ON "VchGSTSumItemWise"("VchSeriesCode");
CREATE INDEX 22 ON "VchGSTSumItemWise"("VchType");
CREATE INDEX 23 ON "VchGSTSumItemWise"("GSTIN");
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ItemCode" DEFAULT ((0)) FOR "ItemCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ItemSrNo" DEFAULT ((0)) FOR "ItemSrNo";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"PartyCode" DEFAULT ((0)) FOR "PartyCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"TaxCatCode" DEFAULT ((0)) FOR "TaxCatCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"STPTCode" DEFAULT ((0)) FOR "STPTCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"VchDate" DEFAULT '((0))' FOR "VchDate";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"PartyStateCode" DEFAULT ((0)) FOR "PartyStateCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"BDStateCode" DEFAULT ((0)) FOR "BDStateCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"TaxRate" DEFAULT ((0)) FOR "TaxRate";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"TaxRate1" DEFAULT ((0)) FOR "TaxRate1";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"TaxAmt" DEFAULT ((0)) FOR "TaxAmt";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"TaxAmt1" DEFAULT ((0)) FOR "TaxAmt1";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"SurchargeRate" DEFAULT ((0)) FOR "SurchargeRate";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"SurchargeAmt" DEFAULT ((0)) FOR "SurchargeAmt";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ACessRate" DEFAULT ((0)) FOR "ACessRate";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ACessAmt" DEFAULT ((0)) FOR "ACessAmt";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"StateCessRate" DEFAULT ((0)) FOR "StateCessRate";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"StateCessAmt" DEFAULT ((0)) FOR "StateCessAmt";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"LocType" DEFAULT ((0)) FOR "LocType";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ZeroTaxType" DEFAULT ((0)) FOR "ZeroTaxType";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ActualSaleAmt" DEFAULT ((0)) FOR "ActualSaleAmt";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"TaxOnMRP" DEFAULT '((0))' FOR "TaxOnMRP";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ItemMainQty" DEFAULT ((0)) FOR "ItemMainQty";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ItemAltQty" DEFAULT ((0)) FOR "ItemAltQty";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"OrgVchDate" DEFAULT '((0))' FOR "OrgVchDate";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"GSTRepBasis" DEFAULT ((0)) FOR "GSTRepBasis";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"TypeOfDealer" DEFAULT ((0)) FOR "TypeOfDealer";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"POSStateCode" DEFAULT ((0)) FOR "POSStateCode";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"CM1" DEFAULT ((0)) FOR "CM1";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"CM2" DEFAULT ((0)) FOR "CM2";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ITCClaimedStatus" DEFAULT ((0)) FOR "ITCClaimedStatus";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"ITCClaimedMonth" DEFAULT ((0)) FOR "ITCClaimedMonth";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"GSTR2BStatus" DEFAULT ((0)) FOR "GSTR2BStatus";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"GSTR2BMonth" DEFAULT ((0)) FOR "GSTR2BMonth";
ALTER TABLE "dbo"."VchGSTSumItemWise" ADD CONSTRAINT DF_VchGSTSumItemWise_"GSTR2BYear" DEFAULT ((0)) FOR "GSTR2BYear";

DROP TABLE IF EXISTS "VchOtherInfo";
CREATE TABLE "VchOtherInfo"(
    "VchCode" int NOT NULL,
    "OF1" nvarchar(30) NOT NULL,
    "OF2" nvarchar(30) NOT NULL,
    "OF3" nvarchar(30) NOT NULL,
    "OF4" nvarchar(30) NOT NULL,
    "OF5" nvarchar(30) NOT NULL,
    "OF6" nvarchar(30) NOT NULL,
    "OF7" nvarchar(30) NOT NULL,
    "OF8" nvarchar(30) NOT NULL,
    "OF9" nvarchar(30) NOT NULL,
    "OF10" nvarchar(30) NOT NULL,
    "Transport" nvarchar(30) NOT NULL,
    "Station" nvarchar(30) NOT NULL,
    "GrNo" nvarchar(30) NOT NULL,
    "VehicleNo" nvarchar(30) NOT NULL,
    "ItemDesc" nvarchar(20) NOT NULL,
    "Form31No" nvarchar(20) NOT NULL,
    "Form31IssuedOn" nvarchar(20) NOT NULL,
    "TotalQty" nvarchar(20) NOT NULL,
    "PurchaseBillNo" nvarchar(25) NOT NULL,
    "PurchaseBillDate" nvarchar(20) NOT NULL,
    "Narration1" nvarchar(94) NOT NULL,
    "Narration2" nvarchar(94) NOT NULL,
    "InvoicePrepTime" nvarchar(25) NOT NULL,
    "GoodsRemovalTime" nvarchar(25) NOT NULL,
    "GrDate" datetime NOT NULL,
    "VchNotes" ntext NOT NULL,
    "I1" smallint NOT NULL,
    "OF11" nvarchar(30) NOT NULL,
    "OF12" nvarchar(30) NOT NULL,
    "OF13" nvarchar(30) NOT NULL,
    "OF14" nvarchar(30) NOT NULL,
    "OF15" nvarchar(30) NOT NULL,
    "OF16" nvarchar(30) NOT NULL,
    "OF17" nvarchar(30) NOT NULL,
    "OF18" nvarchar(30) NOT NULL,
    "OF19" nvarchar(30) NOT NULL,
    "OF20" nvarchar(30) NOT NULL,
    "PortCode" nvarchar(255) NOT NULL,
    "Distance" float NOT NULL,
    "EWayBillReqd" bit NOT NULL,
    "TransportMode" smallint NOT NULL,
    "PinCode" nvarchar(255) NOT NULL,
    "EWayBillDate" datetime NOT NULL,
    "EWayBillPrinted" bit NOT NULL,
    "EWayBillSubType" smallint NOT NULL,
    "EWayBillTranType" smallint NOT NULL,
    "EInvoiceReq" bit NOT NULL,
    "CombinedEwayBillEInvoice" bit NOT NULL,
    "DispatchDetReq" bit NOT NULL,
    "DispatcherPartyName" nvarchar(255) NOT NULL,
    "DispatchAddr1" nvarchar(255) NOT NULL,
    "DispatchAddr2" nvarchar(255) NOT NULL,
    "DispatchAddr3" nvarchar(255) NOT NULL,
    "DispatchAddr4" nvarchar(255) NOT NULL,
    "DispatchPlace" nvarchar(255) NOT NULL,
    "DispatchPIN" nvarchar(255) NOT NULL,
    "DispatchStateCode" int NOT NULL,
    "DispatchGSTIN" nvarchar(255) NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL
);
CREATE INDEX 01 ON "VchOtherInfo"("VchCode");
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"GrDate" DEFAULT '((0))' FOR "GrDate";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"Distance" DEFAULT ((0)) FOR "Distance";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"EWayBillReqd" DEFAULT '((0))' FOR "EWayBillReqd";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"TransportMode" DEFAULT ((0)) FOR "TransportMode";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"EWayBillDate" DEFAULT '((0))' FOR "EWayBillDate";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"EWayBillPrinted" DEFAULT '((0))' FOR "EWayBillPrinted";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"EWayBillSubType" DEFAULT ((0)) FOR "EWayBillSubType";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"EWayBillTranType" DEFAULT ((0)) FOR "EWayBillTranType";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"EInvoiceReq" DEFAULT '((0))' FOR "EInvoiceReq";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"CombinedEwayBillEInvoice" DEFAULT '((0))' FOR "CombinedEwayBillEInvoice";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"DispatchDetReq" DEFAULT '((0))' FOR "DispatchDetReq";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"DispatchStateCode" DEFAULT ((0)) FOR "DispatchStateCode";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."VchOtherInfo" ADD CONSTRAINT DF_VchOtherInfo_"B2" DEFAULT '((0))' FOR "B2";

DROP TABLE IF EXISTS "VchTemplate";
CREATE TABLE "VchTemplate"(
    "VchCode" int NOT NULL,
    "TemplateName" nvarchar(20) NOT NULL
);
CREATE INDEX 01 ON "VchTemplate"("VchCode");
CREATE INDEX 02 ON "VchTemplate"("TemplateName");
ALTER TABLE "dbo"."VchTemplate" ADD CONSTRAINT DF_VchTemplate_"VchCode" DEFAULT ((0)) FOR "VchCode";

DROP TABLE IF EXISTS "VchTempTagging";
CREATE TABLE "VchTempTagging"(
    "MasterCode" int NOT NULL,
    "VchType" smallint NOT NULL,
    "TemplateVchCode" int NOT NULL,
    "B1" bit NOT NULL,
    "B2" bit NOT NULL,
    "B3" bit NOT NULL,
    "B4" bit NOT NULL,
    "B5" bit NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "MasterType" smallint NOT NULL
);
CREATE INDEX 01 ON "VchTempTagging"("MasterCode","VchType");
CREATE INDEX 02 ON "VchTempTagging"("MasterType","VchType");
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"MasterCode" DEFAULT ((0)) FOR "MasterCode";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"TemplateVchCode" DEFAULT ((0)) FOR "TemplateVchCode";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"B1" DEFAULT '((0))' FOR "B1";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"B2" DEFAULT '((0))' FOR "B2";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"B3" DEFAULT '((0))' FOR "B3";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"B4" DEFAULT '((0))' FOR "B4";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"B5" DEFAULT '((0))' FOR "B5";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."VchTempTagging" ADD CONSTRAINT DF_VchTempTagging_"MasterType" DEFAULT ((0)) FOR "MasterType";

DROP TABLE IF EXISTS "VchVATAccInfo";
CREATE TABLE "VchVATAccInfo"(
    "VchCode" int NOT NULL,
    "ItemCode" int NOT NULL,
    "ItemSrNo" smallint NOT NULL,
    "PartyCode" int NOT NULL,
    "TaxCatCode" int NOT NULL,
    "STPTCode" int NOT NULL,
    "VchNo" nvarchar(255) NOT NULL,
    "VchSeriesCode" int NOT NULL,
    "VchDate" datetime NOT NULL,
    "VchType" smallint NOT NULL,
    "HSNCode" nvarchar(255) NOT NULL,
    "SENo" nvarchar(255) NOT NULL,
    "PartyStateTinDigit" nvarchar(255) NOT NULL,
    "PartyStateCode" int NOT NULL,
    "BDStateTinDigit" nvarchar(255) NOT NULL,
    "BDStateCode" int NOT NULL,
    "TaxableAmt" float NOT NULL,
    "TaxRate" float NOT NULL,
    "TaxRate1" float NOT NULL,
    "TaxAmt" float NOT NULL,
    "TaxAmt1" float NOT NULL,
    "SurchargeRate" float NOT NULL,
    "SurchargeAmt" float NOT NULL,
    "ACessRate" float NOT NULL,
    "ACessAmt" float NOT NULL,
    "LocType" smallint NOT NULL,
    "ZeroTaxType" smallint NOT NULL,
    "ActualSaleAmt" float NOT NULL,
    "TaxOnMRP" bit NOT NULL,
    "ItemMainQty" float NOT NULL,
    "ItemAltQty" float NOT NULL,
    "I1" smallint NOT NULL,
    "I2" smallint NOT NULL,
    "I3" smallint NOT NULL,
    "OrgVchNo" nvarchar(255) NOT NULL,
    "OrgVchDate" datetime NOT NULL,
    "RecType" smallint NOT NULL,
    "GSTRepBasis" smallint NOT NULL,
    "TypeOfDealer" smallint NOT NULL,
    "POSStateTinDigit" nvarchar(255) NOT NULL,
    "POSStateCode" int NOT NULL,
    "D1" float NOT NULL,
    "CM1" int NOT NULL
);
CREATE INDEX 01 ON "VchVATAccInfo"("VchCode");
CREATE INDEX 02 ON "VchVATAccInfo"("ItemCode");
CREATE INDEX 03 ON "VchVATAccInfo"("PartyCode");
CREATE INDEX 04 ON "VchVATAccInfo"("TaxCatCode");
CREATE INDEX 05 ON "VchVATAccInfo"("STPTCode");
CREATE INDEX 08 ON "VchVATAccInfo"("HSNCode");
CREATE INDEX 09 ON "VchVATAccInfo"("SENo");
CREATE INDEX 06 ON "VchVATAccInfo"("LocType");
CREATE INDEX 07 ON "VchVATAccInfo"("ZeroTaxType");
CREATE INDEX 12 ON "VchVATAccInfo"("OrgVchNo");
CREATE INDEX 13 ON "VchVATAccInfo"("RecType");
CREATE INDEX 14 ON "VchVATAccInfo"("TaxRate");
CREATE INDEX 15 ON "VchVATAccInfo"("TaxRate1");
CREATE INDEX 16 ON "VchVATAccInfo"("PartyStateTinDigit");
CREATE INDEX 17 ON "VchVATAccInfo"("PartyStateCode");
CREATE INDEX 18 ON "VchVATAccInfo"("OrgVchDate");
CREATE INDEX 19 ON "VchVATAccInfo"("VchNo");
CREATE INDEX 20 ON "VchVATAccInfo"("VchDate");
CREATE INDEX 21 ON "VchVATAccInfo"("VchSeriesCode");
CREATE INDEX 22 ON "VchVATAccInfo"("VchType");
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"ItemCode" DEFAULT ((0)) FOR "ItemCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"ItemSrNo" DEFAULT ((0)) FOR "ItemSrNo";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"PartyCode" DEFAULT ((0)) FOR "PartyCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"TaxCatCode" DEFAULT ((0)) FOR "TaxCatCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"STPTCode" DEFAULT ((0)) FOR "STPTCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"VchSeriesCode" DEFAULT ((0)) FOR "VchSeriesCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"VchDate" DEFAULT '((0))' FOR "VchDate";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"VchType" DEFAULT ((0)) FOR "VchType";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"PartyStateCode" DEFAULT ((0)) FOR "PartyStateCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"BDStateCode" DEFAULT ((0)) FOR "BDStateCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"TaxableAmt" DEFAULT ((0)) FOR "TaxableAmt";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"TaxRate" DEFAULT ((0)) FOR "TaxRate";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"TaxRate1" DEFAULT ((0)) FOR "TaxRate1";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"TaxAmt" DEFAULT ((0)) FOR "TaxAmt";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"TaxAmt1" DEFAULT ((0)) FOR "TaxAmt1";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"SurchargeRate" DEFAULT ((0)) FOR "SurchargeRate";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"SurchargeAmt" DEFAULT ((0)) FOR "SurchargeAmt";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"ACessRate" DEFAULT ((0)) FOR "ACessRate";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"ACessAmt" DEFAULT ((0)) FOR "ACessAmt";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"LocType" DEFAULT ((0)) FOR "LocType";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"ZeroTaxType" DEFAULT ((0)) FOR "ZeroTaxType";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"ActualSaleAmt" DEFAULT ((0)) FOR "ActualSaleAmt";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"TaxOnMRP" DEFAULT '((0))' FOR "TaxOnMRP";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"ItemMainQty" DEFAULT ((0)) FOR "ItemMainQty";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"ItemAltQty" DEFAULT ((0)) FOR "ItemAltQty";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"I1" DEFAULT ((0)) FOR "I1";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"I2" DEFAULT ((0)) FOR "I2";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"I3" DEFAULT ((0)) FOR "I3";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"OrgVchDate" DEFAULT '((0))' FOR "OrgVchDate";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"RecType" DEFAULT ((0)) FOR "RecType";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"GSTRepBasis" DEFAULT ((0)) FOR "GSTRepBasis";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"TypeOfDealer" DEFAULT ((0)) FOR "TypeOfDealer";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"POSStateCode" DEFAULT ((0)) FOR "POSStateCode";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"D1" DEFAULT ((0)) FOR "D1";
ALTER TABLE "dbo"."VchVATAccInfo" ADD CONSTRAINT DF_VchVATAccInfo_"CM1" DEFAULT ((0)) FOR "CM1";

DROP TABLE IF EXISTS "VchVATSum";
CREATE TABLE "VchVATSum"(
    "VchCode" int NOT NULL,
    "SaleAmt" float NOT NULL,
    "TaxRate" float NOT NULL,
    "TaxAmt" float NOT NULL,
    "SurchargeRate" float NOT NULL,
    "SurchargeAmt" float NOT NULL,
    "TaxType" smallint NOT NULL,
    "ActualSaleAmt" float NOT NULL,
    "TaxOnMRP" bit NOT NULL
);
CREATE INDEX 01 ON "VchVATSum"("VchCode");
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"SaleAmt" DEFAULT ((0)) FOR "SaleAmt";
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"TaxRate" DEFAULT ((0)) FOR "TaxRate";
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"TaxAmt" DEFAULT ((0)) FOR "TaxAmt";
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"SurchargeRate" DEFAULT ((0)) FOR "SurchargeRate";
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"SurchargeAmt" DEFAULT ((0)) FOR "SurchargeAmt";
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"TaxType" DEFAULT ((0)) FOR "TaxType";
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"ActualSaleAmt" DEFAULT ((0)) FOR "ActualSaleAmt";
ALTER TABLE "dbo"."VchVATSum" ADD CONSTRAINT DF_VchVATSum_"TaxOnMRP" DEFAULT '((0))' FOR "TaxOnMRP";

DROP TABLE IF EXISTS "VchVATSumItemWise";
CREATE TABLE "VchVATSumItemWise"(
    "VchCode" int NOT NULL,
    "ItemCode" int NOT NULL,
    "ItemSrNo" smallint NOT NULL,
    "SaleAmt" float NOT NULL,
    "TaxRate" float NOT NULL,
    "TaxAmt" float NOT NULL,
    "SurchargeRate" float NOT NULL,
    "SurchargeAmt" float NOT NULL,
    "TaxType" smallint NOT NULL,
    "ActualSaleAmt" float NOT NULL,
    "TaxOnMRP" bit NOT NULL
);
CREATE INDEX 01 ON "VchVATSumItemWise"("VchCode","ItemSrNo");
CREATE INDEX 02 ON "VchVATSumItemWise"("ItemCode");
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"VchCode" DEFAULT ((0)) FOR "VchCode";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"ItemCode" DEFAULT ((0)) FOR "ItemCode";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"ItemSrNo" DEFAULT ((0)) FOR "ItemSrNo";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"SaleAmt" DEFAULT ((0)) FOR "SaleAmt";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"TaxRate" DEFAULT ((0)) FOR "TaxRate";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"TaxAmt" DEFAULT ((0)) FOR "TaxAmt";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"SurchargeRate" DEFAULT ((0)) FOR "SurchargeRate";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"SurchargeAmt" DEFAULT ((0)) FOR "SurchargeAmt";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"TaxType" DEFAULT ((0)) FOR "TaxType";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"ActualSaleAmt" DEFAULT ((0)) FOR "ActualSaleAmt";
ALTER TABLE "dbo"."VchVATSumItemWise" ADD CONSTRAINT DF_VchVATSumItemWise_"TaxOnMRP" DEFAULT '((0))' FOR "TaxOnMRP";