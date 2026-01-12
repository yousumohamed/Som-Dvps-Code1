# How to Build "Som DVPS" Installer

This guide explains how to use the automated script to build the full installer with your custom "Som DVPS" branding, logo, and watermarks.

## 🚀 The Magic Script: `rebuild_all.bat`

We have created a single script that handles the entire process. You do **not** need to run complex Gulp or npm commands manually.

### How to Run it:
1.  Open your terminal in VS Code.
2.  Type the following and hit Enter:
    ```powershell
    .\rebuild_all.bat
    ```

### What does it do? (The 3 Steps)

1.  **Fast Build of Application:**
    *   It compiles the TypeScript code.
    *   It embeds your custom "SOM DVPS" watermarks (SVGs).
    *   It updates the product configuration.
    *   *Time:* ~5-15 minutes.

2.  **Restore Tools:**
    *   It automatically fixes a common bug where `inno_updater.exe` and `vcruntime140.dll` go missing.
    *   It copies these files from your resources so the installer doesn't fail.

3.  **Build Installer (Inno Setup):**
    *   It packages everything into a single `.exe` file.
    *   It applies the EULA, Privacy Policy, and Progress Bar.
    *   *Time:* ~2-5 minutes.

---

## 📂 Where is my Installer?

When the script says **"SUCCESS!"**, your file is located here:
```text
c:\code\vscode\.build\win32-x64\system-setup\SomDVPSsetup.exe
```

## 🛠️ Troubleshooting

**If the build fails with "gyp" errors or specific node errors:**
Run the **Clean Build** script first to wipe out bad files, then try again:
```powershell
.\force_clean_build.bat
```
Then run `rebuild_all.bat` again.
