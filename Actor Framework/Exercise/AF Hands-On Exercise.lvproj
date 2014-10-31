<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="12008004">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="IOScan.Faults" Type="Str"></Property>
		<Property Name="IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="IOScan.Period" Type="UInt">10000</Property>
		<Property Name="IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="IOScan.Priority" Type="UInt">9</Property>
		<Property Name="IOScan.ReportModeConflict" Type="Bool">true</Property>
		<Property Name="IOScan.StartEngineOnDeploy" Type="Bool">false</Property>
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
		<Item Name="Support VIs" Type="Folder">
			<Item Name="Cooler Panel UI Components.vi" Type="VI" URL="../Support/Cooler Panel UI Components.vi"/>
			<Item Name="Unit Data.ctl" Type="VI" URL="../Support/Unit Data.ctl"/>
		</Item>
		<Item Name="Test VIs" Type="Folder">
			<Item Name="Dual Fan Test.vi" Type="VI" URL="../Support/Dual Fan Test.vi"/>
			<Item Name="Water Level Test.vi" Type="VI" URL="../Support/Water Level Test.vi"/>
			<Item Name="Cooler Test.vi" Type="VI" URL="../Support/Cooler Test.vi"/>
		</Item>
		<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
		<Item Name="Cooler UI.lvlib" Type="Library" URL="../Cooler UI/Cooler UI.lvlib"/>
		<Item Name="Cooler.lvlib" Type="Library" URL="../Cooler/Cooler.lvlib"/>
		<Item Name="Dual Fan.lvlib" Type="Library" URL="../Dual Controller/Dual Fan.lvlib"/>
		<Item Name="Level Controller.lvlib" Type="Library" URL="../Level Controller/Level Controller.lvlib"/>
		<Item Name="Simulation.lvlib" Type="Library" URL="../../Simulation/Simulation.lvlib"/>
		<Item Name="Timed Loop Controller.lvlib" Type="Library" URL="../Timed Loop Controller/Timed Loop Controller.lvlib"/>
		<Item Name="Water Level.lvclass" Type="LVClass" URL="../Water Level/Water Level.lvclass"/>
		<Item Name="Feedback Evaporative Cooler Demo.vi" Type="VI" URL="../Feedback Evaporative Cooler Demo.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
				<Item Name="Time-Delayed Send Message Core.vi" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delayed Send Message Core.vi"/>
				<Item Name="Time-Delayed Send Message.vi" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delayed Send Message.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
