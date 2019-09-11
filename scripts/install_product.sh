#!/usr/bin/env bash

# exit if product is not set
if [ ! "$PRODUCT" ] ; then
  echo "this script needs a variable PRODUCT=product"
  exit 1
fi

if [ -z "$VERSION" ] ; then
  VERSION=`curl -sL https://releases.hashicorp.com/${PRODUCT}/index.json | jq -r '.versions[].version' | sort -V | egrep -v 'ent|beta|rc|alpha' | tail -1`
fi

which ${PRODUCT} || {
  cd /usr/local/bin
  wget https://releases.hashicorp.com/${PRODUCT}/${VERSION}/${PRODUCT}_${VERSION}_linux_amd64.zip
  unzip ${PRODUCT}_${VERSION}_linux_amd64.zip
}
