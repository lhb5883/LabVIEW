<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="8608001">
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
		<Item Name="window1.vi" Type="VI" URL="../window1.vi"/>
		<Item Name="main_MDI.vi" Type="VI" URL="../main_MDI.vi"/>
		<Item Name="lava_make_child_window.vi" Type="VI" URL="../../lava_make_child_window.vi"/>
		<Item Name="Set Parent Window.vi" Type="VI" URL="../Set Parent Window.vi"/>
		<Item Name="FG_registeredwindows.vi" Type="VI" URL="../FG_registeredwindows.vi"/>
		<Item Name="child window props.ctl" Type="VI" URL="../child window props.ctl"/>
		<Item Name="FG states.ctl" Type="VI" URL="../FG states.ctl"/>
		<Item Name="VI Name for window Title.vi" Type="VI" URL="../VI Name for window Title.vi"/>
		<Item Name="testerofwindows.vi" Type="VI" URL="../testerofwindows.vi"/>
		<Item Name="containerwindow.vi" Type="VI" URL="../containerwindow.vi"/>
		<Item Name="MDI_global.vi" Type="VI" URL="../MDI_global.vi"/>
		<Item Name="close_and_dereg_window.vi" Type="VI" URL="../close_and_dereg_window.vi"/>
		<Item Name="AbortAndRunVI.vi" Type="VI" URL="../AbortAndRunVI.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Merge Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Merge Errors.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
			</Item>
			<Item Name="Get Window Handle.vi" Type="VI" URL="../Get Window Handle.vi"/>
			<Item Name="USER32.DLL" Type="Document" URL="USER32.DLL">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="LoadAndRun.vi" Type="VI" URL="../../../../../Program Files/National Instruments/LabVIEW 8.6/examples/general/controls/subpanel.llb/LoadAndRun.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
