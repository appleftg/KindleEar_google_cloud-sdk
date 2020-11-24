# KindleEar        
##//构建镜像         \
docker build -t kindleear:v1.26.7 .        \
##//运行
docker run   --restart=always --name kindleear  \
-p 8080:8080     \
-e SMTP_HOST=smtp.163.com \
-e SMTP_PORT=25 \
-e SMTP_USER=xxx@163.com \
-e SMTP_PASSWORD=xxx \
-e SMTP_ALLOW_TLS=False \
-v /home/ft/docker/sync/kindleear/data/datastore.db:/datastore/KindleEar.db     \
-v /home/ft/docker/sync/kindleear/app:/app   \
appleftg/kindleear:v1.26.7    

##//修改推送邮箱    \
"/kindleear/app/config.py"    

line 7    SRC_EMAIL = "xxx@163.com"  #Your gmail account for sending mail to Kindle






##问题

1.推送邮件附件太大
The request to API call mail.Send() was too large

修改 MAX_REQUEST_SIZE

/google-cloud-sdk/platform/google_appengine/google/appengine/api/mail_stub.py
line 49  MAX_REQUEST_SIZE = 50 << 20


2.修改作者
/apps/Work/Worker.py       103行
