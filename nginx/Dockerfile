FROM nginx:1.13.12-alpine

COPY ./*.sh /opts/nginx

EXPOSE 80

ENTRYPOINT /opts/nginx/entrypoint.sh