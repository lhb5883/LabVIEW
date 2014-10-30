<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="12008004">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="mailpop70" Type="Folder" URL="..">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Read From XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(array).vi"/>
				<Item Name="Read From XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(string).vi"/>
				<Item Name="Read From XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="subElapsedTime.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/subElapsedTime.vi"/>
				<Item Name="Write to XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(array).vi"/>
				<Item Name="Write to XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(string).vi"/>
				<Item Name="Write to XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="MailWake" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{C80B599A-1628-40CB-86C9-1D86CA4D4F75}</Property>
				<Property Name="App_INI_GUID" Type="Str">{431E1091-44A6-477C-8ECA-524603B36A21}</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{D355164A-07EA-4ECD-89F8-68FDB7D285AA}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">MailWake</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/MailWake</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{BDB201D2-018B-4CEF-96FD-78012BDB1C7E}</Property>
				<Property Name="Destination[0].destName" Type="Str">MailWake.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/MailWake/MailWake.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/MailWake/data</Property>
				<Property Name="Destination[2].destName" Type="Str">Root</Property>
				<Property Name="Destination[2].path" Type="Path">../builds/NI_AB_PROJECTNAME/MailWake</Property>
				<Property Name="DestinationCount" Type="Int">3</Property>
				<Property Name="Source[0].itemID" Type="Str">{BC8765B4-EEDF-48B7-854B-035C4B1F6779}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/mailpop70/MailWake.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">2</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/mailpop70/MailWake.viConfig.xml</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_fileDescription" Type="Str">MailWake</Property>
				<Property Name="TgtF_fileVersion.major" Type="Int">1</Property>
				<Property Name="TgtF_internalName" Type="Str">MailWake</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright ?2014 </Property>
				<Property Name="TgtF_productName" Type="Str">MailWake</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{D3577A80-7247-400D-8958-0141048B285E}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">MailWake.exe</Property>
			</Item>
			<Item Name="MailWakeInstaller" Type="Installer">
				<Property Name="Destination[0].name" Type="Str">MailWake</Property>
				<Property Name="Destination[0].parent" Type="Str">{3912416A-D2E5-411B-AFEE-B63654D690C0}</Property>
				<Property Name="Destination[0].tag" Type="Str">{2AEE706C-4A47-4ECC-BDAA-E1FFB917D16D}</Property>
				<Property Name="Destination[0].type" Type="Str">userFolder</Property>
				<Property Name="DestinationCount" Type="Int">1</Property>
				<Property Name="DistPart[0].flavorID" Type="Str">DefaultFull</Property>
				<Property Name="DistPart[0].productID" Type="Str">{68044F4C-00EA-44D0-84E6-AC29FC5FAA12}</Property>
				<Property Name="DistPart[0].productName" Type="Str">NI LabVIEW Run-Time Engine 2012 SP1 f5</Property>
				<Property Name="DistPart[0].SoftDep[0].dependencyKey" Type="Str">NIBAAA.CB71A788_6D9F_48A0_B960_B67BCFD49F6D</Property>
				<Property Name="DistPart[0].SoftDep[0].productName" Type="Str">NI ActiveX Container</Property>
				<Property Name="DistPart[0].SoftDep[1].dependencyKey" Type="Str">OIBAAA.CB71A788_6D9F_48A0_B960_B67BCFD49F6D</Property>
				<Property Name="DistPart[0].SoftDep[1].productName" Type="Str">NI System Web Server 12.0</Property>
				<Property Name="DistPart[0].SoftDep[2].dependencyKey" Type="Str">PIBAAA.CB71A788_6D9F_48A0_B960_B67BCFD49F6D</Property>
				<Property Name="DistPart[0].SoftDep[2].productName" Type="Str">Math Kernel Libraries</Property>
				<Property Name="DistPart[0].SoftDep[3].dependencyKey" Type="Str">QIBAAA.CB71A788_6D9F_48A0_B960_B67BCFD49F6D</Property>
				<Property Name="DistPart[0].SoftDep[3].productName" Type="Str">NI Logos 5.4</Property>
				<Property Name="DistPart[0].SoftDep[4].dependencyKey" Type="Str">RIBAAA.CB71A788_6D9F_48A0_B960_B67BCFD49F6D</Property>
				<Property Name="DistPart[0].SoftDep[4].productName" Type="Str">NI TDM Streaming 2.4</Property>
				<Property Name="DistPart[0].SoftDep[5].dependencyKey" Type="Str">SIBAAA.CB71A788_6D9F_48A0_B960_B67BCFD49F6D</Property>
				<Property Name="DistPart[0].SoftDep[5].productName" Type="Str">NI LabVIEW 2012 SP1 Web Server</Property>
				<Property Name="DistPart[0].SoftDep[6].dependencyKey" Type="Str">TIBAAA.CB71A788_6D9F_48A0_B960_B67BCFD49F6D</Property>
				<Property Name="DistPart[0].SoftDep[6].productName" Type="Str">NI LabVIEW 2012 SP1 Real-Time NBFifo</Property>
				<Property Name="DistPart[0].SoftDep[7].dependencyKey" Type="Str">YIBAAA.CB71A788_6D9F_48A0_B960_B67BCFD49F6D</Property>
				<Property Name="DistPart[0].SoftDep[7].productName" Type="Str">NI Error Reporting 2012 SP1</Property>
				<Property Name="DistPart[0].SoftDepCount" Type="Int">8</Property>
				<Property Name="DistPart[0].upgradeCode" Type="Str">{20385C41-50B1-4416-AC2A-F7D6423A9BD6}</Property>
				<Property Name="DistPartCount" Type="Int">1</Property>
				<Property Name="INST_autoIncrement" Type="Bool">true</Property>
				<Property Name="INST_buildLocation" Type="Path">../builds/MailWake/MailWakeInstaller</Property>
				<Property Name="INST_buildLocation.type" Type="Str">relativeToCommon</Property>
				<Property Name="INST_buildSpecName" Type="Str">MailWakeInstaller</Property>
				<Property Name="INST_defaultDir" Type="Str">{2AEE706C-4A47-4ECC-BDAA-E1FFB917D16D}</Property>
				<Property Name="INST_productName" Type="Str">MailWake</Property>
				<Property Name="INST_productVersion" Type="Str">1.0.3</Property>
				<Property Name="InstSpecBitness" Type="Str">32-bit</Property>
				<Property Name="InstSpecVersion" Type="Str">12018014</Property>
				<Property Name="MSI_distID" Type="Str">{73A4A434-E6DC-441D-95D1-FB07AD213FF5}</Property>
				<Property Name="MSI_osCheck" Type="Int">0</Property>
				<Property Name="MSI_upgradeCode" Type="Str">{10F6D7B2-65BE-4D8E-B472-58A14A5349EC}</Property>
				<Property Name="RegDest[0].dirName" Type="Str">Software</Property>
				<Property Name="RegDest[0].dirTag" Type="Str">{DDFAFC8B-E728-4AC8-96DE-B920EBB97A86}</Property>
				<Property Name="RegDest[0].parentTag" Type="Str">2</Property>
				<Property Name="RegDestCount" Type="Int">1</Property>
				<Property Name="Source[0].dest" Type="Str">{2AEE706C-4A47-4ECC-BDAA-E1FFB917D16D}</Property>
				<Property Name="Source[0].File[0].dest" Type="Str">{2AEE706C-4A47-4ECC-BDAA-E1FFB917D16D}</Property>
				<Property Name="Source[0].File[0].name" Type="Str">MailWake.exe</Property>
				<Property Name="Source[0].File[0].Shortcut[0].destIndex" Type="Int">3</Property>
				<Property Name="Source[0].File[0].Shortcut[0].name" Type="Str">MailWake</Property>
				<Property Name="Source[0].File[0].Shortcut[0].subDir" Type="Str">MailWake</Property>
				<Property Name="Source[0].File[0].ShortcutCount" Type="Int">1</Property>
				<Property Name="Source[0].File[0].tag" Type="Str">{D3577A80-7247-400D-8958-0141048B285E}</Property>
				<Property Name="Source[0].FileCount" Type="Int">1</Property>
				<Property Name="Source[0].name" Type="Str">MailWake</Property>
				<Property Name="Source[0].tag" Type="Ref">/My Computer/Build Specifications/MailWake</Property>
				<Property Name="Source[0].type" Type="Str">EXE</Property>
				<Property Name="SourceCount" Type="Int">1</Property>
			</Item>
		</Item>
	</Item>
</Project>
