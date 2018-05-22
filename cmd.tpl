cd {{repository_dir}}
git init --bare {{domain}}.git
cd {{domain}}.git
cd hooks
chown git {{sync_dir}}
echo {{sync_dir}}/{{exe}} > post-receive
chmod +x post-receive
chmod +x {{sync_dir}}/{{exe}}
chown git {{sync_dir}}/{{exe}}
cd {{repository_dir}}
chown -R git {{domain}}.git
cd {{web_root_dir}}
git clone {{repository_dir}}/{{domain}}.git
chown -R git {{domain}}
echo ssh://git@{{ip}}:{{port}}{{repository_dir}}/{{domain}}.git
