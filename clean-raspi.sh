#!/bin/bash
# ============================================================
# Raspberry Pi System Cleaner (by YD9CVS)
# Cleans old files, cache, logs, and dependencies
# Without deleting ~/MMDVM_HS (MMDVM firmware folder)
# ============================================================

echo "🧹 Cleaning Raspberry Pi system..."
sleep 1

# 1️⃣ Show disk space before cleaning
echo "💾 Disk space before cleaning:"
df -h /
echo "----------------------------------------------------"

# 2️⃣ Clean APT cache & remove unused packages
echo "🧩 Cleaning APT package cache..."
sudo apt clean -y >/dev/null 2>&1
sudo apt autoclean -y >/dev/null 2>&1
sudo apt autoremove --purge -y >/dev/null 2>&1

# 3️⃣ Clean old logs & archived files
echo "🧾 Removing old log files..."
sudo journalctl --vacuum-time=3d >/dev/null 2>&1
sudo rm -rf /var/log/*.gz /var/log/*.[0-9] >/dev/null 2>&1

# 4️⃣ Clean caches in /var
echo "🗑️ Removing caches in /var..."
sudo rm -rf /var/cache/apt/archives/* >/dev/null 2>&1
sudo rm -rf /var/cache/man/* >/dev/null 2>&1
sudo rm -rf /var/cache/fontconfig/* >/dev/null 2>&1
sudo rm -rf /var/cache/debconf/*-old >/dev/null 2>&1

# 5️⃣ Clean temporary folders
echo "🧭 Removing temporary files..."
sudo rm -rf /tmp/* /var/tmp/* >/dev/null 2>&1

# 6️⃣ Clean user caches
echo "👤 Removing user cache..."
rm -rf ~/.cache/* >/dev/null 2>&1
sudo rm -rf /root/.cache/* >/dev/null 2>&1

# 7️⃣ Remove documentation and man pages (optional)
echo "📚 Removing old documentation..."
sudo rm -rf /usr/share/doc/* >/dev/null 2>&1
sudo rm -rf /usr/share/man/* >/dev/null 2>&1
sudo rm -rf /usr/share/info/* >/dev/null 2>&1
sudo rm -rf /usr/share/lintian/* >/dev/null 2>&1
sudo rm -rf /usr/share/locale/* >/dev/null 2>&1

# 8️⃣ Fix broken dependencies (if any)
echo "🛠️ Fixing broken dependencies..."
sudo dpkg --configure -a >/dev/null 2>&1
sudo apt -f install -y >/dev/null 2>&1

# 9️⃣ Show disk space after cleaning
echo "----------------------------------------------------"
echo "💾 Disk space after cleaning:"
df -h /

echo "✅ Cleaning complete — ~/MMDVM_HS folder remains intact."
echo "💡 It is recommended to reboot for best performance."
