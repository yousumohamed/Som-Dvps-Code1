# Som DVPS - Build Requirements & Setup Guide

## Prerequisites for Building VS Code on Windows

### 1. Node.js (EXACT VERSION REQUIRED)
- **Version**: 22.21.1 (as specified in `.nvmrc`)
- **Current**: You have v24.11.1 (TOO NEW - causes module errors)
- **Install**:
  ```powershell
  # Close and reopen PowerShell as Administrator after NVM installation
  nvm install 22.21.1
  nvm use 22.21.1
  node -v  # Should show v22.21.1
  ```

### 2. Python
- **Version**: 3.x (you have 3.13.7 ✓)
- **Status**: ✓ Already installed

### 3. Visual Studio Build Tools (CRITICAL)
- **Required**: Visual Studio 2022 Build Tools OR Visual Studio 2022 Community
- **Status**: ✓ Installed, but missing Spectre libraries

#### Required Components:
You need to install these in Visual Studio Installer:

**Workloads Tab:**
- ✓ Desktop development with C++

**Individual Components Tab (CRITICAL - Currently Missing):**
- ✓ MSVC v143 - VS 2022 C++ x64/x86 build tools (latest)
- ✓ **MSVC v143 - VS 2022 C++ x64/x86 Spectre-mitigated libs (latest)** ← YOU NEED THIS
- ✓ Windows 10 SDK (10.0.19041.0 or later)
- ✓ C++ CMake tools for Windows

### 4. Git
- **Status**: ✓ Already have the repo cloned

---

## Step-by-Step Setup for Som DVPS

### Step 1: Install Correct Node.js Version
```powershell
# Open NEW PowerShell window (to load NVM)
nvm install 22.21.1
nvm use 22.21.1
node -v  # Verify: should show v22.21.1
```

### Step 2: Fix Visual Studio Components
1. Open **Visual Studio Installer**
2. Click **Modify** on your VS 2022 installation
3. Go to **Individual components** tab
4. Search for "Spectre"
5. Check: **MSVC v143 - VS 2022 C++ x64/x86 Spectre-mitigated libs (latest)**
6. Click **Modify** to install

### Step 3: Clean Install
```powershell
cd c:\code\vscode

# Remove old installations
Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue
Remove-Item package-lock.json -ErrorAction SilentlyContinue

# Install dependencies
npm install
```

### Step 4: Build Som DVPS
```powershell
# Watch mode (for development)
npm run watch

# In a NEW terminal, run VS Code
.\scripts\code.bat
```

---

## Common Issues & Solutions

### Issue 1: "ERR_MODULE_NOT_FOUND"
**Cause**: Wrong Node.js version
**Fix**: Use Node.js 22.21.1 exactly

### Issue 2: "MSB8040: Spectre-mitigated libraries are required"
**Cause**: Missing Visual Studio component
**Fix**: Install Spectre libs (see Step 2 above)

### Issue 3: "gyp ERR! build error"
**Cause**: Missing C++ build tools
**Fix**: Install full "Desktop development with C++" workload

---

## Customizing Som DVPS

### Change Product Name
Edit `product.json`:
```json
{
  "nameShort": "Som DVPS",
  "nameLong": "Som DVPS",
  "applicationName": "som-dvps",
  ...
}
```

### Change Icon
Replace files in `resources/win32/`:
- `code.ico` - Main icon
- `inno-big.bmp` - Installer banner
- `inno-small.bmp` - Installer icon

### Change Colors/Theme
Edit `src/vs/workbench/common/theme.ts`

---

## Build Commands Reference

```powershell
# Install dependencies
npm install

# Compile TypeScript (one-time)
npm run compile

# Watch mode (auto-recompile on changes)
npm run watch

# Run your custom VS Code
.\scripts\code.bat

# Run tests
npm test

# Create distributable package
npm run gulp vscode-win32-x64
```

---

## What's Currently Blocking You

1. **Node.js version mismatch**: v24.11.1 instead of v22.21.1
2. **Spectre libraries**: Not properly installed/configured

Once these are fixed, the build should work!

---

## Next Steps

1. Close this PowerShell
2. Open NEW PowerShell as Administrator
3. Run: `nvm use 22.21.1`
4. Install Spectre libs in Visual Studio Installer
5. Run: `npm install` in c:\code\vscode
6. Run: `npm run watch`
7. In new terminal: `.\scripts\code.bat`

Your Som DVPS should launch! 🚀
