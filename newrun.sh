#!/bin/bash

# 下载 release 压缩包
wget https://github.com/liulilittle/openppp2/releases/download/1.0.0.25196/openppp2-linux-amd64.zip

# 解压文件
unzip openppp2-linux-amd64.zip

# 删除默认配置文件
rm -f appsettings.json

# 生成新的配置文件
cat > appsettings.json << 'EOF'
{
    "concurrent":1,
    "key": {
        "kf": 154543927,
        "kx": 128,
        "kl": 10,
        "kh": 12,
        "protocol": "aes-128-cfb",
        "protocol-key": "N6HMzdUs7IUnYHwq",
        "transport": "aes-256-cfb",
        "transport-key": "HWFweXu2g5RVMEpy",
        "masked": false,
        "plaintext": false,
        "delta-encode": false,
        "shuffle-data": false
    },
    "ip": {
        "public": "::",
        "interface": "::"
    },
    "tcp": {
        "inactive": {
            "timeout": 300
        },
        "connect": {
            "timeout": 5
        },
        "listen": {
            "port": 36666
        },
        "turbo": true,
        "backlog": 511,
        "fast-open": true
    },
    "udp": {
        "inactive": {
            "timeout": 72
        },
        "dns": {
            "timeout": 4,
            "redirect": "0.0.0.0"
        }
    },
    "websocket": {
        "host": "starrylink.net",
        "path": "/tun",
        "listen": {
            "ws": 80
        },
        "http": {
            "error": "Status Code: 404; Not Found",
            "request": {
                "Upgrade": "websocket",
                "Connection": "Upgrade",
                "Sec-WebSocket-Key": "==",
                "Sec-WebSocket-Version": "13",
                "Sec-WebSocket-Extensions": "permessage-deflate; client_max_window_bits"
            },
            "response": {
                "Server": "Kestrel"
            }
        }
    },
    "server": {
        "log": "",
        "node": 1,
        "subnet": true,
        "mapping": true
    }
}
EOF

# 赋予执行权限并启动程序
chmod +x ./ppp
