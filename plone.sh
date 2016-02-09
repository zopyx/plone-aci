#!/bin/bash
BUILD='acbuild --debug=true '

$BUILD  begin
$BUILD  set-name zopyx/plone
$BUILD  dependency add quay.io/coreos/alpine-sh
$BUILD  run -- apk update
$BUILD  run -- apk add python git  python-dev py-pip bash 
$BUILD  run ls /bin
$BUILD  run pip install virtualenv
$BUILD  run virtualenv plone
$BUILD  copy buildout.cfg /plone/buildout.cfg
$BUILD  copy build.sh /plone/build.sh
$BUILD  run /bin/bash /plone/build.sh 
$BUILD  write --overwrite=true plone.aci 
$BUILD  end
