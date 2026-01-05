# Som DVPS - Customization Guide

## 🎨 Branding Your Editor

### 1. Change Product Name

Edit `product.json`:

```json
{
  "nameShort": "Som DVPS",
  "nameLong": "Som DVPS Code Editor",
  "applicationName": "som-dvps",
  "dataFolderName": ".som-dvps",
  "win32MutexName": "somdvps",
  "win32DirName": "Som DVPS",
  "win32NameVersion": "Som DVPS",
  "win32RegValueName": "SomDVPS",
  "win32AppUserModelId": "Microsoft.SomDVPS",
  "win32ShellNameShort": "Som DVPS",
  "darwinBundleIdentifier": "com.somdvps.code",
  "linuxIconName": "som-dvps",
  "licenseFileName": "LICENSE.txt",
  "licenseName": "MIT",
  "licenseUrl": "https://github.com/yourusername/som-dvps/blob/main/LICENSE.txt"
}
```

### 2. Change Application Icon

Replace these files in `resources/win32/`:
- `code.ico` - Main application icon (256x256)
- `inno-big.bmp` - Installer banner (164x314)
- `inno-small.bmp` - Installer icon (55x55)

### 3. Customize Welcome Page

Edit `src/vs/workbench/contrib/welcome/page/browser/welcomePage.ts`

Example:
```typescript
const welcomeText = localize('welcome', "Welcome to Som DVPS!");
```

### 4. Add Custom Theme

Create a new theme in `extensions/theme-som-dvps/`:

```json
{
  "name": "Som DVPS Dark",
  "type": "dark",
  "colors": {
    "editor.background": "#1e1e1e",
    "editor.foreground": "#d4d4d4"
  }
}
```

### 5. Modify Startup Behavior

Edit `src/vs/code/electron-main/main.ts` to customize startup logic

---

## 🔧 Development Workflow

### Making Changes

1. **Edit source files** in `src/` or `extensions/`
2. **Recompile**:
   ```cmd
   npm run compile
   ```
   OR use watch mode:
   ```cmd
   npm run watch
   ```
3. **Restart Som DVPS**:
   ```cmd
   .\scripts\code.bat
   ```

### Quick Restart Script

Create `restart_som_dvps.bat`:
```batch
@echo off
taskkill /F /IM "Code - OSS.exe" /T 2>nul
timeout /t 2 /nobreak >nul
.\scripts\code.bat
```

---

## 📦 Building Distributable

### Create Windows Installer

```cmd
npm run gulp vscode-win32-x64
```

Output will be in `.build/win32-x64/`

### Create Portable Version

```cmd
npm run gulp vscode-win32-x64-archive
```

---

## 🚀 Advanced Customizations

### Add Custom Menu Items

Edit `src/vs/workbench/browser/parts/titlebar/menubarControl.ts`

### Add Custom Commands

Create in `src/vs/workbench/contrib/yourfeature/`:
```typescript
registerAction2(class extends Action2 {
  constructor() {
    super({
      id: 'somdvps.customCommand',
      title: 'Som DVPS: Custom Command',
      f1: true
    });
  }
  run() {
    // Your code here
  }
});
```

### Modify Keybindings

Edit `src/vs/platform/keybinding/common/keybindingsRegistry.ts`

---

## 📝 After Customization

1. Run `npm run compile`
2. Test with `.\scripts\code.bat`
3. Build installer with `npm run gulp vscode-win32-x64`

---

**Your Som DVPS is ready to customize!** 🎊
