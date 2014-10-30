#NoEnv
#NoTrayIcon
; #Warn
#SingleInstance Off

if !A_IsAdmin && !%False%
{
    if A_OSVersion not in WIN_2003,WIN_XP,WIN_2000
    {
        Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%",, UseErrorLevel
        if !ErrorLevel
            ExitApp
    }
    MsgBox 0x31, AutoHotkey Setup,
    (LTrim Join`s
    Setup is running as a limited user.  If you continue, some problems
    are likely to occur.  It is strongly recommended that you run Setup
    as an administrator.`n
    `n
    To continue anyway, click OK.  Otherwise click Cancel.
    )
    IfMsgBox Cancel
        ExitApp
}

SourceDir := A_ScriptDir
SilentMode := false
SilentErrors := 0

if 0 > 0
if 1 = /kill ; For internal use.
{
    DetectHiddenWindows On
    WinKill % "ahk_id " %0%
    ExitApp
}
else if 1 = /fin ; For internal use.
{
    DetectHiddenWindows On
    WinKill % "ahk_id " %0%
    WinWaitClose % "ahk_id " %0%,, 1
    
    exefile = %2%
    InstallFile(exefile, "AutoHotkey.exe")
    if 3 = 0 ; SilentMode
        MsgBox 64, AutoHotkey Setup, The settings have been updated.
    ExitApp
}
else if 1 = /runahk ; For internal use.
{
    RunAutoHotkey_()
    ExitApp
}

ProductName := "AutoHotkey"
ProductVersion := A_AhkVersion
ProductPublisher := "Lexikos"
ProductWebsite := "http://www.autohotkey.com/"

EnvGet ProgramW6432, ProgramW6432
DefaultPath := (ProgramW6432 ? ProgramW6432 : A_ProgramFiles) "\AutoHotkey"
DefaultType := A_Is64bitOS ? "x64" : "Unicode"
DefaultStartMenu := "AutoHotkey"
DefaultCompiler := true
DefaultDragDrop := true
DefaultToUTF8 := false
DefaultIsHostApp := false
AutoHotkeyKey := "SOFTWARE\AutoHotkey"
UninstallKey := "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\AutoHotkey"
FileTypeKey := "AutoHotkeyScript"

DetermineVersion()

Loop %0%
    if %A_Index% = /S
        SilentMode := true
    else if %A_Index% = /U32
        DefaultType = Unicode
    else if %A_Index% in /U64,/x64
        DefaultType = x64
    else if %A_Index% in /A32,/ANSI
        DefaultType = ANSI
    else if InStr(%A_Index%, "/D=") = 1 {
        if !RegExMatch(DllCall("GetCommandLine", "str"), "(?<!"")/D=\K[^""]*?(?=$|[ `t]+/)", DefaultPath)
            DefaultPath := SubStr(%A_Index%, 4)
        Loop %DefaultPath%, 2  ; Resolve relative path.
            DefaultPath := A_LoopFileLongPath
        SlashD := true
    }
    else if (%A_Index% = "/?") {
        ViewHelp("/docs/Scripts.htm#install")
        ExitApp
    }
    else if (%A_Index% = "/Uninstall") {
        SilentMode := true
        Uninstall()
        ExitApp
    }
    else if (%A_Index% = "/E") {
        Extract(SlashD ? DefaultPath : "")
        ExitApp
    }
    else if (SubStr(%A_Index%,1,5) = "/Test") {
        TestMode := SubStr(%A_Index%,6)
    }

if SilentMode {
    QuickInstall()
    ExitApp % SilentErrors
}

if WinExist("AutoHotkey Setup ahk_class AutoHotkeyGUI") {
    MsgBox 0x30, AutoHotkey Setup, AutoHotkey Setup is already running!
    WinActivate
    ExitApp
}

OnExit GuiClose
Gui Margin, 0, 0
Gui Add, ActiveX, vwb w600 h400 hwndhwb, Shell.Explorer
ComObjConnect(wb, "wb_")
OnMessage(0x100, "gui_KeyDown", 2)
try {
    if !wb
        throw Exception("Failed to create IE control")
    if (TestMode = "FailUI")
        throw Exception("Testing UI")
    InitUI()
}
catch excpt {
    excpt := excpt.Message
    if (A_ScriptDir = DefaultPath) {
        MsgBox 0x10, AutoHotkey Setup, Setup failed to initialize its user interface and will now exit.
        ExitApp
    }
    type := DefaultType="ANSI" ? "ANSI 32-bit" : "Unicode " (DefaultType="x64"?"64":"32") "-bit"
    MsgBox 0x13, AutoHotkey Setup,
(
Setup failed to initialize its user interface.
  Error: %excpt%

Do you want to install with default options?
  %ProductName% v%ProductVersion% (%type%)
  %DefaultPath%

Click Yes to install.
Click No to copy setup files to a directory of your choosing.
Click Cancel to exit.
)
    IfMsgBox Yes
        QuickInstall()
    else IfMsgBox No
        Extract()
    ExitApp
}
Gui Show,, AutoHotkey Setup
return

GuiEscape:
MsgBox 0x34, AutoHotkey Setup, Are you sure you want to exit setup?
IfMsgBox No
    return
GuiClose:
Gui Destroy
OnExit
ExitApp

DetermineVersion() {
    global
    local url, v
    ; This first section has two purposes:
    ;  1) Determine the location of any current installation.
    ;  2) Determine which view of the registry it was installed into
    ;     (only applicable if the OS is 64-bit).
    CurrentRegView := ""
    Loop % (A_Is64bitOS ? 2 : 1) {
        SetRegView % 32*A_Index
        RegRead CurrentPath, HKLM, %AutoHotkeyKey%, InstallDir
        if !ErrorLevel {
            CurrentRegView := A_RegView
            break
        }
    }
    if ErrorLevel {
        CurrentName := ""
        CurrentVersion := ""
        CurrentType := ""
        CurrentPath := ""
        CurrentStartMenu := ""
        return
    }
    RegRead CurrentVersion, HKLM, %AutoHotkeyKey%, Version
    RegRead CurrentStartMenu, HKLM, %AutoHotkeyKey%, StartMenuFolder
    RegRead url, HKLM, %UninstallKey%, URLInfoAbout
    ; Identify by URL since uninstaller display name is the same:
    if (url = "http://www.autohotkey.net/~Lexikos/AutoHotkey_L/"
        || url = "http://l.autohotkey.net/")
        CurrentName := "AutoHotkey_L"
    else
        CurrentName := "AutoHotkey"
    ; Identify which build is installed/set as default:
    FileAppend ExitApp `% (A_IsUnicode=1) << 8 | (A_PtrSize=8) << 9, %A_Temp%\VersionTest.ahk
    RunWait %CurrentPath%\AutoHotkey.exe "%A_Temp%\VersionTest.ahk",, UseErrorLevel
    if ErrorLevel = 0x300
        CurrentType := "x64"
    else if ErrorLevel = 0x100
        CurrentType := "Unicode"
    else if ErrorLevel = 0
        CurrentType := "ANSI"
    else
        CurrentType := ""
    FileDelete %A_Temp%\VersionTest.ahk
    ; Set some default parameter based on current installation:
    if CurrentType
        DefaultType := CurrentType
    DefaultPath := CurrentPath
    DefaultStartMenu := CurrentStartMenu
    DefaultCompiler := FileExist(CurrentPath "\Compiler\Ahk2Exe.exe") != ""
    RegRead v, HKCR, %FileTypeKey%\ShellEx\DropHandler
    DefaultDragDrop := ErrorLevel = 0
    RegRead v, HKCR, Applications\AutoHotkey.exe, IsHostApp
    DefaultIsHostApp := !ErrorLevel
    RegRead v, HKCR, %FileTypeKey%\Shell\Open\Command
    DefaultToUTF8 := InStr(v, " /CP65001 ") != 0
}

InitUI() {
    local w
    SetWBClientSite()    gosub DefineUI
    wb.Silent := true
    wb.Navigate("about:blank")
    while wb.ReadyState != 4
        Sleep 10
    wb.Document.open()
    wb.Document.write(html)
    wb.Document.Close()    w := wb.Document.parentWindow
    if (!CurrentType && A_ScriptDir != DefaultPath)
        CurrentName := ""  ; Avoid showing the Reinstall option since we don't know which version it was.
    w.initOptions(CurrentName, CurrentVersion, CurrentType
                , ProductVersion, DefaultPath, DefaultStartMenu
                , DefaultType, A_Is64bitOS = 1)
    if (A_ScriptDir = DefaultPath) {
        w.installdir.disabled := true
        w.installdir_browse.disabled := true
        w.installcompiler.disabled := !DefaultCompiler
        w.installcompilernote.style.display := "block"
        w.ci_nav_install.innerText := "apply"
        w.install_button.innerText := "Apply"
        w.extract.style.display := "None"
        w.opt1.disabled := true
        w.opt1.firstChild.innerText := "Checking for updates..."
        SetTimer CheckForUpdates, -500
    }
    w.installcompiler.checked := DefaultCompiler
    w.enabledragdrop.checked := DefaultDragDrop
    w.separatebuttons.checked := DefaultIsHostApp
    ; w.defaulttoutf8.checked := DefaultToUTF8
    if !A_Is64bitOS
        w.it_x64.style.display := "None"
    if A_OSVersion in WIN_2000,WIN_2003,WIN_XP ; i.e. not WIN_7, WIN_8 or a future OS.
        w.separatebuttons.parentNode.style.display := "none"
    w.switchPage("start")
    w.document.body.focus()
    ; Scale UI by screen DPI.  My testing showed that Vista with IE7 or IE9
    ; did not scale by default, but Win8.1 with IE10 did.  The scaling being
    ; done by the control itself = deviceDPI / logicalDPI.
    logicalDPI := w.screen.logicalXDPI, deviceDPI := w.screen.deviceXDPI
    if (A_ScreenDPI != 96)
        w.document.body.style.zoom := A_ScreenDPI/96 * (logicalDPI/deviceDPI)
}

CheckForUpdates:
CheckForUpdates()
return
CheckForUpdates() {
    local w := getWindow(), latestVersion := ""
    URLDownloadToFile http://l.autohotkey.net/version.txt, %A_Temp%\ahk_version.txt
    if !ErrorLevel {
        FileRead latestVersion, %A_Temp%\ahk_version.txt
        FileDelete %A_Temp%\ahk_version.txt
    }
    if RegExMatch(latestVersion, "^(\d+\.){3}\d+") {
        if (latestVersion = ProductVersion)
            w.opt1.firstChild.innerText := "Reinstall (download required)"
        else
            w.opt1.firstChild.innerText := "Download v" latestVersion
        w.opt1.href := "ahk://Download/"
        w.opt1.disabled := false
    } else
        w.opt1.innerText := "An error occurred while checking for updates."
}

/*  Fix keyboard shortcuts in WebBrowser control.
 *  References:
 *    http://www.autohotkey.com/community/viewtopic.php?p=186254#p186254
 *    http://msdn.microsoft.com/en-us/library/ms693360
 */

gui_KeyDown(wParam, lParam, nMsg, hWnd) {
    global wb
    pipa := ComObjQuery(wb, "{00000117-0000-0000-C000-000000000046}")
    VarSetCapacity(kMsg, 48), NumPut(A_GuiY, NumPut(A_GuiX
    , NumPut(A_EventInfo, NumPut(lParam, NumPut(wParam
    , NumPut(nMsg, NumPut(hWnd, kMsg)))), "uint"), "int"), "int")
    Loop 2
    r := DllCall(NumGet(NumGet(1*pipa)+5*A_PtrSize), "ptr", pipa, "ptr", &kMsg)
    ; Loop to work around an odd tabbing issue (it's as if there
    ; is a non-existent element at the end of the tab order).
    until wParam != 9 || wb.Document.activeElement != ""
    ObjRelease(pipa)
    if r = 0 ; S_OK: the message was translated to an accelerator.
        return 0
}


/*  ahk://Func/Param  -->  Func("Param")
 */

wb_BeforeNavigate2(wb, url, flags, frame, postdata, headers, cancel) {
    if !RegExMatch(url, "^ahk://(.*?)/(.*)", m)
        return
    static func, prms
    func := m1
    prms := []
    StringReplace m2, m2, `%20, %A_Space%, All
    Loop Parse, m2, `,
        prms.Insert(A_LoopField)
    ; Cancel: don't load the error page (or execute ahk://whatever
    ; if it happens to somehow be a registered protocol).
    NumPut(-1, ComObjValue(cancel), "short")
    ; Call after a delay to allow navigation (this might only be
    ; necessary if called from NavigateError; i.e. on Windows 8).
    SetTimer wb_bn2_call, -15
    return
wb_bn2_call:
    %func%(prms*)
    func := prms := ""
    return
}

wb_NavigateError(wb, url, frame, status, cancel) {
    ; This might only be called on Windows 8, which skips the
    ; BeforeNavigate2 call (because the protocol is invalid?).
    wb_BeforeNavigate2(wb, url, 0, frame, "", "", cancel)
}


/*  Complex workaround to override "Active scripting" setting
 *  and ensure scripts can run within the WebBrowser control.
 */

global WBClientSite

SetWBClientSite()
{
    interfaces := {
    (Join,
        IOleClientSite: [0,3,1,0,1,0]
        IServiceProvider: [3]
        IInternetSecurityManager: [1,1,3,4,8,7,3,3]
    )}
    unkQI      := RegisterCallback("WBClientSite_QI", "Fast")
    unkAddRef  := RegisterCallback("WBClientSite_AddRef", "Fast")
    unkRelease := RegisterCallback("WBClientSite_Release", "Fast")
    WBClientSite := {_buffers: bufs := {}}, bufn := 0, 
    for name, prms in interfaces
    {
        bufn += 1
        bufs.SetCapacity(bufn, (4 + prms.MaxIndex()) * A_PtrSize)
        buf := bufs.GetAddress(bufn)
        NumPut(unkQI,       buf + 1*A_PtrSize)
        NumPut(unkAddRef,   buf + 2*A_PtrSize)
        NumPut(unkRelease,  buf + 3*A_PtrSize)
        for i, prmc in prms
            NumPut(RegisterCallback("WBClientSite_" name, "Fast", prmc+1, i), buf + (3+i)*A_PtrSize)
        NumPut(buf + A_PtrSize, buf + 0)
        WBClientSite[name] := buf
    }
    global wb
    if pOleObject := ComObjQuery(wb, "{00000112-0000-0000-C000-000000000046}")
    {   ; IOleObject::SetClientSite
        DllCall(NumGet(NumGet(pOleObject+0)+3*A_PtrSize), "ptr"
            , pOleObject, "ptr", WBClientSite.IOleClientSite, "uint")
        ObjRelease(pOleObject)
    }
}

WBClientSite_QI(p, piid, ppvObject)
{
    static IID_IUnknown := "{00000000-0000-0000-C000-000000000046}"
    static IID_IOleClientSite := "{00000118-0000-0000-C000-000000000046}"
    static IID_IServiceProvider := "{6d5140c1-7436-11ce-8034-00aa006009fa}"
    iid := _String4GUID(piid)
    if (iid = IID_IOleClientSite || iid = IID_IUnknown)
    {
        NumPut(WBClientSite.IOleClientSite, ppvObject+0)
        return 0 ; S_OK
    }
    if (iid = IID_IServiceProvider)
    {
        NumPut(WBClientSite.IServiceProvider, ppvObject+0)
        return 0 ; S_OK
    }
    NumPut(0, ppvObject+0)
    return 0x80004002 ; E_NOINTERFACE
}

WBClientSite_AddRef(p)
{
    return 1
}

WBClientSite_Release(p)
{
    return 1
}

WBClientSite_IOleClientSite(p, p1="", p2="", p3="")
{
    if (A_EventInfo = 3) ; GetContainer
    {
        NumPut(0, p1+0) ; *ppContainer := NULL
        return 0x80004002 ; E_NOINTERFACE
    }
    return 0x80004001 ; E_NOTIMPL
}

WBClientSite_IServiceProvider(p, pguidService, piid, ppvObject)
{
    static IID_IUnknown := "{00000000-0000-0000-C000-000000000046}"
    static IID_IInternetSecurityManager := "{79eac9ee-baf9-11ce-8c82-00aa004ba90b}"
    if (_String4GUID(pguidService) = IID_IInternetSecurityManager)
    {
        iid := _String4GUID(piid)
        if (iid = IID_IInternetSecurityManager || iid = IID_IUnknown)
        {
            NumPut(WBClientSite.IInternetSecurityManager, ppvObject+0)
            return 0 ; S_OK
        }
        NumPut(0, ppvObject+0)
        return 0x80004002 ; E_NOINTERFACE
    }
    NumPut(0, ppvObject+0)
    return 0x80004001 ; E_NOTIMPL
}

WBClientSite_IInternetSecurityManager(p, p1="", p2="", p3="", p4="", p5="", p6="", p7="", p8="")
{
    if (A_EventInfo = 5) ; ProcessUrlAction
    {
        if (p2 = 0x1400) ; dwAction = URLACTION_SCRIPT_RUN
        {
            NumPut(0, p3+0)  ; *pPolicy := URLPOLICY_ALLOW
            return 0 ; S_OK
        }
    }
    return 0x800C0011 ; INET_E_DEFAULT_ACTION
}

_String4GUID(pGUID)
{
	VarSetCapacity(String,38*2)
	DllCall("ole32\StringFromGUID2", "ptr", pGUID, "str", String, "int", 39)
	Return	String
}


/*  Utility Functions
 */

getWindow() {
    global wb
    return wb.document.parentWindow
}

ErrorExit(errMsg) {
    global
    if SilentMode
        ExitApp 1
    MsgBox 16, AutoHotkey Setup, %errMsg%
    Exit
}

CloseScriptsEtc(installdir, actionToContinue) {
    titles := ""
    DetectHiddenWindows On
    close := []
    WinGet w, List, ahk_class AutoHotkey
    Loop % w {
        ; Exclude the install script.
        if (w%A_Index% = A_ScriptHwnd)
            continue
        ; Determine if the script actually needs to be terminated.
        WinGet exe, ProcessPath, % "ahk_id " w%A_Index%
        if (exe != "") {
            ; Exclude external executables.
            if InStr(exe, installdir "\") != 1
                continue
            ; The main purpose of this next check is to avoid closing
            ; SciTE4AutoHotkey's toolbar, but also may be helpful for
            ; other situations.
            exe := SubStr(exe, StrLen(installdir) + 2)
            if !RegExMatch(exe, "i)^(AutoHotkey(A32|U32|U64)?\.exe|Compiler\\Ahk2Exe.exe)$")
                continue
        }        
        ; Append script path to the list.
        WinGetTitle title, % "ahk_id " w%A_Index%
        title := RegExReplace(title, " - AutoHotkey v.*")
        titles .= "  -  " title "`n"
        close.Insert(w%A_Index%)
    }
    if (titles != "") {
        global SilentMode
        if !SilentMode {
            MsgBox 49, AutoHotkey Setup,
            (LTrim
            Setup needs to close the following script(s):
            `n%titles%
            Click OK to close these scripts and continue the %actionToContinue%.
            )
            IfMsgBox Cancel
                Exit
        }
        ; Close script windows (typically causing them to exit).
        Loop % close.MaxIndex()
        {
            WinClose % "ahk_id " close[A_Index]
            WinWaitClose % "ahk_id " close[A_Index],, 1
        }
    }
    ; Close all help file and Window Spy windows automatically:
    GroupAdd autoclosegroup, AutoHotkey_L Help ahk_class HH Parent
    GroupAdd autoclosegroup, AutoHotkey Help ahk_class HH Parent
    GroupAdd autoclosegroup, Active Window Info ahk_exe %installdir%\AU3_Spy.exe
    ; Also close the old Ahk2Exe (but the new one is a script, so it
    ; was already handled by the section above):
    GroupAdd autoclosegroup, Ahk2Exe v ahk_exe %installdir%\Compiler\Ahk2Exe.exe
    WinClose ahk_group autoclosegroup
}

GetErrorMessage(error_code="") {
    VarSetCapacity(buf, 1024) ; Probably won't exceed 1024 chars.
    if DllCall("FormatMessage", "uint", 0x1200, "ptr", 0, "int", error_code!=""
                ? error_code : A_LastError, "uint", 1024, "str", buf, "uint", 1024, "ptr", 0)
        return buf
}

switchPage(page) {
    global
    if !SilentMode
        getWindow().switchPage(page)
}

UpdateStatus(status) {
    ; if !SilentMode
        ; getWindow().install_status.innerText := status
}

ShellRun(prms*)
{
    shellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")
    
    desktop := shellWindows.Item(ComObj(19, 8)) ; VT_UI4, SCW_DESKTOP                
   
    ; Retrieve top-level browser object.
    if ptlb := ComObjQuery(desktop
        , "{4C96BE40-915C-11CF-99D3-00AA004AE837}"  ; SID_STopLevelBrowser
        , "{000214E2-0000-0000-C000-000000000046}") ; IID_IShellBrowser
    {
        ; IShellBrowser.QueryActiveShellView -> IShellView
        if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv:=0) = 0
        {
            ; Define IID_IDispatch.
            VarSetCapacity(IID_IDispatch, 16)
            NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")
           
            ; IShellView.GetItemObject -> IDispatch (object which implements IShellFolderViewDual)
            DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
                , "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp:=0)
           
            ; Get Shell object.
            shell := ComObj(9,pdisp,1).Application
           
            ; IShellDispatch2.ShellExecute
            shell.ShellExecute(prms*)
           
            ObjRelease(psv)
        }
        ObjRelease(ptlb)
    }
}

Run_(target, args="") {
    try
        ShellRun(target, args)
    catch e
        Run % args="" ? target : target " " args
}


/*  Utility Functions invoked by the UI
 */

Customize() {
    getWindow().switchPage("custom-install")
}

SelectFolder(id, prompt="", root="::{20d04fe0-3aea-1069-a2d8-08002b30309d}") {
    global wb
    if !(field := wb.document.getElementById(id))
        return
    Gui +OwnDialogs
    FileSelectFolder path
        , % root " *" field.value
        ,, % prompt
    if !ErrorLevel
        field.value := path
}

ReadLicense() {
    Run_(A_ScriptDir "\license.txt")
}

ViewHelp(topic) {
    local path
    if FileExist("AutoHotkey.chm")
        path := A_WorkingDir "\AutoHotkey.chm"
    else
        path := CurrentPath "\AutoHotkey.chm"
    if FileExist(path)
        Run_("hh.exe", "mk:@MSITStore:" path "::" topic)
    else
        Run_("http://l.autohotkey.net" topic)
}

RunAutoHotkey() {
    ; Setup may be running as a user other than the one that's logged
    ; in (i.e. an admin user), so in addition to running AutoHotkey.exe
    ; in user mode, have it call the function below to ensure the script
    ; file is correctly located.
    Run_("AutoHotkey.exe", """" A_WorkingDir "\Installer.ahk"" /runahk")
}
RunAutoHotkey_() {
    ; This could detect %ExeDir%\AutoHotkey.ahk (which takes precedence
    ; over %A_MyDocuments%\AutoHotkey.ahk), but that file is unlikely to
    ; exist in this situation.
    script_path := A_MyDocuments "\AutoHotkey.ahk"
    ; Start the script.
    Run AutoHotkey.exe,,, pid
    ; Check for common failures.
    SetTitleMatchMode 2
    DetectHiddenWindows On
    message := ""
    message_flags := 0x34
    Loop {
        Sleep 50
        Process Exist, %pid%
        if !ErrorLevel {
            message =
            (LTrim Join`s
            AutoHotkey has exited.  You may need to edit your startup
            script.  For instance, if it exited because it had nothing
            to do, you can add a hotkey.
            )
            message_flags := 0x44 ; Less severe, since it might be intentional.
            break
        }
        if WinExist("ahk_class #32770 ahk_pid " pid) {
            WinGetText message
            if !InStr(message, "Error")
                return
            WinWaitClose
            Process Exist, %pid%
            message := "Your script encountered an error" (ErrorLevel ? "." : " and exited.")
                   . "  You will need to edit it to resolve this error."
            break
        }
        if WinExist("ahk_class AutoHotkey ahk_pid " pid) {
            WinWaitClose,,, .2 ; Wait a moment in case the script is empty/about to exit.
            if !ErrorLevel
                continue ; Back to the top of the loop.
            DetectHiddenWindows Off
            if !WinExist("ahk_pid " pid)
                MsgBox 0x40, AutoHotkey Setup, Your script is running in the background.
            return
        }
    }
    MsgBox % message_flags, AutoHotkey Setup, %message%`n`nYour script is located here:`n   %script_path%`n`nDo you want to edit this file?
    IfMsgBox Yes
        Run edit "%script_path%"
}

Quit() {
    ExitApp
}

Extract(dstDir="") {
    if (dstDir = "") {
        FileSelectFolder dstDir,,, Select a folder to copy program files to.
        if ErrorLevel
            return
    }
    try {
        global TestMode, SourceDir
        if (TestMode = "FailExtract")
            throw
        shell := ComObjCreate("Shell.Application")
        try FileCreateDir %dstDir%
        dst := shell.NameSpace(dstDir)
        src := shell.NameSpace(SourceDir)
        if !(dst && src)
            throw
        try dst.CopyHere(src.Items, 256)
    }
    catch {
        FileCopyDir %SourceDir%, %dstDir%, 1
        if ErrorLevel {
            MsgBox 48, AutoHotkey Setup, An unspecified error occurred.
            return
        }
    }
    Run %dstDir%
}

Download() {
    Run http://l.autohotkey.net/AutoHotkey_L_Install.exe
    ExitApp
}


/*  Setup Actions
 */

; Upgrade to newer version or from AutoHotkey to AutoHotkey_L.
;   Type: "ANSI" or "Unicode"
Upgrade(Type="") {
    global
    _Install({
    (Join C
        type: Type,
        path: DefaultPath,
        menu: DefaultStartMenu,
        ahk2exe: DefaultCompiler,
        dragdrop: DefaultDragDrop,
        utf8: DefaultToUTF8,
        isHostApp: DefaultIsHostApp
    )})
}

; Quick install with default options.
QuickInstall() {
    global
    _Install({
    (Join
        type: DefaultType,
        path: DefaultPath,
        menu: DefaultStartMenu,
        ahk2exe: DefaultCompiler,
        dragdrop: DefaultDragDrop,
        utf8: DefaultToUTF8,
        isHostApp: DefaultIsHostApp
    )})
}

; Begin installation after reviewing options.
CustomInstall() {
    local w := getWindow()
    _Install({
    (C Join
        type: w.installtype.value,
        path: w.installdir.value,
        menu: w.startmenu.value,
        ahk2exe: w.installcompiler.checked,
        dragdrop: w.enabledragdrop.checked,
        utf8: DefaultToUTF8, ;w.defaulttoutf8.checked
        isHostApp: w.separatebuttons.checked
    )})
}

; Uninstall.
Uninstall() {
    global
    
    try
        SetWorkingDir % CurrentPath
    catch
        ErrorExit("Error uninstalling; installation directory '" CurrentPath "' may be invalid.")
    
    CloseScriptsEtc(CurrentPath, "uninstallation")
    
    switchPage("wait")
    
    /*  Registry
     */
    
    SetRegView % CurrentRegView
    
    RegDelete HKLM, %UninstallKey%
    RegDelete HKLM, %AutoHotkeyKey%
    RegDelete HKCU, %AutoHotkeyKey%  ; Created by Ahk2Exe.
    
    RegDelete HKCR, .ahk
    RegDelete HKCR, %FileTypeKey%
    RegDelete HKCR, Applications\AutoHotkey.exe
    
    RegDelete HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\AutoHotkey.exe
    
    /*  Files
     */
    
    FileDelete AutoHotkeyU32.exe
    FileDelete AutoHotkeyA32.exe
    FileDelete AutoHotkeyU64.exe
    
    FileDelete AU3_Spy.exe
    FileDelete AutoHotkey.chm
    FileDelete license.txt
    
    ; This file would only exist if an older version of AutoHotkey_L
    ; installed it:
    FileDelete Update.ahk
    
    ; Although the old installer was designed not to overwrite this in
    ; case the user made customizations, the old uninstaller deletes it:
    FileDelete %A_WinDir%\ShellNew\Template.ahk
    
    RemoveCompiler()
    
    FileDelete %ProductName% Website.url
    if (CurrentStartMenu != "")  ; Must not remove A_ProgramsCommon itself!
        FileRemoveDir %A_ProgramsCommon%\%CurrentStartMenu%, 1
    
    if !SilentMode
        MsgBox 64, AutoHotkey Setup
            , Setup will now close to complete the uninstallation.
    
    ; Try deleting it normally first, in case this script is running
    ; on an external exe (such as via a downloaded installer).
    FileDelete AutoHotkey.exe
    if !ErrorLevel {
        FileDelete Installer.ahk
        SetWorkingDir %A_Temp%  ; Otherwise FileRemoveDir will fail.
        FileRemoveDir %CurrentPath%  ; Only if empty.
        ExitApp
    }
    
    Gui Cancel
    
    ; Use cmd.exe to work around the fact that AutoHotkey.exe is locked
    ; while it is still running.  Having a second instance of the script
    ; terminate this instance should be more reliable than performing
    ; an arbitrary wait (e.g. by calling "ping").
    Run %ComSpec% /c "
    (Join`s&`s
    AutoHotkey.exe "%A_ScriptFullPath%" /kill %A_ScriptHwnd%
    del Installer.ahk
    del AutoHotkey.exe
    cd %A_Temp%
    rmdir "%CurrentPath%"
    )",, Hide
}


/*  Installation
 */

_Install(opt) {
    global
    
    /*  Validation
     */
    
    local exefile, binfile
    if opt.type = "Unicode" {
        exefile := "AutoHotkeyU32.exe"
        binfile := "Unicode 32-bit.bin"
    } else if opt.type = "x64" && A_Is64bitOS {
        exefile := "AutoHotkeyU64.exe"
        binfile := "Unicode 64-bit.bin"
    } else if opt.type = "ANSI" {
        exefile := "AutoHotkeyA32.exe"
        binfile := "ANSI 32-bit.bin"
    } else
        ErrorExit("Invalid installation type '" opt.type "'")
    
    if !InStr(FileExist(opt.path), "D")
        try
            FileCreateDir % opt.path
        catch
            ErrorExit("Unable to create installation directory ('" opt.path "')")
    
    CloseScriptsEtc(CurrentPath, "installation")
    
    /*  Preparation
     */
    
    SetWorkingDir % opt.path
    
    switchPage("wait")
    
    ; Remove old files which are no longer relevant.
    if (CurrentName = "AutoHotkey") {
        FileDelete Compiler\README.txt
        FileDelete Compiler\upx.exe
    }
    FileDelete uninst.exe
    
    if A_Is64bitOS {
        ; For xx-bit installs, write to the xx-bit view of the registry.
        local regView := (opt.type = "x64") ? 64 : 32
        if (CurrentRegView && CurrentRegView != regView) {
            ; Clean up old keys in the other registry view.
            SetRegView % CurrentRegView
            RegDelete HKLM, %UninstallKey%
            RegDelete HKLM, %AutoHotkeyKey%
            RegDelete HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\AutoHotkey.exe
            RegDelete HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Ahk2Exe.exe
        }
        SetRegView % regView
    }
    
    /*  Install Files
     */
    
    UpdateStatus("Copying files")
    
    ; If the following is "true", we have no source files to install,
    ; but we may have settings to change.  This includes replacing the
    ; binary files with %exefile% and %binfile%.
    installInPlace := (A_WorkingDir = A_ScriptDir)
    
    ; Install all unique files.
    if !installInPlace {
        InstallMainFiles()
        if opt.ahk2exe
            InstallCompilerFiles()
    }
    
    ; If the user deselected Ahk2Exe and it was previously installed,
    ; ensure it is removed.
    if !opt.ahk2exe
        RemoveCompiler()
    
    ; Create the "default" binaries, corresponding to whichever version
    ; the user selected.
    if !installInPlace
        InstallFile(exefile, "AutoHotkey.exe")
    ;else: a workaround is needed later.
    if opt.ahk2exe
        InstallFile("Compiler\" binfile, "Compiler\AutoHotkeySC.bin")
    
    /*  Start Menu Shortcuts
     */
    
    if CurrentStartMenu
        FileRemoveDir %A_ProgramsCommon%\%CurrentStartMenu%, 1
    
    if opt.menu {
        UpdateStatus("Creating shortcuts")
        local smpath := A_ProgramsCommon "\" opt.menu
        FileCreateDir %smpath%
        FileCreateShortcut %A_WorkingDir%\AutoHotkey.exe, %smpath%\AutoHotkey.lnk
        FileCreateShortcut %A_WorkingDir%\AU3_Spy.exe, %smpath%\AutoIt3 Window Spy.lnk
        FileCreateShortcut %A_WorkingDir%\AutoHotkey.chm, %smpath%\AutoHotkey Help File.lnk
        IniWrite %ProductWebsite%, %ProductName% Website.url, InternetShortcut, URL
        FileCreateShortcut %A_WorkingDir%\%ProductName% Website.url, %smpath%\Website.lnk
        FileCreateShortcut %A_WorkingDir%\Installer.ahk, %smpath%\AutoHotkey Setup.lnk
            ,,,, %A_WinDir%\System32\appwiz.cpl,, -1499
        if opt.ahk2exe
            FileCreateShortcut %A_WorkingDir%\Compiler\Ahk2Exe.exe
                , %smpath%\Convert .ahk to .exe.lnk
    }
    
    /*  Registry
     */
    
    UpdateStatus("Configuring registry")
    
    RegWrite REG_SZ, HKLM, %AutoHotkeyKey%, InstallDir, %A_WorkingDir%
    RegWrite REG_SZ, HKLM, %AutoHotkeyKey%, Version, %ProductVersion%
    if opt.menu
        RegWrite REG_SZ, HKLM, %AutoHotkeyKey%, StartMenuFolder, % opt.menu
    else
        RegDelete HKLM, %AutoHotkeyKey%, StartMenuFolder
    
    ; Might need to get rid of this to allow the ShellNew template to work:
    RegDelete HKCR, ahk_auto_file
    RegWrite REG_SZ, HKCR, .ahk,, %FileTypeKey%
    RegWrite REG_SZ, HKCR, .ahk\ShellNew, FileName, Template.ahk
    
    RegWrite REG_SZ, HKCR, %FileTypeKey%,, AutoHotkey Script
    RegWrite REG_SZ, HKCR, %FileTypeKey%\DefaultIcon,, %A_WorkingDir%\AutoHotkey.exe`,1
    
    ; Set up system verbs:
    RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Open,, Run Script
    RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Edit,, Edit Script
    if opt.ahk2exe
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Compile,, Compile Script
    
    local value
    
    ; Set default action, but don't overwrite.
    try
        RegRead value, HKCR, %FileTypeKey%\Shell,
    catch   ; Key likely doesn't exist.
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell,, Open
    
    ; Set editor, but don't overwrite.
    try
        RegRead value, HKCR, %FileTypeKey%\Shell\Edit\Command,
    catch
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Edit\Command,, notepad.exe `%1
    
    if opt.ahk2exe
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Compile\Command,, "%A_WorkingDir%\Compiler\Ahk2Exe.exe" /in "`%l"
    
    local cmd
    cmd = "%A_WorkingDir%\AutoHotkey.exe"
    if opt.utf8
        cmd = %cmd% /CP65001
    cmd = %cmd% "`%1" `%*
    RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\Open\Command,, %cmd%
    
    ; If UAC is enabled, add a "Run as administrator" option.
    RegRead value, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System, EnableLUA
    if value
        RegWrite REG_SZ, HKCR, %FileTypeKey%\Shell\RunAs\Command,, "%A_WorkingDir%\AutoHotkey.exe" "`%1" `%*
    
    if opt.dragdrop
        RegWrite REG_SZ, HKCR, %FileTypeKey%\ShellEx\DropHandler,, {86C86720-42A0-1069-A2E8-08002B30309D}
    else
        RegDelete HKCR, %FileTypeKey%\ShellEx
    
    RegWrite REG_SZ, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\AutoHotkey.exe,, %A_WorkingDir%\AutoHotkey.exe
    if opt.ahk2exe
        RegWrite REG_SZ, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Ahk2Exe.exe,, %A_WorkingDir%\Compiler\Ahk2Exe.exe
    
    RegDelete HKCR, Applications\AutoHotkey.exe
    if opt.isHostApp
        RegWrite REG_SZ, HKCR, Applications\AutoHotkey.exe, IsHostApp
    
    ; Write uninstaller info.
    RegWrite REG_SZ, HKLM, %UninstallKey%, DisplayName, %ProductName% %ProductVersion%
    RegWrite REG_SZ, HKLM, %UninstallKey%, UninstallString, "%A_WorkingDir%\AutoHotkey.exe" "%A_WorkingDir%\Installer.ahk"
    RegWrite REG_SZ, HKLM, %UninstallKey%, DisplayIcon, %A_WorkingDir%\AutoHotkey.exe
    RegWrite REG_SZ, HKLM, %UninstallKey%, DisplayVersion, %ProductVersion%
    RegWrite REG_SZ, HKLM, %UninstallKey%, URLInfoAbout, %ProductWebsite%
    RegWrite REG_SZ, HKLM, %UninstallKey%, Publisher, %ProductPublisher%
    RegWrite REG_SZ, HKLM, %UninstallKey%, NoModify, 1
    
    ; Notify other programs (e.g. explorer.exe) that file type associations have changed.
    ; This may be necessary to update the icon when upgrading from an older version of AHK.
    DllCall("shell32\SHChangeNotify", "uint", 0x08000000, "uint", 0, "int", 0, "int", 0) ; SHCNE_ASSOCCHANGED
    
    if installInPlace {
        ; As AutoHotkey.exe is probably in use by this script, the final
        ; step will be completed by another instance of this script:
        Run AutoHotkeyU32.exe "%A_ScriptFullPath%" /fin %exefile% %A_ScriptHwnd% %SilentMode%
        ExitApp
    }
    
    switchPage("done")
}

InstallFile(file, target="") {
    global
    if (target = "")
        target := file
    Loop { ; Retry loop.
        try {
            FileCopy %SourceDir%\%file%, %target%, 1
            ; If successful (no exception thrown):
            return
        }
        if SilentMode {
            SilentErrors += 1
            return  ; Continue anyway.
        }
        local error_message := RTrim(GetErrorMessage(), "`r`n")
        MsgBox 0x12, AutoHotkey Setup,
        (LTrim
        Error installing file "%target%"
        
        Specifically: %error_message%
        
        Click Abort to stop the installation,
        Retry to try again, or
        Ignore to skip this file.
        )
        IfMsgBox Abort
            ExitApp
        IfMsgBox Ignore
            return
    }
}

InstallMainFiles() {
    InstallFile("AutoHotkeyU32.exe")
    InstallFile("AutoHotkeyA32.exe")
    if A_Is64bitOS
        InstallFile("AutoHotkeyU64.exe")
    
    InstallFile("AU3_Spy.exe")
    InstallFile("AutoHotkey.chm")
    InstallFile("license.txt")
    
    InstallFile("Installer.ahk")
    
    if !FileExist(A_WinDir "\ShellNew\Template.ahk") {
        FileCreateDir %A_WinDir%\ShellNew
        InstallFile("Template.ahk", A_WinDir "\ShellNew\Template.ahk")
    }
}

InstallCompilerFiles() {
    FileCreateDir Compiler
    InstallFile("Compiler\Ahk2Exe.exe")
    InstallFile("Compiler\ANSI 32-bit.bin")
    InstallFile("Compiler\Unicode 32-bit.bin")
    ; Install the following file even if !isOS64bit() to support
    ; compiling scripts for 64-bit systems on 32-bit systems:
    InstallFile("Compiler\Unicode 64-bit.bin")
}

RemoveCompiler() {
    global
    FileDelete Compiler\Ahk2Exe.exe
    FileDelete Compiler\ANSI 32-bit.bin
    FileDelete Compiler\Unicode 32-bit.bin
    FileDelete Compiler\Unicode 64-bit.bin
    FileDelete Compiler\AutoHotkeySC.bin
    FileRemoveDir Compiler  ; Only if empty.    
    RegDelete HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Ahk2Exe.exe
}
DefineUI:
html=
(%`
<html><head>
<style type="text/css">
body {
	background-color: ButtonFace;
	font-family: "Arial", sans-serif;
	font-size: 15px;
	overflow: hidden;
	cursor: default;
	padding: 0;
	margin: 0;
}
h1 {
	font-size: 37px;
	font-weight: normal;
	color: #405871;
	background-color: white;
	padding: 15px 25px;
	margin: 0 -15px;
}
p {
	margin-top: 15px;
}
a:link, a:visited {
	color: #0066CC;
}
.options {
	margin: 0 3em 0 2em;
}
.options a {
	display: block;
	padding: 0.8em 1em;
	margin: 0.3em 0;
	position: relative;
	width: 100%;
}
.marker {
	position: absolute;
	right: 10px;
	font-size: 25px;
	top: 50%;
	margin-top: -17px;
}
a.button,
.options a {
	cursor: hand;
	border: 1px solid ButtonShadow;
	background-color: white;
	text-decoration: none;
}
a.button {
	padding: .3em .5em;
}
a.button,
a.button:visited,
.options a,
.options a:visited {
	color: #405871;
}
a.button:hover,
a.button:active,
.options a:hover,
.options a:active {
	background-color: #F8F8FF;
	border-color: #4774B2;
	color: #4774B2;
}
.options a:active {
	left: 3px;
}
.options p {
	font-size: 80%;
	margin: 0.2em 1em;
}
#license, #extract {
	position: absolute;
	bottom: 1em;
	font-size: 80%;
}
#extract {
    right: 1em;
}
.page {
	width: 100%;
	height: 100%;
	padding: 0 15px;
	display: none; /* overridden by script */
	color: ButtonText;
}
.pager .page {
	padding: 15px 0;
}
.nav {
	background-color: #405871;
	color: white;
	margin: 0 -15px;
	padding: 3px 20px;
	height: 24px;
}
.nav a, .nav a:visited {
	color: #ddd;
	text-decoration: none;
	padding: 0;
}
.nav a:hover {
	color: white;
}
.nav .current {
	color: white;
	font-weight: bold;
	cursor: default;
}
.warning {
	display: none;
	background-color: #fee;
	color: #800;
	border: 1px solid #800;
	padding: 0.5em;
	margin: -0.5em 0 1em;
}
.textbox {
	border: 1px solid ButtonShadow;
	padding: 0 0.4em;
	height: 29px;
	line-height: 27px;
	vertical-align: top;
	margin-top: 9px;
}
#installdir, #startmenu {
	width: 70%;
}
#installdir_browse, #startmenu_del {
	height: 28px;
	margin-top: 10px;
}
label {
	padding: 5px;
	display: block;
	width: 90%;
}
label.indent {
	padding-left: 30px;
}
label p {
	font-size: 85%;
	margin: .3em 25px;
	color: #405871;
}
#install_button, #next-button {
	position: absolute;
	bottom: 15px;
	right: 15px;
	width: 5em;
	font-size: 125%;
	text-align: center;
}
#installcompilernote {
	display: none;
	font-weight: bold;
}
</style>
<script type="text/javascript">
function forEach(arr, fn) {
	var i;
	for (i = 0; i < arr.length; ++i)
		fn.apply(arr[i]);
}
function onload() {
	ci_nav_list.length = 0;
	forEach (ci_nav.getElementsByTagName("a"), function() {
		this.tabIndex = 1000;
		if (this.hash != "") {
			var list = this.parentNode == ci_nav_list ? ci_nav_list : null;
			if (list)
				list[list.length++] = this;
			this.onclick = function() {
				if (list) {
					forEach (list.getElementsByTagName("a"), function() {
						this.className = "";
					})
					this.className = "current";
				}
				event.returnValue = switchPage(this.hash.substr(1));
			}
		}
	})
}
function initOptions(curName, curVer, curType, newVer, instDir, smFolder, defType, is64) {
	if (onload) onload(), onload = null;
	var opt;
	var warn;
	var types = {Unicode: "Unicode 32-bit", ANSI: "ANSI 32-bit", x64: "Unicode 64-bit"};
	var curTypeName = types[curType];
	var defTypeName = types[defType];
	curTypeName = curTypeName ? " (" + curTypeName + ")" : "";
	if (curName == "AutoHotkey" && curVer <= "1.0.48.05") {
		start_intro.innerText = curName + " v" + curVer + " is installed. What do you want to do?";
		var uniType = is64 ? "x64" : "Unicode";
		var uniTypeName = types[uniType];
		opt = [
			"ahk://Upgrade/ANSI", "Upgrade to v" + newVer + " (" + types.ANSI + ")", "Recommended for compatibility.",
			"ahk://Upgrade/" + uniType, "Upgrade to v" + newVer + " (" + uniTypeName + ")", "",
			"ahk://Customize/", "Custom Installation", ""
		];
		warn = '<strong>Note:</strong> Some AutoHotkey 1.0 scripts are <a href="ahk://ViewHelp//docs/Compat.htm">not compatible</a> with AutoHotkey 1.1.';
	} else if (curName == "") {
		start_intro.innerText = "Please select the type of installation you wish to perform.";
		opt = [
			"ahk://QuickInstall/", "Express Installation", "Default version: " + defTypeName + "<br>Install in: " + instDir,
			"ahk://Customize/", "Custom Installation", ""
		];
	} else if (curVer != newVer) {
		start_intro.innerText = curName + " v" + curVer + curTypeName + " is installed. What do you want to do?";
		opt = [
			"ahk://Upgrade/" + defType, (curVer < newVer ? "Upgrade" : "Downgrade") + " to v" + newVer + " (" + defTypeName + ")", "",
			"ahk://Customize/", "Custom Installation", ""
		];
	} else {
		start_intro.innerText = curName + " v" + curVer + curTypeName + " is installed. What do you want to do?";
		opt = [
			"ahk://QuickInstall/", "Repair", "",
			"ahk://Customize/", "Modify", "",
			"ahk://Uninstall/", "Uninstall", ""
		];
	}
	var i, html = [];
	for (i = 0; i < opt.length; i += 3) {
		html.push('<a href="', opt[i], '" id="opt', Math.floor(i/3)+1, '"><span>', opt[i+1], '</span>');
		if (opt[i+2])
			html.push('<p>', opt[i+2], '</p>');
		if (opt[i] == 'ahk://Customize/')
			html.push('<div class="marker">\u00BB</div>');
		html.push('</a>');
	}
	start_options.innerHTML = html.join("");
	start_warning.innerHTML = warn;
	start_warning.style.display = warn ? "block" : "none";
	start_nav.innerHTML = '<em style="text-align:right;width:100%">version ' + newVer + '</em>';
	installtype.value = defType;
	installdir.value = instDir;
	startmenu.value = smFolder;
	startmenu.onblur();
	forEach (document.getElementsByTagName("a"), function() {
		if (/*this.className == "button" ||*/ this.parentNode.className == "options")
			this.hideFocus = true;
	})
}
document.onselectstart =
document.oncontextmenu =
document.ondragstart =
	function() {
		return window.event && event.srcElement.tagName == "INPUT" || false;
	};
function setInstallType(type) {
	installtype.value = type;
	ci_nav_list[1].click();
	event.returnValue = false;
}
function switchPage(page) {
	page = document.getElementById(page);
	if (page.id == "start")
		ci_nav_list[0].click();
	for (var n = page.parentNode.firstChild; n; n = n.nextSibling) if (n.className == "page") {
		if (n != page)
			n.style.display = "none";
		else
			n.style.display = "block";
	}
	var f;
	switch (page.id) {
	case "custom-install":
	case "ci_version":  f = "it_" + installtype.value; break;
	case "ci_location": f = "next-button"; break;
	case "ci_options":  f = "install_button"; break;
	case "done":        f = "done_exit"; break;
	}
	if (f) {
		// If page == ci_version, it mightn't actually be visible at this point,
		// which causes IE7 (and perhaps older) to throw error 0x80020101.
		try { document.getElementById(f).focus() } catch (ex) { }
	}
	return false;
}
function beforeCustomInstall() {
	if (startmenu.style.color == '#888')
		startmenu.value = '';
}</script>
</head><body>

<div class="page" id="start">
	<h1>AutoHotkey Setup</h1>
	<div class="nav" id="start_nav">&nbsp;</div>
	<p id="start_intro"></p>
	<div class="warning" id="start_warning"></div>
	<div class="options" id="start_options"></div>
	<div id="license">AutoHotkey is open source software: <a href="ahk://ReadLicense/">read license</a></div>
  <div id="extract"><a href="ahk://Extract/" title="Save program files without installing.">extract to...</a></div>
</div>

<div class="page" id="custom-install">
	<h1>AutoHotkey Setup</h1>
	<div class="nav" id="ci_nav">
		<a href="#start">start</a> &#187;
		<span id="ci_nav_list">
			<a href="#ci_version">version</a> &#187;
			<a href="#ci_location">location</a> &#187;
			<a href="#ci_options">options</a> &#187;
		</span>
		<a id="ci_nav_install" href="ahk://CustomInstall/" onclick="beforeCustomInstall()">install</a>
	</div>
	<div class="pager" id="ci_pager">
		<div class="page" id="ci_version">
			<p>Which version of AutoHotkey.exe should run by default?</p>
			<input type="hidden" id="installtype">
			<div class="options">
				<a href="#" id="it_Unicode" onclick="setInstallType('Unicode')" tabindex="1">Unicode 32-bit
					<p>Recommended for new installations/scripts.</p> <div class="marker">&#187;</div></a>
				<a href="#" id="it_x64" onclick="setInstallType('x64')" tabindex="2">Unicode 64-bit
					<p>Faster, but compiled scripts won't run on 32-bit systems.</p> <div class="marker">&#187;</div></a>
				<a href="#" id="it_ANSI" onclick="setInstallType('ANSI')" tabindex="3">ANSI 32-bit
					<p>Better compatibility with some legacy scripts.</p> <div class="marker">&#187;</div></a>
			</div>
		</div>
		<div class="page" id="ci_location">
			<label for="installdir" class="indent">Install location:<br>
			<input type="text" class="textbox" id="installdir" value="C:\Program Files\AutoHotkey" tabindex="11"> <a href="ahk://SelectFolder/installdir,Select the folder to install AutoHotkey in." id="installdir_browse" class="button" tabindex="12">Browse</a></label><br>
			<label for="startmenu" class="indent"> Create shortcuts in the following Start menu folder:<br>
			<input type="text" class="textbox" id="startmenu" value="AutoHotkey" tabindex="13"
				onfocus="if (style.color == '#888') value='', style.color = '';"
				onblur="if (value == '') value = '(don\'t create shortcuts)', style.color = '#888';">
			<a href="#" id="startmenu_del" class="button" style="color:red" tabindex="14"
				onclick = "startmenu.value=''; startmenu.onblur(); return false;">X</a>
			</label><br>
			<a href="#" id="next-button" class="button" onclick="ci_nav_list[2].click(); return false;" tabindex="15">Next</a>
		</div>
		<div class="page" id="ci_options">
			<label for="installcompiler"><input type="checkbox" id="installcompiler" checked="checked"> Install script compiler
				<p>Installs Ahk2Exe, a tool to convert any .ahk script into a stand-alone EXE.<br>
				Also adds a "Compile" option to .ahk context menus.</p>
				<p id="installcompilernote">Download and re-run the installer to reinstall Ahk2Exe.</p></label>
			<label for="enabledragdrop"><input type="checkbox" id="enabledragdrop" checked="checked"> Enable drag &amp; drop
				<p>Files dropped onto a .ahk script will launch that script (the files will be passed as parameters).  This can lead to accidental launching so some users may wish to disable it.</p></label>
			<label for="separatebuttons"><input type="checkbox" id="separatebuttons"> Separate taskbar buttons
				<p>Causes each script which has visible windows to be treated as a separate program, but prevents AutoHotkey.exe from being pinned to the taskbar.</p></label>
			<a href="ahk://CustomInstall/" onclick="beforeCustomInstall()" id="install_button" class="button">Install</a>
		</div>
	</div>
</div>

<div class="page" id="wait">
	<h1>AutoHotkey Setup</h1>
	<div class="nav">&nbsp;</div>
	<p style="color: #999; font-size: 120%; text-align: center; margin-top: 5em">this shouldn't take long...</p>
	<p style="text-align: center" id="install_status"></p>
</div>

<div class="page" id="done">
	<h1>AutoHotkey Setup</h1>
	<div class="nav">&nbsp;</div>
	<p>Installation complete.</p>
	<div class="options">
		<a href="ahk://ViewHelp//docs/AHKL_ChangeLog.htm">View Changes &amp; New Features</a>
		<a href="ahk://ViewHelp//docs/Tutorial.htm">View the Tutorial</a>
		<a href="ahk://RunAutoHotkey/">Run AutoHotkey</a>
		<a href="ahk://Quit/" id="done_exit">Exit</a>
	</div>
</div>

</body></html>
)
return