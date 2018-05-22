server
    {
        listen 80;
        server_name {{host}};
        index index.php index.html index.htm default.html default.htm default.php;
        root  {{public_dir}};
        if (!-e $request_filename) {
           rewrite ^(.*)$ /index.php last;
           break;
        }

        location ~ [^/]\.php(/|$)
        {
            # comment try_files $uri =404; to enable pathinfo
                fastcgi_pass 127.0.0.1:9000;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                include fastcgi_params;
        }

        location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
        {
            expires      30d;
        }

        location ~ .*\.(js|css)?$
        {
            expires      12h;
        }

        #access_log  /home/wwwlogs/3g.gene.sh9l.cn.log  access;
    }

