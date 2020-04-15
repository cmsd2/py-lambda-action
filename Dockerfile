FROM lambci/lambda:build-python36

RUN apt-get update && apt-get install -y jq zip
RUN pip install awscli

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
