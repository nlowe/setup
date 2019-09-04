# setup

This repo includes OOTB Setup Scripts and various dotfiles / configuration files.

## Usage

Run the appropriate `init` script for your platform. This will install git via a package manager (and install a package manager on windows), clone this repo, and then continue setup with a local copy of the scripts

### Windows

```powershell
Set-ExecutionPolicy Bypass -Scope Process; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://setup.nlowe.me/init.ps1'))
```

If you're on an ancient version of windows or .NET you may need to alter your TLS Version first:

```powershell
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls13 -bor [System.Net.SecurityProtocolType]::Tls12

# Or, if it's stupid old, just enable 1.2:
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
```

### Linux

```bash
curl -fL https://setup.nlowe.me/init.sh | bash
```