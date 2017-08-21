FROM alpine:3.5

RUN apk update && apk upgrade && \  
  apk add ruby-json ruby-irb && \
  apk add build-base ruby-dev && \
  apk add ca-certificates wget && \
  apk add git && \
  gem install fluentd -v "~> 0.12.0" --no-ri --no-rdoc && \
  gem install fluent-plugin-elasticsearch --no-ri --no-rdoc && \
  gem install gelf -v "~> 3.0.0" --no-ri --no-rdoc && \
  gem install aliyun_sls_sdk -v ">=0.0.9" --no-ri --no-rdoc && \
  gem install specific_install --no-ri --no-rdoc&& \
  gem install fluent-plugin-burrow --no-ri --no-rdoc &&   \
  mkdir -p /fluentd/logdata/temp && \
  touch /fluentd/logdata/temp/logfile.log.pos && \
  apk del build-base ruby-dev && \
  rm -rf /root/.gem

COPY plugins/ /etc/fluentd/plugins/

VOLUME /etc/fluentd/conf.d

