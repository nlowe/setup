# setup

This repo includes OOTB Setup Scripts and various dotfiles / configuration files.

## Usage

### Windows

```powershell
Set-ExecutionPolicy Bypass -Scope Process; [System.Text.Encoding]::UTF8.GetString((iwr -Uri https://setup.nlowe.me/init.ps1 -UseBasicParsing -Headers @{"Accept"="text/plain"}).Content) | Invoke-Expression
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