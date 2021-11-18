# see https://hub.docker.com/r/hashicorp/packer/tags for all available tags
FROM hashicorp/packer:light@sha256:93291f0b3041080b47b065b77309e5c1beee52c6bd691224d21d32e91ec9b562

RUN apk add --update python3 py-pip openssl ca-certificates openssh-client \
    && apk --update add python3-dev libffi-dev openssl-dev musl-dev gcc \
    && pip install --upgrade pip cffi \
    && pip install ansible
    
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
