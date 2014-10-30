using System;
using System.ComponentModel;
using System.Windows.Forms;
using BandObjectLib;
using System.Runtime.InteropServices;

namespace SampleBars
{
	[Guid("AE07101B-46D4-4a98-AF68-0333EA26E113")]
	[BandObject("Hello World Bar", BandObjectStyle.Horizontal | BandObjectStyle.ExplorerToolbar | BandObjectStyle.TaskbarToolBar, HelpText = "Shows bar that says hello.")]
	public class HelloWorldBar : BandObject
	{
        
        
        public System.Windows.Forms.Button button1;
        private ProgressBar progressBar1;
        private Timer timer1;
        private IContainer components;

		public HelloWorldBar()
		{
			InitializeComponent();
		}

		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if( components != null )
					components.Dispose();
			}
			base.Dispose( disposing );
		}

		#region Component Designer generated code
		private void InitializeComponent()
		{
            this.components = new System.ComponentModel.Container();
            this.button1 = new System.Windows.Forms.Button();
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.button1.BackColor = System.Drawing.SystemColors.HotTrack;
            this.button1.ForeColor = System.Drawing.SystemColors.Info;
            this.button1.Location = new System.Drawing.Point(0, 0);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(37, 24);
            this.button1.TabIndex = 0;
            this.button1.Text = "Say Hello";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // progressBar1
            // 
            this.progressBar1.Location = new System.Drawing.Point(43, 3);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(104, 18);
            this.progressBar1.TabIndex = 1;
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // HelloWorldBar
            // 
            this.Controls.Add(this.progressBar1);
            this.Controls.Add(this.button1);
            this.MinSize = new System.Drawing.Size(150, 24);
            this.Name = "HelloWorldBar";
            this.Size = new System.Drawing.Size(150, 24);
            this.Title = "Hello Bar";
            this.ResumeLayout(false);

		}
		#endregion

		public void button1_Click(object sender, System.EventArgs e)
		{
			//MessageBox.Show("ZZZZZZ Hello, World!");
            if ( timer1.Tag != "Stoped")
            {
                timer1.Stop();
                timer1.Tag = "Stoped";
            }
            else
            {
                timer1.Start();
                timer1.Tag = "Started";
            }

		}

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (progressBar1.Value<progressBar1.Maximum)
            {
                progressBar1.Value++;
            }
            else
            {
                progressBar1.Value=0;
            
            }
        }
	}

    
}
