FROM alpine:3.7
RUN apk add --no-cache bash
RUN apk add --update python py-pip
RUN pip install --upgrade awscli==1.15.4
RUN apk add --no-cache gdal py-gdal proj4 --repository http://nl.alpinelinux.org/alpine/edge/testing
RUN ln -s /usr/lib/libproj.so.12 /usr/lib/libproj.so
COPY ./prepare-tiles ./prepare-tiles

ENTRYPOINT ["./prepare-tiles"]
