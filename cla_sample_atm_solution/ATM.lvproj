<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="12008004">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="TypeDefs" Type="Folder">
			<Item Name="ATM Controller State.ctl" Type="VI" URL="../TypeDefs/ATM Controller State.ctl"/>
			<Item Name="CTRL to UI Command.ctl" Type="VI" URL="../TypeDefs/CTRL to UI Command.ctl"/>
			<Item Name="CTRL to UI Message.ctl" Type="VI" URL="../TypeDefs/CTRL to UI Message.ctl"/>
			<Item Name="Error Classification.ctl" Type="VI" URL="../TypeDefs/Error Classification.ctl"/>
			<Item Name="Error Handler Commands.ctl" Type="VI" URL="../TypeDefs/Error Handler Commands.ctl"/>
			<Item Name="Record.ctl" Type="VI" URL="../TypeDefs/Record.ctl"/>
			<Item Name="Simulated Database Command.ctl" Type="VI" URL="../TypeDefs/Simulated Database Command.ctl"/>
			<Item Name="UI Items.ctl" Type="VI" URL="../TypeDefs/UI Items.ctl"/>
			<Item Name="UI to CTRL Command.ctl" Type="VI" URL="../TypeDefs/UI to CTRL Command.ctl"/>
			<Item Name="UI to CTRL Message.ctl" Type="VI" URL="../TypeDefs/UI to CTRL Message.ctl"/>
			<Item Name="User Console Commands.ctl" Type="VI" URL="../TypeDefs/User Console Commands.ctl"/>
		</Item>
		<Item Name="SubVIs" Type="Folder">
			<Item Name="Withdrawal.vi" Type="VI" URL="../SubVIs/Withdrawal.vi"/>
			<Item Name="State Processing Logic.vi" Type="VI" URL="../SubVIs/State Processing Logic.vi"/>
			<Item Name="ATM Menu Handler.vi" Type="VI" URL="../SubVIs/ATM Menu Handler.vi"/>
			<Item Name="Handle Error.vi" Type="VI" URL="../SubVIs/Handle Error.vi"/>
			<Item Name="User Console Interface.vi" Type="VI" URL="../SubVIs/User Console Interface.vi"/>
			<Item Name="ATM Message Handler.vi" Type="VI" URL="../SubVIs/ATM Message Handler.vi"/>
			<Item Name="Write Error Log Entry.vi" Type="VI" URL="../SubVIs/Write Error Log Entry.vi"/>
		</Item>
		<Item Name="Top-Level Modules" Type="Folder">
			<Item Name="Simulated Console.vi" Type="VI" URL="../Top-level Modules/Simulated Console.vi"/>
			<Item Name="Account Database.vi" Type="VI" URL="../Top-level Modules/Account Database.vi"/>
			<Item Name="ATM Controller.vi" Type="VI" URL="../Top-level Modules/ATM Controller.vi"/>
		</Item>
		<Item Name="Keypad.xctl" Type="XControl" URL="../Keypad/Keypad.xctl"/>
		<Item Name="Simulation Interface.vi" Type="VI" URL="../Simulation Interface.vi"/>
		<Item Name="MainFrameWork.vi" Type="VI" URL="../MainFrameWork.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="XControlSupport.lvlib" Type="Library" URL="/&lt;vilib&gt;/_xctls/XControlSupport.lvlib"/>
				<Item Name="Version To Dotted String.vi" Type="VI" URL="/&lt;vilib&gt;/_xctls/Version To Dotted String.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
