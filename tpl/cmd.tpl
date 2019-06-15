cat {{nginx_conf_src}}
cat tmp/{{exe}}

cp {{nginx_conf_src}} {{nginx_conf_dst}}
cd {{repository_dir}}
git init --bare {{domain}}.git
cd {{domain}}.git
cd hooks
cat tmp/{{exe}} > post-receive
chmod +x post-receive
cd {{repository_dir}}
chown -R git {{domain}}.git
cd {{web_root_dir}}
git clone {{repository_dir}}/{{domain}}.git
chown -R git {{domain}}
echo ssh://git@{{ip}}:{{port}}{{repository_dir}}/{{domain}}.git
