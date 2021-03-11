using System;
using System.Net;
using System.Threading;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.IO;
using NetFwTypeLib;

namespace ConsoleSwitch
{
    class Program
    {
        [DllImport("user32.dll")]
        static extern short GetAsyncKeyState(Keys vkey);

        static void Main(string[] args)
        {
            using (var c = new WebClient())
            {
                if (c.DownloadString("https://pastebin.com/raw/LJ79wM95").Contains("Not_Updated"))
                {
                    Console.ForegroundColor = ConsoleColor.Magenta;
                    Console.WriteLine("Program isnt currently updated");
                    Console.ReadLine();
                    Environment.Exit(100);
                    Application.Exit();
                }
            }
            handler = new ConsoleEventDelegate(ConsoleEventCallback);
            SetConsoleCtrlHandler(handler, true);

            if (!File.Exists("README.text"))
            {
                using (StreamWriter sr = File.CreateText("README.txt"))
                {
                    sr.Write("Q: Will this turn off my entire internet when I press the toggle on keybind? \nA: No, this will only stop roblox from accessing the internet, you will be able to use other processes without any internet issues.\n\nQ: How can I get in contact with the owner?\nA: Join the discord, my DMs are on. \n\nQ: Will I get banned for using this? \nA: Although there is a very odd chance of being banned, there is still a slight chance that yes, you can get banned for using this.\n\nQ: Whenever I join a roblox game I can't connect, even when the program is off.\nA: Although this is very rare, it's a simple easy fix. in the search bar type in 'Windows Defender Firewall' and click enter. When done, you should see 'Advanced settings' at the middle left of your screen, click it. Now, go to outbound rules and right click 'Block Internet' and click delete. You should now have no issues and the problem be resolved.");
                }
            }
        StartMenu:
            {
                Console.ForegroundColor = ConsoleColor.Cyan;
                FC("     ██████╗ ██████╗ ███╗   ██╗███████╗ ██████╗ ██╗     ███████╗    ███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗");
                FC("    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██╔═══██╗██║     ██╔════╝    ██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║");
                FC("    ██║     ██║   ██║██╔██╗ ██║███████╗██║   ██║██║     █████╗      ███████╗██║ █╗ ██║██║   ██║   ██║     ███████║");
                FC("    ██║     ██║   ██║██║╚██╗██║╚════██║██║   ██║██║     ██╔══╝      ╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║");
                FC("    ╚██████╗╚██████╔╝██║ ╚████║███████║╚██████╔╝███████╗███████╗    ███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║");
                FC("     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚══════╝╚══════╝    ╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝");
                for (var i = 0; i < 4; i++) { FC(""); }

                Console.ForegroundColor = ConsoleColor.DarkRed;
                CenterText("[1] Lagswitch");
                CenterText("[2] Discord Server");
                CenterText("[3] Lagswitch status");
                CenterText("[4] Help");
                for (var a = 0; a < 2; a++) { FC(""); }
                Console.ForegroundColor = ConsoleColor.Green;
                Console.Write("                                                    > ");
            }
            int MenuRead = Console.ReadLine();

            // use cases instead of if statements
            // Made the code cleaner -- orlando 

            switch (MenuRead)
            {
                case 1:
                    lagswitch();
                    break;

                case 2:
                    System.Diagnostics.Process.Start("https://discord.gg/zcTNTJBPMj");
                    Console.Clear();
                    goto StartMenu;
                    break;

                case 3:
                    using (var client = new WebClient())
                    {
                        if (client.DownloadString("https://pastebin.com/AP1RhGrQ").Contains("ONLINE"))
                        {
                            var oldc = Console.ForegroundColor;
                            Console.ForegroundColor = ConsoleColor.Green;
                            CenterText("Lagswitch online");
                            Console.ForegroundColor = oldc;
                            Thread.Sleep(1000);
                            Console.Clear();
                            goto StartMenu;
                        }
                        else
                        {
                            Console.WriteLine("Lagswitch offline, join the discord (.gg/zcTNTJBPMj)");
                            Thread.Sleep(1000);
                            Console.Clear();
                            goto StartMenu;
                        }
                    }

                case 4:
                    System.Diagnostics.Process.Start("README.txt");
                    Console.Clear();
                    goto StartMenu;

                default:
                    Console.Clear();
                    //Console.Key
                    goto StartMenu;
            }
        }

        static ConsoleEventDelegate handler;   // Keeps it from getting garbage collected
                                               // Pinvoke
        private delegate bool ConsoleEventDelegate(int eventType);
        [DllImport("kernel32.dll", SetLastError = true)]
        private static extern bool SetConsoleCtrlHandler(ConsoleEventDelegate callback, bool add);
        static bool ConsoleEventCallback(int eventType)
        {
            if (eventType == 2)
            {
                INetFwPolicy2 firewallPolicy = (INetFwPolicy2)Activator.CreateInstance(
Type.GetTypeFromProgID("HNetCfg.FwPolicy2"));
                firewallPolicy.Rules.Remove("Block Internet");
            }
            return false;
        }

        public static void lagswitch()
        {
            Console.Clear();
            char toggle_on_key = new char();
            char toggle_off_key = new char();
            Console.WriteLine("Loading functions...");
            Thread.Sleep(900);
            Console.WriteLine("Grabbed version!");
            Thread.Sleep(400);
            Console.Clear();
            Console.ForegroundColor = ConsoleColor.Cyan;
            FC("     ██████╗ ██████╗ ███╗   ██╗███████╗ ██████╗ ██╗     ███████╗    ███████╗██╗    ██╗██╗████████╗ ██████╗██╗  ██╗");
            FC("    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██╔═══██╗██║     ██╔════╝    ██╔════╝██║    ██║██║╚══██╔══╝██╔════╝██║  ██║");
            FC("    ██║     ██║   ██║██╔██╗ ██║███████╗██║   ██║██║     █████╗      ███████╗██║ █╗ ██║██║   ██║   ██║     ███████║");
            FC("    ██║     ██║   ██║██║╚██╗██║╚════██║██║   ██║██║     ██╔══╝      ╚════██║██║███╗██║██║   ██║   ██║     ██╔══██║");
            FC("    ╚██████╗╚██████╔╝██║ ╚████║███████║╚██████╔╝███████╗███████╗    ███████║╚███╔███╔╝██║   ██║   ╚██████╗██║  ██║");
            FC("     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚══════╝╚══════╝    ╚══════╝ ╚══╝╚══╝ ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝");
            for (var i = 0; i < 4; i++) { FC(""); }
            KeysConverter kc = new KeysConverter();
            Console.ForegroundColor = ConsoleColor.Green;
            CenterText("Toggle on key");
            var input = Console.ReadKey(true);
            toggle_on_key = Convert.ToChar(input.Key);
            CenterText($"Set on key to {toggle_on_key}");
            CenterText("Toggle off key");
            var offinput = Console.ReadKey(true);
            toggle_off_key = Convert.ToChar(offinput.Key);
            CenterText($"Set off key to {toggle_off_key}");

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
            Console.ReadLine();
        }
        static string FC(string t)
        {
            Console.WriteLine(t);
            return t;
        }
        static string CenterText(string CText)
        {
            Console.WriteLine("                                                 " + CText);
            return CText;
        }
    }
}
