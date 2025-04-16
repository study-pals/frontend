# 관리자 권한 검사 및 자체 상승(re‑launch) 로직
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "관리자 권한이 필요하여 재실행합니다…"
    Start-Process powershell `
        -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" `
        -Verb RunAs
    exit
}

# 종속성 설치
Set-ExecutionPolicy Unrestricted -Scope Process -Force
iex (New-Object System.Net.WebClient).DownloadString('https://aka.ms/rnw-vs2022-deps.ps1')
