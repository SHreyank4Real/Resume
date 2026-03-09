# ─────────────────────────────────────────────
#  shreyank-resume — static site
#  Base: nginx:alpine (< 10 MB)
# ─────────────────────────────────────────────
FROM nginx:alpine

LABEL maintainer="sharma.shreyank6@gmail.com"
LABEL description="M S Shreyank Sharma — Resume Site"
LABEL version="1.0.0"

RUN rm -rf /usr/share/nginx/html/*
COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
