#!/bin/bash

useradd devel && cd /home/devel

openssl genrsa -out devel.key 2048

openssl req -new -key devel.pem -out devel.csr -subj "/CN=devel/O=devgroup"

openssl x509 -req -in devel.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out devel.crt -days 365

kubectl config set-credentials devel --client-certificate=/home/devel/devel.crt --client-key=/home/devel/devel.key

kubectl config set-context devel-context --cluster=kubernetes --user=devel



useradd analit && cd /home/analit

openssl genrsa -out analit.key 2048

openssl req -new -key analit.pem -out analit.csr -subj "/CN=analit/O=devgroup"

openssl x509 -req -in analit.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out analit.crt -days 365

kubectl config set-credentials analit --client-certificate=/home/analit/analit.crt --client-key=/home/analit/analit.key

kubectl config set-context analit-context --cluster=kubernetes --user=analit