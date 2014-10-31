<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="11008008">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
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
		<Item Name="cDAQ UI Demo v1.2" Type="Folder">
			<Item Name="Controls" Type="Folder">
				<Item Name="Pics" Type="Folder">
					<Item Name="Stop.png" Type="Document" URL="../Controls/Pics/Stop.png"/>
				</Item>
				<Item Name="Handle Images - Operations.ctl" Type="VI" URL="../Controls/Handle Images - Operations.ctl"/>
				<Item Name="ImageType.ctl" Type="VI" URL="../Controls/ImageType.ctl"/>
				<Item Name="Init-Run-End States.ctl" Type="VI" URL="../Controls/Init-Run-End States.ctl"/>
			</Item>
			<Item Name="Documents" Type="Folder">
				<Item Name="module_descriptions.txt" Type="Document" URL="../Documents/module_descriptions.txt"/>
			</Item>
			<Item Name="Images" Type="Folder"/>
			<Item Name="Pics" Type="Folder">
				<Item Name="DEFAULT.png" Type="Document" URL="../Pics/DEFAULT.png"/>
				<Item Name="NI 9201.png" Type="Document" URL="../Pics/NI 9201.png"/>
				<Item Name="NI 9207.png" Type="Document" URL="../Pics/NI 9207.png"/>
				<Item Name="NI 9211.png" Type="Document" URL="../Pics/NI 9211.png"/>
				<Item Name="NI 9215.png" Type="Document" URL="../Pics/NI 9215.png"/>
				<Item Name="NI 9219.png" Type="Document" URL="../Pics/NI 9219.png"/>
				<Item Name="NI 9222.png" Type="Document" URL="../Pics/NI 9222.png"/>
				<Item Name="NI 9234.png" Type="Document" URL="../Pics/NI 9234.png"/>
				<Item Name="NI 9263.png" Type="Document" URL="../Pics/NI 9263.png"/>
				<Item Name="NI 9411.png" Type="Document" URL="../Pics/NI 9411.png"/>
				<Item Name="NI 9472.png" Type="Document" URL="../Pics/NI 9472.png"/>
				<Item Name="NI 9481.png" Type="Document" URL="../Pics/NI 9481.png"/>
				<Item Name="NI UNSUPPORTED.png" Type="Document" URL="../Pics/NI UNSUPPORTED.png"/>
			</Item>
			<Item Name="SubVIs" Type="Folder">
				<Item Name="Controls" Type="Folder">
					<Item Name="4ch.ctl" Type="VI" URL="../SubVIs/Controls/4ch.ctl"/>
					<Item Name="4ch_ao.ctl" Type="VI" URL="../SubVIs/Controls/4ch_ao.ctl"/>
					<Item Name="Config UI Global Stop - Operations.ctl" Type="VI" URL="../SubVIs/Controls/Config UI Global Stop - Operations.ctl"/>
					<Item Name="Control FP Objects - Operations.ctl" Type="VI" URL="../SubVIs/Controls/Control FP Objects - Operations.ctl"/>
					<Item Name="GetModueDescriptionsOperations.ctl" Type="VI" URL="../SubVIs/Controls/GetModueDescriptionsOperations.ctl"/>
					<Item Name="Global Stop - Operations.ctl" Type="VI" URL="../SubVIs/Controls/Global Stop - Operations.ctl"/>
					<Item Name="HW Server Status.ctl" Type="VI" URL="../SubVIs/Controls/HW Server Status.ctl"/>
					<Item Name="INIT- READ - WRITE.ctl" Type="VI" URL="../SubVIs/Controls/INIT- READ - WRITE.ctl"/>
					<Item Name="Init-Write-Read.ctl" Type="VI" URL="../SubVIs/Controls/Init-Write-Read.ctl"/>
					<Item Name="MeasVIStatusMemoryOperations.ctl" Type="VI" URL="../SubVIs/Controls/MeasVIStatusMemoryOperations.ctl"/>
					<Item Name="ModuleCluster.ctl" Type="VI" URL="../SubVIs/Controls/ModuleCluster.ctl"/>
					<Item Name="ModuleConfigurationCluster.ctl" Type="VI" URL="../SubVIs/Controls/ModuleConfigurationCluster.ctl"/>
					<Item Name="ModulePicCluster.ctl" Type="VI" URL="../SubVIs/Controls/ModulePicCluster.ctl"/>
					<Item Name="Read - Write.ctl" Type="VI" URL="../SubVIs/Controls/Read - Write.ctl"/>
					<Item Name="TransparencyEffectOperations.ctl" Type="VI" URL="../SubVIs/Controls/TransparencyEffectOperations.ctl"/>
				</Item>
				<Item Name="cDAQ - Launch Configuration SW.vi" Type="VI" URL="../SubVIs/cDAQ - Launch Configuration SW.vi"/>
				<Item Name="cDAQ UI - Handle Config Launch.vi" Type="VI" URL="../SubVIs/cDAQ UI - Handle Config Launch.vi"/>
				<Item Name="cDAQ UI - Handle Images.vi" Type="VI" URL="../SubVIs/cDAQ UI - Handle Images.vi"/>
				<Item Name="Chassis Type Memory.vi" Type="VI" URL="../SubVIs/Chassis Type Memory.vi"/>
				<Item Name="Check Chassis Status.vi" Type="VI" URL="../SubVIs/Check Chassis Status.vi"/>
				<Item Name="Clear Specific Error.vi" Type="VI" URL="../SubVIs/Clear Specific Error.vi"/>
				<Item Name="CloseAllVIs.vi" Type="VI" URL="../SubVIs/CloseAllVIs.vi"/>
				<Item Name="Config UI - Global Stop.vi" Type="VI" URL="../SubVIs/Config UI - Global Stop.vi"/>
				<Item Name="ConvertRunModesBack.vi" Type="VI" URL="../SubVIs/ConvertRunModesBack.vi"/>
				<Item Name="CreatemodulePicString.vi" Type="VI" URL="../SubVIs/CreatemodulePicString.vi"/>
				<Item Name="cRIO Finder.vi" Type="VI" URL="../SubVIs/cRIO Finder.vi"/>
				<Item Name="Delete Unused Pictures.vi" Type="VI" URL="../SubVIs/Delete Unused Pictures.vi"/>
				<Item Name="Demo 1 - Image Gallery - Check Image Type.vi" Type="VI" URL="../SubVIs/Demo 1 - Image Gallery - Check Image Type.vi"/>
				<Item Name="Demo 1 - Image Gallery - Get Image File.vi" Type="VI" URL="../SubVIs/Demo 1 - Image Gallery - Get Image File.vi"/>
				<Item Name="Demo 1 - Image Gallery - Get Image Paths From Folder.vi" Type="VI" URL="../SubVIs/Demo 1 - Image Gallery - Get Image Paths From Folder.vi"/>
				<Item Name="Demo 1 - Image Gallery - Get Mouse X Axis Position.vi" Type="VI" URL="../SubVIs/Demo 1 - Image Gallery - Get Mouse X Axis Position.vi"/>
				<Item Name="Demo 1 - Image Gallery - Get Refs to Dynamic VIs.vi" Type="VI" URL="../SubVIs/Demo 1 - Image Gallery - Get Refs to Dynamic VIs.vi"/>
				<Item Name="Error - StoreError.vi" Type="VI" URL="../SubVIs/Error - StoreError.vi"/>
				<Item Name="Get Chassis and modules list.vi" Type="VI" URL="../SubVIs/Get Chassis and modules list.vi"/>
				<Item Name="Get Window Handle.vi" Type="VI" URL="../SubVIs/Get Window Handle.vi"/>
				<Item Name="GetButtonNumber.vi" Type="VI" URL="../SubVIs/GetButtonNumber.vi"/>
				<Item Name="GetCurrentPath.vi" Type="VI" URL="../SubVIs/GetCurrentPath.vi"/>
				<Item Name="GetHWInfo.vi" Type="VI" URL="../SubVIs/GetHWInfo.vi"/>
				<Item Name="GetModuleDescriptions.vi" Type="VI" URL="../SubVIs/GetModuleDescriptions.vi"/>
				<Item Name="GetModulePic.vi" Type="VI" URL="../SubVIs/GetModulePic.vi"/>
				<Item Name="GetRunModes.vi" Type="VI" URL="../SubVIs/GetRunModes.vi"/>
				<Item Name="GetSlotNr.vi" Type="VI" URL="../SubVIs/GetSlotNr.vi"/>
				<Item Name="Global Stop.vi" Type="VI" URL="../SubVIs/Global Stop.vi"/>
				<Item Name="Handle UI Objects.vi" Type="VI" URL="../SubVIs/Handle UI Objects.vi"/>
				<Item Name="HandleDigitalInputModuleNames.vi" Type="VI" URL="../SubVIs/HandleDigitalInputModuleNames.vi"/>
				<Item Name="HandleInputModuleNames.vi" Type="VI" URL="../SubVIs/HandleInputModuleNames.vi"/>
				<Item Name="HandleModuleNames.vi" Type="VI" URL="../SubVIs/HandleModuleNames.vi"/>
				<Item Name="HideShowFrontPanel.vi" Type="VI" URL="../SubVIs/HideShowFrontPanel.vi"/>
				<Item Name="HW_Server.vi" Type="VI" URL="../SubVIs/HW_Server.vi"/>
				<Item Name="HW_Server_memory.vi" Type="VI" URL="../SubVIs/HW_Server_memory.vi"/>
				<Item Name="Images - Delete all png images.vi" Type="VI" URL="../SubVIs/Images - Delete all png images.vi"/>
				<Item Name="LaunchConfigVIs.vi" Type="VI" URL="../SubVIs/LaunchConfigVIs.vi"/>
				<Item Name="LaunchTestPanel.vi" Type="VI" URL="../SubVIs/LaunchTestPanel.vi"/>
				<Item Name="LaunchVI_BG.vi" Type="VI" URL="../SubVIs/LaunchVI_BG.vi"/>
				<Item Name="Meas - Filter Meas VI names.vi" Type="VI" URL="../SubVIs/Meas - Filter Meas VI names.vi"/>
				<Item Name="Meas - Meas VI names memory.vi" Type="VI" URL="../SubVIs/Meas - Meas VI names memory.vi"/>
				<Item Name="Meas - Send Meas VI Names.vi" Type="VI" URL="../SubVIs/Meas - Send Meas VI Names.vi"/>
				<Item Name="ModuleConfigurationMemory.vi" Type="VI" URL="../SubVIs/ModuleConfigurationMemory.vi"/>
				<Item Name="Queue - Engine - Main.vi" Type="VI" URL="../SubVIs/Queue - Engine - Main.vi"/>
				<Item Name="ReconnectMessage.vi" Type="VI" URL="../SubVIs/ReconnectMessage.vi"/>
				<Item Name="Remove Unconfigured DAQmx Devices.vi" Type="VI" URL="../SubVIs/Remove Unconfigured DAQmx Devices.vi"/>
				<Item Name="Run VI Transparently.vi" Type="VI" URL="../SubVIs/Run VI Transparently.vi"/>
				<Item Name="Save Images Tool.vi" Type="VI" URL="../SubVIs/Save Images Tool.vi"/>
				<Item Name="SelectChassis.vi" Type="VI" URL="../SubVIs/SelectChassis.vi"/>
				<Item Name="Sequencer - Create Sequence.vi" Type="VI" URL="../SubVIs/Sequencer - Create Sequence.vi"/>
				<Item Name="Set Window Color to Transparent.vi" Type="VI" URL="../SubVIs/Set Window Color to Transparent.vi"/>
				<Item Name="SortRefs.vi" Type="VI" URL="../SubVIs/SortRefs.vi"/>
				<Item Name="Testing.vi" Type="VI" URL="../SubVIs/Testing.vi"/>
				<Item Name="TransparencyEffect.vi" Type="VI" URL="../SubVIs/TransparencyEffect.vi"/>
				<Item Name="WaveformBufferGeneration_(multi).vi" Type="VI" URL="../SubVIs/WaveformBufferGeneration_(multi).vi"/>
			</Item>
			<Item Name="cDAQ - UI - Main.vi" Type="VI" URL="../cDAQ - UI - Main.vi"/>
			<Item Name="Demo Script - Coolest cDAQ Demo Ever.docx" Type="Document" URL="../Demo Script - Coolest cDAQ Demo Ever.docx"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Acquire Input Data.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Acquire Input Data.vi"/>
				<Item Name="Bit-array To Byte-array.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/Bit-array To Byte-array.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Calc Long Word Padded Width.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Calc Long Word Padded Width.vi"/>
				<Item Name="Check Color Table Size.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Color Table Size.vi"/>
				<Item Name="Check Data Size.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Data Size.vi"/>
				<Item Name="Check File Permissions.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check File Permissions.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Path.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Path.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="Close Input Device.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Close Input Device.vi"/>
				<Item Name="closeJoystick.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeJoystick.vi"/>
				<Item Name="closeKeyboard.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeKeyboard.vi"/>
				<Item Name="closeMouse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeMouse.vi"/>
				<Item Name="Color to RGB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/Color to RGB.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Create Mask By Alpha.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Create Mask By Alpha.vi"/>
				<Item Name="DAQmx Clear Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Clear Task.vi"/>
				<Item Name="DAQmx Fill In Error Info.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/miscellaneous.llb/DAQmx Fill In Error Info.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Directory of Top Level VI.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Directory of Top Level VI.vi"/>
				<Item Name="Draw Flattened Pixmap.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Draw Flattened Pixmap.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="errorList.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/errorList.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="FixBadRect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/pictutil.llb/FixBadRect.vi"/>
				<Item Name="Flip and Pad for Picture Control.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Flip and Pad for Picture Control.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="Initialize Mouse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Initialize Mouse.vi"/>
				<Item Name="joystickAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/joystickAcquire.vi"/>
				<Item Name="keyboardAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/keyboardAcquire.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVPointTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVPointTypeDef.ctl"/>
				<Item Name="mouseAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/mouseAcquire.vi"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_MABase.lvlib" Type="Library" URL="/&lt;vilib&gt;/measure/NI_MABase.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="nisyscfg.lvlib" Type="Library" URL="/&lt;vilib&gt;/nisyscfg/nisyscfg.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Read BMP File Data.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File Data.vi"/>
				<Item Name="Read BMP File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP File.vi"/>
				<Item Name="Read BMP Header Info.vi" Type="VI" URL="/&lt;vilib&gt;/picture/bmp.llb/Read BMP Header Info.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read From Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (DBL).vi"/>
				<Item Name="Read From Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (I64).vi"/>
				<Item Name="Read From Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (string).vi"/>
				<Item Name="Read From Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File.vi"/>
				<Item Name="Read JPEG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Read JPEG File.vi"/>
				<Item Name="Read Lines From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File.vi"/>
				<Item Name="Read PNG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/png.llb/Read PNG File.vi"/>
				<Item Name="RGB to Color.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/RGB to Color.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write PNG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/png.llb/Write PNG File.vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write To Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (DBL).vi"/>
				<Item Name="Write To Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (I64).vi"/>
				<Item Name="Write To Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (string).vi"/>
				<Item Name="Write To Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File.vi"/>
			</Item>
			<Item Name="autoconf.dll" Type="Document" URL="../DLLs/autoconf.dll"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/C/Program Files (x86)/National Instruments/LabVIEW 2011/resource/lvanlys.dll"/>
			<Item Name="lvinput.dll" Type="Document" URL="/C/Program Files (x86)/National Instruments/LabVIEW 2011/resource/lvinput.dll"/>
			<Item Name="nilvaiu.dll" Type="Document" URL="nilvaiu.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nisyscfg.dll" Type="Document" URL="nisyscfg.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Settings - Default.vi" Type="VI" URL="../Dynamic Loading/Settings/Settings - Default.vi"/>
			<Item Name="user32.dll" Type="Document" URL="user32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
