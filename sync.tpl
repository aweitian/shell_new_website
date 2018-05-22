NowPath=`pwd`
cd {{web_root_dir}}/{{domain}} || exit
unset GIT_DIR
git pull origin master
exit 0
