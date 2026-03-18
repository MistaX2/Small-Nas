#!/bin/bash

echo "🚀 Updating VPS..."
apt update -y && apt upgrade -y

echo "📦 Installing dependencies..."
apt install wget tar ufw -y

echo "📥 Downloading File Browser..."
cd /root
wget https://github.com/filebrowser/filebrowser/releases/latest/download/linux-amd64-filebrowser.tar.gz

echo "📂 Extracting..."
tar -xvf linux-amd64-filebrowser.tar.gz

echo "📁 Creating NAS directories..."
mkdir -p /opt/nas
mkdir -p /var/www/html

echo "🚚 Moving binary..."
mv filebrowser /opt/nas/
chmod +x /opt/nas/filebrowser

echo "🗄 Creating database..."
touch /opt/nas/filebrowser.db

echo "⚙️ Creating systemd service..."

cat <<EOF > /etc/systemd/system/nas.service
[Unit]
Description=File Browser NAS
After=network.target

[Service]
User=root
WorkingDirectory=/opt/nas
ExecStart=/opt/nas/filebrowser -r /var/www/html -p 8880 -a 0.0.0.0 -d /opt/nas/filebrowser.db
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

echo "🔄 Reloading systemd..."
systemctl daemon-reload

echo "✅ Enabling NAS auto-start..."
systemctl enable nas

echo "▶️ Starting NAS service..."
systemctl start nas



echo "🎉 NAS Server Setup Complete!"
echo "🌐 Access: http://YOUR_VPS_IP:8080"
echo "⚠️ Change password immediately!"
