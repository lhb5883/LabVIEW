//	Copyright Pavel Zolnikov, 2002
//

using System;
using System.Runtime.InteropServices;
using System.Reflection;

namespace BandObjectLib
{
	/// <summary>
	/// Represents different styles of a band object.
	/// </summary>
	[Flags]
	[Serializable]
	public enum BandObjectStyle : uint
	{
		Vertical		= 1,
		Horizontal		= 2,
		ExplorerToolbar = 4,
		TaskbarToolBar	= 8
	}
	
	/// <summary>
	/// Specifies Style of the band object, its Name(displayed in explorer menu) and HelpText(displayed in status bar when menu command selected).
	/// </summary>
	[AttributeUsage(AttributeTargets.Class)]
	public class BandObjectAttribute : System.Attribute
	{
		public BandObjectAttribute(){}

		public BandObjectAttribute(string name, BandObjectStyle style)
		{
			Name = name;
			Style = style;
		}
		public BandObjectStyle Style;
		public string Name;
		public string HelpText;
	}
}