
all: sync01

sync01 :
	nice -n 19 rsync -a -H -A -x --compress --progress --delete \
		../rip/docs/ \
		./docs/
	cat CNAME > docs/CNAME




git :
	git config --global core.fileMode               false
	git config --global core.editor                 vim
	git config --global user.email                  "you@example.com"
	git config --global user.name                   "Your Name"
	git config --global pack.windowMemory           "32m"
	git config --global pack.packSizeLimit          "33m"
	git config --global pack.deltaCacheSize         "34m"
	git config --global pack.threads                "1"
	git config --global core.packedGitLimit         "35m"
	git config --global core.packedGitWindowSize    "36m"
	git config --global http.postbuffer             "5m"
	git repack -a -d --window-memory 10m --max-pack-size 50m

gitX:
	swapoff                /swapfile || echo
	#dd if=/dev/zero     of=/swapfile bs=1024 count=1048576
	dd if=/dev/zero     of=/swapfile bs=1024 count=4194304
	chmod 600              /swapfile
	mkswap                 /swapfile
	swapon                 /swapfile

up:
	pwd
	nice -n 17 git push -u origin master
#	nice -n 17 git push -u origin main
e:
	vim Makefile.env
m:
	vim Makefile
gs:
	nice -n 17 git status
gc:
	nice -n 17 git commit -a

gcXmmm:=$(shell (LC_ALL=C date +"%Y%m%d_%H%M%p" ; cat /etc/timezone )|tr "/\r\n-" _)
gcX:
	nice -n 17 git commit -m $(gcXmmm)


gd :
	nice -n 17 git diff

ga :
	nice -n 17 git add .
rp:
	@echo nice -n 17 git repack -a -d --window-memory 10m --max-pack-size 20m
	nice -n 17 git config pack.windowMemory 10m
	nice -n 17 git config pack.packSizeLimit 20m

X: ga gcX up
