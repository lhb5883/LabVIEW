<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="12008004">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="IOScan.Faults" Type="Str"></Property>
		<Property Name="IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="IOScan.Period" Type="UInt">10000</Property>
		<Property Name="IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="IOScan.Priority" Type="UInt">9</Property>
		<Property Name="IOScan.ReportModeConflict" Type="Bool">true</Property>
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
		<Item Name="Data File Processing UI.vi" Type="VI" URL="../Data File Processing UI.vi"/>
		<Item Name="FullFile.vi" Type="VI" URL="../sub VIs/FullFile.vi"/>
		<Item Name="TDMs.ico" Type="Document" URL="../TDMs.ico"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Bit-array To Byte-array.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Bit-array To Byte-array.vi"/>
				<Item Name="Calc Long Word Padded Width.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Calc Long Word Padded Width.vi"/>
				<Item Name="Check Path.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Path.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="ClearError.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/ClearError.vi"/>
				<Item Name="Create Mask By Alpha.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Create Mask By Alpha.vi"/>
				<Item Name="Directory of Top Level VI.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Directory of Top Level VI.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Flip and Pad for Picture Control.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Flip and Pad for Picture Control.vi"/>
				<Item Name="formatPropertyList.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/formatPropertyList.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="getNamesFromPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/tdmsutil.llb/getNamesFromPath.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="Is File an LLB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/lvfile.llb/Is File an LLB.vi"/>
				<Item Name="LVPointTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPointTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="Read BMP File Data.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File Data.vi"/>
				<Item Name="Read BMP File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File.vi"/>
				<Item Name="Read BMP Header Info.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP Header Info.vi"/>
				<Item Name="Read JPEG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Read JPEG File.vi"/>
				<Item Name="Read PNG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/png.llb/Read PNG File.vi"/>
				<Item Name="Set Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Busy.vi"/>
				<Item Name="Set Cursor (Cursor ID).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Cursor ID).vi"/>
				<Item Name="Set Cursor (Icon Pict).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Icon Pict).vi"/>
				<Item Name="Set Cursor.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="Unset Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Unset Busy.vi"/>
			</Item>
			<Item Name="CursorGet.vi" Type="VI" URL="../sub VIs/CursorGet.vi"/>
			<Item Name="CursorMove.vi" Type="VI" URL="../sub VIs/CursorMove.vi"/>
			<Item Name="CursorMoveSet.vi" Type="VI" URL="../sub VIs/CursorMoveSet.vi"/>
			<Item Name="CursorSet.vi" Type="VI" URL="../sub VIs/CursorSet.vi"/>
			<Item Name="Data Contents Refresh__DV.vi" Type="VI" URL="../sub VIs/Data Contents Refresh__DV.vi"/>
			<Item Name="Data File Processing UI Add Messages.vi" Type="VI" URL="../sub VIs/Data File Processing UI Add Messages.vi"/>
			<Item Name="Data File Processing UI Add Type Message.vi" Type="VI" URL="../sub VIs/Data File Processing UI Add Type Message.vi"/>
			<Item Name="Data File Processing UI Build File Relative Path.vi" Type="VI" URL="../sub VIs/Data File Processing UI Build File Relative Path.vi"/>
			<Item Name="Data File Processing UI Build Type and Data Message.vi" Type="VI" URL="../sub VIs/Data File Processing UI Build Type and Data Message.vi"/>
			<Item Name="Data File Processing UI Build Type Nodata Message.vi" Type="VI" URL="../sub VIs/Data File Processing UI Build Type Nodata Message.vi"/>
			<Item Name="Data File Processing UI Build Type Nodata Messages.vi" Type="VI" URL="../sub VIs/Data File Processing UI Build Type Nodata Messages.vi"/>
			<Item Name="Data File Processing UI Default Runtime Menu Path.vi" Type="VI" URL="../sub VIs/Data File Processing UI Default Runtime Menu Path.vi"/>
			<Item Name="Data File Processing UI Get Message.vi" Type="VI" URL="../sub VIs/Data File Processing UI Get Message.vi"/>
			<Item Name="Data File Processing UI Message Define.ctl" Type="VI" URL="../sub VIs/Data File Processing UI Message Define.ctl"/>
			<Item Name="Data File Processing UI Message Queue.vi" Type="VI" URL="../sub VIs/Data File Processing UI Message Queue.vi"/>
			<Item Name="Data File Processing UI Message Type Define.ctl" Type="VI" URL="../sub VIs/Data File Processing UI Message Type Define.ctl"/>
			<Item Name="Data File Processing UI.rtm" Type="Document" URL="../sub VIs/Data File Processing UI.rtm"/>
			<Item Name="Data File Processing UI_GlobalData.ctl" Type="VI" URL="../sub VIs/Data File Processing UI_GlobalData.ctl"/>
			<Item Name="File Save Result.vi" Type="VI" URL="../sub VIs/File Save Result.vi"/>
			<Item Name="getChannelList Modify.vi" Type="VI" URL="../sub VIs/getChannelList Modify.vi"/>
			<Item Name="Graph Tools.ctl" Type="VI" URL="../sub VIs/Graph Tools.ctl"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="SelectPath.vi" Type="VI" URL="../sub VIs/SelectPath.vi"/>
			<Item Name="Set Control Custom Symbols with Index File (Tree)__Uti.vi" Type="VI" URL="../sub VIs/Set Control Custom Symbols with Index File (Tree)__Uti.vi"/>
			<Item Name="Set DataList Tree Property.vi" Type="VI" URL="../sub VIs/Set DataList Tree Property.vi"/>
			<Item Name="SubVI_CalculateRange.vi" Type="VI" URL="../sub VIs/SubVI_CalculateRange.vi"/>
			<Item Name="SubVI_InitialUI_ResetPanes.vi" Type="VI" URL="../sub VIs/SubVI_InitialUI_ResetPanes.vi"/>
			<Item Name="SubVI_ReadTDMs Header.vi" Type="VI" URL="../sub VIs/SubVI_ReadTDMs Header.vi"/>
			<Item Name="SubVI_ReadTDMs.vi" Type="VI" URL="../sub VIs/SubVI_ReadTDMs.vi"/>
			<Item Name="SubVI_ReadTDMsAll.vi" Type="VI" URL="../sub VIs/SubVI_ReadTDMsAll.vi"/>
			<Item Name="TDMs Group&amp;Channel Name.vi" Type="VI" URL="../sub VIs/TDMs Group&amp;Channel Name.vi"/>
			<Item Name="TDMs Ref.vi" Type="VI" URL="../sub VIs/TDMs Ref.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="TDMsViewer" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{FA2C2B46-66C6-4E21-921C-3BF8DD3601A5}</Property>
				<Property Name="App_INI_GUID" Type="Str">{9318E4F2-F029-48CC-93C6-B20E745185BF}</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{7A7050F5-353A-4AAE-BD6C-7F29A772B174}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">TDMsViewer</Property>
				<Property Name="Bld_defaultLanguage" Type="Str">ChineseS</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/TDMsViewer</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{5521BF55-B5B1-451E-BE15-0B80EF8754BA}</Property>
				<Property Name="Destination[0].destName" Type="Str">TDMsViewer.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/TDMsViewer/TDMsViewer.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">支持目录</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/TDMsViewer/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{3A513ED6-4D36-4914-A9CD-0E5794800CBA}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Data File Processing UI.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/TDMs.ico</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_fileDescription" Type="Str">TDMsViewer</Property>
				<Property Name="TgtF_fileVersion.major" Type="Int">1</Property>
				<Property Name="TgtF_internalName" Type="Str">TDMsViewer</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">版权 2013 </Property>
				<Property Name="TgtF_productName" Type="Str">TDMsViewer</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{F4DD113F-040A-4221-86B4-E47153107F24}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">TDMsViewer.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
