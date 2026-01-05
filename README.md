# Som DVPS 🚀

**Som DVPS** is a custom, high-performance code editor built on the robust core of Visual Studio Code. This repository contains the source code, build scripts, and customization tools to build, run, and distribute your own version.

---

## 🛠️ Step 1: Prerequisites (Critical)

Before you do anything, you **MUST** have these specific versions installed.

### 1. Node.js (v20.x or v22.x)
You need a recent version of Node.js. The project is tested with **v22.21.1**.
*   **Direct Download (Windows x64 MSI):** [Download Node.js v22.21.1](https://nodejs.org/dist/v22.12.0/node-v22.12.0-x64.msi)
*   **Verify installation:**
    ```cmd
    node -v
    ```
    *(Output should be `v20.x.x` or `v22.x.x`)*

### 2. Visual Studio 2022 Build Tools
You need the Microsoft C++ compiler to build the native modules used by the editor.
*   **Direct Download Installer:** [vs_buildtools.exe](https://aka.ms/vs/17/release/vs_buildtools.exe)
*   **Installation Instructions:**
    1.  Run the installer.
    2.  Select **"Desktop development with C++"** workload.
    3.  On the **right side**, ensure these specific components are checked:
        *   ✅ **MSVC v143 - VS 2022 C++ x64/x86 build tools (Latest)**
        *   ✅ **Windows 11 SDK (10.0.xxxxx.x)**
        *   ✅ **C++ CMake tools for Windows**
        *   ✅ **MSVC v143 - VS 2022 C++ x64/x86 Spectre-mitigated libs** (Optional, but recommended to avoid warnings)

### 3. Python
*   Install Python 3 from the [Microsoft Store](https://apps.microsoft.com/store/detail/python-311/9NRWMJP3717K) or [python.org](https://www.python.org/downloads/).

---

## 📥 Step 2: Clone & Install

1.  **Clone the repository:**
    ```cmd
    git clone https://github.com/yousumohamed/Som-Dvps-Code1.git
    cd Som-Dvps-Code1
    ```

2.  **Run the automated installer:**
    We have created a special script that handles all the complex setup for you.
    ```cmd
    .\install_som_dvps.bat
    ```
    *   *This script sets strict build flags and installs all NPM dependencies.*
    *   *Wait for it to finish. If it succeeds, you are ready!*

---

## 🏃‍♂️ Step 3: How to Run

There are two ways to run the app depending on what you are doing.

### ⚡ Option A: "Just Run It" (Fastest)
Use this if you just want to launch the editor and use it.
```cmd
npm run som-dvps
```
*   **What it does:** Launches the pre-compiled version of the app immediately.

### 🧑‍💻 Option B: "Developer Mode" (Watch Changes)
Use this if you are editing the source code (JS/TS files) and want to see changes live.

1.  Open **Terminal 1** and run:
    ```cmd
    npm run watch
    ```
    *(This starts the incremental compiler. Wait for it to quiet down.)*

2.  Open **Terminal 2** and run:
    ```cmd
    npm run som-dvps
    ```
    *(Now, if you change a file, Terminal 1 will recompile it, and you can reload Terminal 2 to see changes.)*

---

## 📦 Step 4: How to Build a Release (.exe)

Ready to share **Som DVPS** with the world? You can build a professional installer.

1.  **Close all running instances** of Som DVPS.
2.  Run the build script:
    ```cmd
    .\build_release.bat
    ```
3.  **Wait patiently.** This process takes **15-20 minutes**.
    *   It cleans old files.
    *   It compiles and minifies the code (runs `gulp minify`).
    *   It builds the Windows executables.
    *   It creates a Setup Installer.

### 🎉 Where is my Installer?
Once the script says **"Build Complete!"**, look in these folders:

*   **The Installer (Share this file):**
    `C:\code\vscode\.build\win32-x64\system-setup\VSCodeSetup.exe`
    *(Rename this to `SomDVPS_Setup.exe` before sharing!)*

*   **The Zippable Folder:**
    `C:\code\vscode\.build\win32-x64\Som DVPS-win32-x64\`

---

## 🔧 Troubleshooting & Customization

### How to Change the Icon?
1.  Replace the file `resources\win32\code.ico` with your own `.ico` file.
2.  Run `build_release.bat` to bake it into the `.exe`.

### "Spectre-mitigated libraries are required" Error?
1.  Open **Visual Studio Installer**.
2.  Click **Modify** on your Build Tools.
3.  Go to **Individual Components**.
4.  Search for "Spectre".
5.  Check **MSVC v143 - VS 2022 C++ x64/x86 Spectre-mitigated libs (Latest)**.
6.  Click **Modify** to install.

### How to Change the Name?
1.  Open `product.json`.
2.  Edit `nameShort`, `nameLong`, and `applicationName`.
3.  Rebuild using `build_release.bat`.

---
**Som DVPS Team** - *Built for Developers, by Developers.*
