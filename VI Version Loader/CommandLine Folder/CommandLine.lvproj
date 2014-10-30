<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="9008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="IOScan.Faults" Type="Str"></Property>
		<Property Name="IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="IOScan.Period" Type="UInt">10000</Property>
		<Property Name="IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="IOScan.Priority" Type="UInt">9</Property>
		<Property Name="IOScan.ReportModeConflict" Type="Bool">false</Property>
		<Property Name="IOScan.StartEngineOnDeploy" Type="Bool">false</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="CommandLine.vi" Type="VI" URL="../CommandLine.vi"/>
		<Item Name="VI Server.vi" Type="VI" URL="../VI Server.vi"/>
		<Item Name="VI Server Project.vi" Type="VI" URL="../VI Server Project.vi"/>
		<Item Name="VI Server Test.vi" Type="VI" URL="../VI Server Test.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="VI Loader" Type="EXE">
				<Property Name="App_applicationGUID" Type="Str">{A81DEC1C-ADBE-4A99-B738-A9501891CBF6}</Property>
				<Property Name="App_applicationName" Type="Str">VILoader.exe</Property>
				<Property Name="App_fileDescription" Type="Str">VI Loader</Property>
				<Property Name="App_fileVersion.major" Type="Int">1</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{4EF90A95-7D80-43B5-AAEA-778FC090D74D}</Property>
				<Property Name="App_INI_GUID" Type="Str">{CEA8A259-526B-4ED2-B389-1FE0AE0A3FAF}</Property>
				<Property Name="App_internalName" Type="Str">VI Loader</Property>
				<Property Name="App_legalCopyright" Type="Str">Copyright ?2011 </Property>
				<Property Name="App_productName" Type="Str">VI Loader</Property>
				<Property Name="Bld_buildSpecName" Type="Str">VI Loader</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Destination[0].destName" Type="Str">VILoader.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/VI Loader/VILoader.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/VI Loader/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Exe_cmdLineArgs" Type="Bool">true</Property>
				<Property Name="Source[0].itemID" Type="Str">{E2F293D1-32DA-4D2C-9D6C-0AD1EFE8A6B7}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/CommandLine.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
			</Item>
			<Item Name="VI Server Test" Type="EXE">
				<Property Name="App_applicationGUID" Type="Str">{F67DC65C-DEC5-460F-9160-843782EC26D7}</Property>
				<Property Name="App_applicationName" Type="Str">VI Server Test.exe</Property>
				<Property Name="App_fileDescription" Type="Str">VI Server Test</Property>
				<Property Name="App_fileVersion.major" Type="Int">1</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{A9B328A0-2E07-45E1-A91D-B55738CB7C63}</Property>
				<Property Name="App_INI_GUID" Type="Str">{15FE461F-3956-460A-8743-F0E518DD5B15}</Property>
				<Property Name="App_internalName" Type="Str">VI Server Test</Property>
				<Property Name="App_legalCopyright" Type="Str">Copyright ?2011 </Property>
				<Property Name="App_productName" Type="Str">VI Server Test</Property>
				<Property Name="Bld_buildSpecName" Type="Str">VI Server Test</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Destination[0].destName" Type="Str">VI Server Test.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/VI Server Test/VI Server Test.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/VI Server Test/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{02D05687-49E8-4B30-8C75-F530C51F2647}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/VI Server Project.vi</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/VI Server Test.vi</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
			</Item>
			<Item Name="VI Server Project Test" Type="EXE">
				<Property Name="AB_Class_Path" Type="Path">/C/Program Files/National Instruments/LabVIEW 2009/vi.lib/AppBuilder/AB_Classes/EXE/AB_EXE.lvclass</Property>
				<Property Name="AB_UIClass_Path" Type="Path">/C/Program Files/National Instruments/LabVIEW 2009/vi.lib/AppBuilder/AB_Classes/Build/UI/AB_UI_Frmwk_Build.lvclass</Property>
				<Property Name="App_applicationGUID" Type="Str">{DA034FE3-868C-47AA-8ACD-C0AF43BF57FF}</Property>
				<Property Name="App_applicationName" Type="Str">VI Server Project Test.exe</Property>
				<Property Name="App_fileDescription" Type="Str">VI Server Test</Property>
				<Property Name="App_fileVersion.major" Type="Int">1</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{BDB343FD-EAFD-46D1-B485-5D1793BBD517}</Property>
				<Property Name="App_INI_GUID" Type="Str">{2FB50842-6198-4F25-9FEF-E1FCD336CCEF}</Property>
				<Property Name="App_internalName" Type="Str">VI Server Test</Property>
				<Property Name="App_legalCopyright" Type="Str">Copyright ?2011 </Property>
				<Property Name="App_productName" Type="Str">VI Server Test</Property>
				<Property Name="Bld_buildSpecName" Type="Str">VI Server Project Test</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Destination[0].destName" Type="Str">VI Server Project Test.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/VI Server Project Test/VI Server Project Test.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/VI Server Project Test/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{02D05687-49E8-4B30-8C75-F530C51F2647}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/VI Server Project.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
			</Item>
		</Item>
	</Item>
</Project>
