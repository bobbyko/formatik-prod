docker service create \
    --network formatik_net \
    --replicas 1 \
    --mount type=bind,source=/root/formatik/formatik-prod/nginx/sites-enabled,destination=/etc/nginx/sites-enabled \
    --mount type=bind,source=/root/formatik/formatik-prod/nginx/cert,destination=/etc/nginx/cert \
    --mount type=bind,source=/root/formatik/formatik-prod/nginx/nginx.conf,destination=/etc/nginx/nginx.conf \
    --publish 80:80 \
    --publish 443:443 \
    --name reverse-proxy \
    nginx:latest


docker run \
    --name reverse-proxy \
    --rm \
    -ti \
    -v ~/formatik/formatik-prod/nginx/sites-enabled:/etc/nginx/sites-enabled:ro \
    -v ~/formatik/formatik-prod/nginx/cert:/etc/nginx/cert:ro \
    -v ~/formatik/formatik-prod/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
    -p 80:80 \
    -p 443:443 \
    nginx:latest


docker run --rm -ti nginx:latest bash