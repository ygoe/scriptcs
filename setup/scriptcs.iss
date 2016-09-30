#define RevId GetStringFileInfo("..\artifacts\Release\bin\scriptcs.exe", "ProductVersion")
#define ShortRevId GetFileVersion("..\artifacts\Release\bin\scriptcs.exe")

[Setup]
; Names and versions for the Windows programs listing
AppName=scriptcs
AppVersion={#RevId}
AppPublisherURL=http://scriptcs.net/

; Setup file version
VersionInfoDescription=ScriptCS Setup
VersionInfoVersion={#ShortRevId}

; General application information
AppId=ScriptCS
ArchitecturesInstallIn64BitMode=x64

; General setup information
DefaultDirName={pf}\ScriptCS
AllowUNCPath=False
UsePreviousGroup=False
DisableProgramGroupPage=yes
DisableReadyPage=True
ChangesAssociations=yes

; Uninstaller configuration
UninstallDisplayName=ScriptCS
UninstallDisplayIcon={app}\scriptcs.exe

; Setup package creation
OutputDir=bin
OutputBaseFilename=ScriptCS-Setup-{#RevId}

[Files]
Source: "..\artifacts\Release\bin\Autofac.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Autofac.Integration.Mef.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Common.Logging.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Microsoft.CodeAnalysis.CSharp.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Microsoft.CodeAnalysis.Desktop.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Microsoft.CodeAnalysis.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Microsoft.CodeAnalysis.Scripting.CSharp.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Microsoft.CodeAnalysis.Scripting.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Microsoft.Web.XmlTransform.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\NuGet.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\PowerArgs.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\ScriptCs.Contracts.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\ScriptCs.Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\ScriptCs.Engine.Roslyn.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\scriptcs.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\scriptcs.exe.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\ScriptCs.Hosting.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\System.Collections.Immutable.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\artifacts\Release\bin\System.Reflection.Metadata.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LICENSE.md"; DestDir: "{app}"; Flags: ignoreversion

Source: "SetPath.exe"; DestDir: "{app}"; Flags: ignoreversion

[Registry]
; Register .csx file name extension
Root: HKCR; Subkey: ".csx"; ValueType: string; ValueName: ""; ValueData: "CSharpScript"; Flags: uninsdeletevalue 
Root: HKCR; Subkey: "CSharpScript"; ValueType: string; ValueName: ""; ValueData: "Tx dictionary"; Flags: uninsdeletekey
Root: HKCR; Subkey: "CSharpScript\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\scriptcs.exe,0"
Root: HKCR; Subkey: "CSharpScript\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\scriptcs.exe"" ""%1"""

[Run]
Filename: "{app}\SetPath.exe"; Parameters: "/addsystem ""{app}"""; Flags: runhidden
Filename: "{win}\Microsoft.NET\Framework\v4.0.30319\ngen.exe"; Parameters: "install ""{app}\scriptcs.exe"""; Flags: runhidden

[UninstallRun]
Filename: "{app}\SetPath.exe"; Parameters: "/removesystem ""{app}"""; Flags: runhidden
Filename: "{win}\Microsoft.NET\Framework\v4.0.30319\ngen.exe"; Parameters: "uninstall ""{app}\scriptcs.exe"""; Flags: runhidden
