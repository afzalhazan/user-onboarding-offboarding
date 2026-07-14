# 🖥️ User Onboarding & Offboarding Automation
Automated scripts for IT admins to provision and deprovision users 
on Linux systems and Windows Active Directory environments.

## 📋 What This Solves
Manual user creation is slow, error-prone, and inconsistent. 
These scripts enforce a repeatable standard across all systems.

## ✅ Features
- Linux user creation with password policy enforcement
- Windows AD user creation, OU placement, and group assignment
- Automated welcome email on onboarding
- Offboarding: account disable, group removal, home dir archiving
- Logs all actions to `/var/log/user_onboarding.log`

## 📸 Output Example
![Onboarding script output](docs/screenshots/onboarding-output.png)

## 🛠️ Tech Stack
- Bash, PowerShell, Python
- Tested on: Ubuntu 22.04, Windows Server 2022

## 🚀 How to Run
```bash
sudo ./onboarding/create_user.sh jsmith "John Smith" developers
```

## ⚠️ Prerequisites
- Root/sudo access (Linux) or Domain Admin (AD)
- Python 3.8+ for email script
- Edit `config/config.example.yaml` → save as `config.yaml`

## 📁 Project Structure
[paste your folder tree here]
