#!/bin/sh

echo 'starting entrypoint'
for f in $(find /opts/nginx/config/ -iname '*.conf' -type f);
do
  #mkdir -p $(dirname $f)
  relpath=${f#/opts/nginx/config/}
  mkdir -p $(dirname /etc/nginx/$relpath)
  envsubst '$$VIRTUAL_HOST $$REST_API_HOST $$S3_PROXY_PASS' < \
  $f > "/etc/nginx/$relpath";
done

exec nginx -g 'daemon off;'
