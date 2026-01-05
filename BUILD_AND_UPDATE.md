# 📦 Building and Updating Som DVPS

## 1. **Build the Release (Best for Friends)**

This creates the fast, optimized version.

1. **Run:**
   ```cmd
   build_release.bat
   ```
2. **Wait** 15-20 minutes.
3. **Find it:** `../VSCode-win32-x64` (One folder up from `vscode`, usually `C:\code\VSCode-win32-x64`)
4. **Send it:** Zip that folder and send it.

---

## 2. **How to Update (Icons, Code, Name)**

If you change an icon, the name, or any code, you must **REBUILD**.

### **Step 1: Make your changes** (e.g., replace `resources/win32/code.ico`)

### **Step 2: Clean the old build** (Important!)
```cmd
npm run gulp clean
```

### **Step 3: Rebuild the Release**
```cmd
build_release.bat
```

### **Step 4: Send the New Version**
Zip the new output and send to your friends. They should delete their old folder and use the new one.

---

## ⚡ **Quick Reference**

| Action | Command |
|ws|ws|
| **Test changes quickly (Dev)** | `npm run compile` then `npm run electron` |
| **Build final version (Release)** | `build_release.bat` |
| **Clean everything (Reset)** | `npm run gulp clean` |

---

### 🎨 Changing the Icon (Example)
1. Replace `c:\code\vscode\resources\win32\code.ico` with your new icon.
2. Run `npm run gulp clean`
3. Run `build_release.bat`

Done!
