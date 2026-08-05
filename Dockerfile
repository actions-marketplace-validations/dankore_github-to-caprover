FROM node:20-slim

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Pin CLI: caprover@2.4.0+ crashes on load (commander rejects -t used by both
# --tarFile and --appToken). 2.3.1 still has the duplicate short flag but works.
RUN npm install -g caprover@2.3.1

COPY run.sh /app/run.sh

RUN chmod +x /app/run.sh

ENTRYPOINT ["sh", "/app/run.sh"]
