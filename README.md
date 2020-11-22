# KindleEar


docker run -p 8080:8080 -d --name=kindleear   \
--restart=always  \

#KindleEar数据库目录
-v /home/ft/docker/kindleear/data/datastore.db:/datastore/KindleEar.db \

#KindleEar程序目录
-v  /home/ft/docker/kindleear/app:/app   \
-e SMTP_ALLOW_TLS=False   \
-e SMTP_HOST=smtp.163.com   \
-e SMTP_PORT=25   \
-e SMTP_USER=xxx@163.com   \
-e SMTP_PASSWORD=xxx   \
appleftg/kindleear:v1.26.7
