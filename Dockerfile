FROM lambci/lambda:build-python3.6

RUN yum install -y jq zip

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
