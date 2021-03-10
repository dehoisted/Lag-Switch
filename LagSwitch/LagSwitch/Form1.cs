using System;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Windows.Forms;
using NetFwTypeLib;
using Paket;

namespace LagSwitch
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            if (!File.Exists("README.text"))
            {
                using (StreamWriter sr = File.CreateText("README.txt"))
                {
                    sr.Write("Q: Will this turn off my entire internet when I press the toggle on keybind? \nA: No, this will only stop roblox from accessing the internet, you will be able to use other processes without any internet issues.\n\nQ: How can I get in contact with the owner?\nA: Join the discord, my DMs are on. \n\nQ: Will I get banned for using this? \nA: Although there is a very odd chance of being banned, there is still a slight chance that yes, you can get banned for using this.\n\nQ: Whenever I join a roblox game I can't connect, even when the program is off.\nA: Although this is very rare, it's a simple easy fix. in the search bar type in 'Windows Defender Firewall' and click enter. When done, you should see 'Advanced settings' at the middle left of your screen, click it. Now, go to outbound rules and right click 'Block Internet' and click delete. You should now have no issues and the problem be resolved.");
                }
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            using (var link1 = new WebClient())
            {
                if (link1.DownloadString("https://pastebin.com/raw/LJ79wM95").Contains("Not_Updated"))
                {
                    int num = (int)MessageBox.Show("Lag Switch is not updated!", "Error!", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Environment.Exit(100);
                    Application.Exit();
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            bool FireWallBlocked = new bool();
            FireWallBlocked = false;
            while (true)
            {
                if (GetAsyncKeyState((Keys)toggle_on_key) < 0)
                {
                    if (FireWallBlocked == false)
                    {
                        if (UpdateProcess.Processes.FindProcessByFileName("RobloxPlayerBeta") != null)
                        {
                            FireWallBlocked = true;
                            INetFwRule firewallRule = (INetFwRule)Activator.CreateInstance(
                            Type.GetTypeFromProgID("HNetCfg.FWRule"));
                            firewallRule.Action = NET_FW_ACTION_.NET_FW_ACTION_BLOCK;
                            firewallRule.Description = "Used to block all internet access.";
                            firewallRule.Direction = NET_FW_RULE_DIRECTION_.NET_FW_RULE_DIR_OUT;
                            firewallRule.Enabled = true;
                            firewallRule.InterfaceTypes = "All";
                            firewallRule.Name = "Block Internet";

                            INetFwPolicy2 firewallPolicy = (INetFwPolicy2)Activator.CreateInstance(
                            Type.GetTypeFromProgID("HNetCfg.FwPolicy2"));
                            firewallPolicy.Rules.Add(firewallRule);
                            firewallRule.ApplicationName = UpdateProcess.Processes.FindProcessByFileName("RobloxPlayerBeta");
                            Console.Beep(1000, 100);
                        }


                    }
                    else if (UpdateProcess.Processes.FindProcessByFileName("RobloxPlayerBeta") == null && FireWallBlocked == false)
                    {
                        Console.WriteLine("RobloxPlayerBeta not found in process list.");
                    }
                    System.Threading.Thread.Sleep(50);
                }
                else if (GetAsyncKeyState((Keys)toggle_off_key) < 0)
                {
                    if (FireWallBlocked == true)
                    {
                        FireWallBlocked = false;
                        INetFwPolicy2 firewallPolicy = (INetFwPolicy2)Activator.CreateInstance(
                        Type.GetTypeFromProgID("HNetCfg.FwPolicy2"));
                        firewallPolicy.Rules.Remove("Block Internet");
                        Console.Beep(1000, 100);
                    }
                }
                System.Threading.Thread.Sleep(50);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Process[] roblox = Process.GetProcesses();

            foreach (Process openedroblox in roblox)

            {
                bool flag = openedroblox.ProcessName == "RobloxPlayerBeta";

                if (flag)

                {
                    openedroblox.Kill();
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}