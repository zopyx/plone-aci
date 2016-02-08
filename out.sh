rm plone.aci  
acbuild begin
acbuild set-name example.com/hello
acbuild dependency add quay.io/coreos/alpine-sh
acbuild run -- apk update
acbuild run -- apk add python git  python-dev py-pip
acbuild set-exec /bin/hello
acbuild run pip install virtualenv
acbuild run virtualenv plone
acbuild set-working-directory/ plone
acbuild run bin/pip install zc.buildout
acbuild run bin/zc.buildout bootstrap
acbuild copy buildout.cfg .
acbuild run bin/buildout 
acbuild write plone.aci 
acbuild end
