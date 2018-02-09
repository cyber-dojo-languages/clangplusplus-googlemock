FROM  cyberdojofoundation/clangplusplus
LABEL maintainer=byran@adgico.co.uk

COPY gmock-1.7.0.zip /usr/src

ADD install.sh /

RUN /install.sh && \
    rm -f /install.sh

COPY red_amber_green.rb /usr/local/bin
