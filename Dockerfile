FROM centos:8

RUN dnf install -y mysql-devel \
                   net-tools \
                   python3-devel \
                   gcc \
                   gcc-c++ \
                   make \
                   cmake \
                   curl && \
    yum clean all && \
    rm -rf /var/cache/yum

WORKDIR /opt

RUN pyvenv-3.6 python3.6

ENV PATH=$PATH:/opt/python3.6/bin

RUN mkdir ~/.pip && \
    echo -e "[global]\nindex-url = http://mirrors.aliyun.com/pypi/simple/\n[install]\ntrusted-host = mirrors.aliyun.com" > ~/.pip/pip.conf

ADD requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT ["./docker/entrypoint.sh"]
