FROM google/cloud-sdk:273.0.0-alpine
LABEL NAME="KindleEar"
LABEL version="1.26.9"


RUN gcloud components install app-engine-python app-engine-python-extras \
    && git clone https://github.com/cdhigh/KindleEar.git /app \
    && apk --update add py-lxml py-pillow py-jinja2 py-crypto


COPY cron-root /var/spool/cron/crontabs/root

WORKDIR /app

EXPOSE 8080

ENV SMTP_HOST=smtp.163.com
ENV SMTP_PORT=25
ENV SMTP_USER=xxx@163.com
ENV SMTP_PASSWORD=password
ENV SMTP_ALLOW_TLS=False

CMD crond -l 2 \
	&& /google-cloud-sdk/bin/dev_appserver.py    \
	--host 0.0.0.0  --admin_host 0.0.0.0  --enable_host_checking false --log_level warning \
	--smtp_host=${SMTP_HOST} \
	--smtp_port=${SMTP_PORT} \
	--smtp_user=${SMTP_USER} \
	--smtp_password=${SMTP_PASSWORD} \
	--smtp_allow_tls=${SMTP_ALLOW_TLS} \
	--datastore_path=/datastore/KindleEar.db  \
	app.yaml module-worker.yaml 
