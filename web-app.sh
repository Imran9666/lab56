#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p tempdir/templates tempdir/static
cp sample_app.py requirements.txt tempdir/
cp templates/index.html tempdir/templates/
cp static/style.css tempdir/static/
cat > tempdir/Dockerfile <<'DOCKERFILE'
FROM python@sha256:e06cc1111ed84189e91866447f562b89faadbfbbb9937cd67e6bf4172cdb45df
WORKDIR /home/myapp
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt
COPY sample_app.py .
COPY templates ./templates
COPY static ./static
EXPOSE 5000
CMD ["python", "sample_app.py"]
DOCKERFILE
docker build -t cmp6237-lab56:course tempdir
old=$(docker ps -aq --filter name=^/cmp6237-lab56$)
if [ -n "$old" ]; then
 docker rm -f "$old"
fi
docker run -d --name cmp6237-lab56 \
 -p 127.0.0.1:5000:5000 cmp6237-lab56:course
docker ps --filter name=^/cmp6237-lab56$
