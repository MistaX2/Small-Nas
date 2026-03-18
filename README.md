# 🚀 VPS NAS Server using File Browser

A lightweight, self-hosted NAS (Network Attached Storage) server powered by File Browser.

Easily upload, download, manage and share files through a beautiful web interface.

---

## 🌟 Features

- 📂 Web-based File Manager UI
- 🔐 User Authentication
- 📤 Upload / 📥 Download Files
- 📁 Folder Management
- 🔄 Auto Start on VPS Boot
- ⚡ Lightweight & Fast
- 🌐 Accessible via Browser


you can Folder path chang ✅
---

## 🖥️ Server Details

| Item | Value |
|------|-------|
| NAS Root | `/var/www/html` |
| Database | `/opt/nas/filebrowser.db` |
| Service Name | `nas` |
| Port | `8880` |

---

## 📦 Installation (Ubuntu / Debian VPS)
## 📦 Install Nginx (Recomend)

### 1️⃣ Download setup script

```bash
gitclone https://github.com/MistaX2/Small-Nas.git

chmod +x nas_setup.sh
sudo bash nas_setup.sh
