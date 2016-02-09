acbuild --debug=true  begin
acbuild --debug=true  set-name zopyx/plone
acbuild --debug=true  dependency add quay.io/coreos/alpine-sh
acbuild --debug=true  run ls /bin
acbuild --debug=true  run -- apk update
acbuild --debug=true  run -- apk add python git  python-dev py-pip
acbuild --debug=true  run pip install virtualenv
acbuild --debug=true  run virtualenv plone
acbuild --debug=true  copy buildout.cfg /plone/buildout.cfg
acbuild --debug=true  copy build.sh /plone/build.sh
acbuild --debug=true  run /bin/bash /plone/build.sh 
acbuild --debug=true  write --overwrite=true plone.aci 
acbuild --debug=true  end
