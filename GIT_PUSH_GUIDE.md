# How to Push "Som DVPS" to GitHub

Pushing this project can be tricky because the build output folders (like `VSCode-win32-x64`) are **very large** and should **NOT** be uploaded to GitHub.

Follow these steps to push your changes successfully without errors.

## ⚠️ Important Rule
**NEVER** remove `../VSCode-win32-x64/` from your `.gitignore` file. If you accidentally try to push that folder, the upload will fail because it's too big.

---

## Step 1: Check Status
Before pushing, see what files you have changed:
```powershell
git status
```
*   **Red files:** Changed but not ready to commit.
*   **Green files:** Ready to commit.

## Step 2: Add Changes
To prepare all your edited files for uploading:
```powershell
git add .
```
*If you only want to add specific files, use `git add filename`.*

## Step 3: Commit (Save Locally)
This saves your snapshot locally.
**Note:** If you get an error about "husky" or "linting", add `--no-verify` to bypass it.

```powershell
git commit -m "Describe your changes here" --no-verify
```

## Step 4: Push (Upload to GitHub)
Send your commits to the cloud.
```powershell
git push origin main
```

---

## 🆘 Troubleshooting

### "File too large" or "Hung up unexpectedly"
This usually means you are trying to push the build output.
1.  Check your `.gitignore` file ensures `../VSCode-win32-x64/` is listed.
2.  Run this command to stop tracking the build folder if it got added by mistake:
    ```powershell
    git rm -r --cached ../VSCode-win32-x64
    ```
3.  Commit and push again.
