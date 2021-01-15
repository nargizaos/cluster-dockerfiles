FROM alpine:3.12
WORKDIR /root
RUN apk --no-cache add curl gettext
RUN apk update && apk add curl git
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/amd64/kubectl
RUN chmod u+x kubectl && mv kubectl /bin/kubectl

#kustomize v 3.8.7
RUN curl -LO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.8.7/kustomize_v3.8.7_linux_amd64.tar.gz
RUN tar -xf kustomize_v3.8.7_linux_amd64.tar.gz
RUN chmod +x kustomize && mv kustomize /usr/bin/kustomize

#kubeseal 0.1.13
RUN curl -LO https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.13.1/kubeseal-linux-amd64 && mv kubeseal-linux-amd64 kubeseal
RUN chmod u+x kubeseal && mv kubeseal /bin/kubeseal


#flux 0.4.0
RUN curl -LO https://github.com/fluxcd/flux2/releases/download/v0.4.0/flux_0.4.0_linux_amd64.tar.gz && tar -xf flux_0.4.0_linux_amd64.tar.gz
RUN chmod +x flux  && mv flux /bin/flux


#python and ansible
RUN apk add python3
RUN apk add ansible


ENTRYPOINT [ "/bin/bash" ]
