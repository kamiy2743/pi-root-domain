// ログイン
docker run --rm -it \
    --user "$(id -u):$(id -g)" \
    -e HOME=/tmp \
    -w /tmp \
    -v "$(pwd)/cloudflared:/tmp/.cloudflared" \
    cloudflare/cloudflared:latest tunnel login

// トンネル作成
docker run --rm -it \
    --user "$(id -u):$(id -g)" \
    -e HOME=/tmp \
    -w /tmp \
    -v "$(pwd)/cloudflared:/tmp/.cloudflared" \
    cloudflare/cloudflared:latest tunnel create root-domain

// DNS登録
docker run --rm -it \
    --user "$(id -u):$(id -g)" \
    -e HOME=/tmp \
    -w /tmp \
    -v "$(pwd)/cloudflared:/tmp/.cloudflared" \
    cloudflare/cloudflared:latest tunnel route dns root-domain panda-dev.net
