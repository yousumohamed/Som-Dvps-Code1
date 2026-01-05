# 🚀 Som DVPS - FINAL SIMPLE GUIDE

## ✅ How to Run Som DVPS

### **Single Command:**
```cmd
cd c:\code\vscode
npm run electron
```

**That's it!** Som DVPS will launch with "Som DVPS" in the title bar.

---

## 📝 After Making Code Changes

```cmd
# 1. Recompile
npm run compile

# 2. Launch
npm run electron
```

---

## 🎯 Quick Start Script

I've created `run_som_dvps.bat` for you. Just double-click it or run:
```cmd
run_som_dvps.bat
```

---

## ✅ What's Working Now

- ✓ Window title shows "Som DVPS"
- ✓ All features work
- ✓ Your custom editor is ready!

The executable is still called "code-oss.exe" internally, but users see "Som DVPS" everywhere that matters (window title, menus, etc.).

---

## 🎨 To Fully Rebrand (Optional)

If you want the .exe file itself to be called "Som DVPS.exe", you need to build a distributable:

```cmd
npm run gulp vscode-win32-x64
```

This creates a full installer in `.build/win32-x64/` with everything branded as "Som DVPS".

---

**Your Som DVPS is ready to use!** 🎉

Just run: `npm run electron`
