# Som DVPS - Simple Running Guide

## 🚀 How to Run Som DVPS (3 Simple Steps)

### Step 1: Compile (Do this ONCE or after making changes)
```cmd
cd c:\code\vscode
npm run compile
```
⏱️ Wait 5-7 minutes for compilation to finish.

---

### Step 2: Close Any Running VS Code Windows
- Close ALL VS Code windows
- Make sure no "Code - OSS" or "Som DVPS" is running

---

### Step 3: Launch Som DVPS
```cmd
cd c:\code\vscode
.\scripts\code.bat
```
✅ Som DVPS will open!

---

## 📝 Quick Reference

### After Making Changes to Code:
1. Close Som DVPS
2. Run: `npm run compile`
3. Run: `.\scripts\code.bat`

### For Development (Auto-recompile):
**Terminal 1:**
```cmd
npm run watch
```
(Keep this running)

**Terminal 2:**
```cmd
.\scripts\code.bat
```

---

## ❌ Common Issues

### "Error launching app" / "Cannot find module"
**Solution:**
1. Make sure compilation finished
2. Close all VS Code windows
3. Try again: `.\scripts\code.bat`

### "Already running"
**Solution:**
1. Close all VS Code windows
2. Run: `taskkill /F /IM "Code - OSS.exe"`
3. Try again: `.\scripts\code.bat`

---

## ✅ You're Done!

That's it! Just 3 steps:
1. Compile
2. Close other windows
3. Run `.\scripts\code.bat`

Your Som DVPS will launch! 🎉



The Installer (Send this to users):

`Location: c:\code\vscode\.build\win32-x64\system-setup\`

### File Name: VSCodeSetup.exe (Running this starts the installation with the progress bar).

### The Application (For you to test):

`Location: c:\code\VSCode-win32-x64\`

### File Name: Som DVPS.exe (This is the actual app running without installation).

### Important: The folder VSCode-win32-x64 is located outside your vscode project folder (in c:\code\).

### If fix_build.bat fails, let me know, and we can check the new logs.
