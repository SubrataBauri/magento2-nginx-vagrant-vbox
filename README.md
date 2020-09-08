## Setup mysql
`sudo mysql_secure_installation`

## Configure Nginx to Use the PHP Processor

[Follow this link](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04)

`sudo nano /etc/nginx/sites-available/default`

```
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name server_domain_or_IP;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

```
$ sudo service nginx restart

$ sudo service php7.4-fpm restart
```

## ISSUES

### admin 400 error after installation
[Enable nginx rewrite](https://www.digitalocean.com/community/questions/enabling-nginx-mod_rewrite)

### 502 bad gateway
[Solution - Increase buffer size](https://magento.stackexchange.com/questions/243248/how-to-solve-502-bad-gateway-error-in-nginx-magento-2)

### Admin/Frontend broken (css/js not loading)

```
var > cache > *DELETE ALL*
var > page_cache > *DELETE ALL*
var > session > *DELETE ALL*
> var > view_preprocessed > *DELETE ALL*
pub > static > DELETE ALL EXCEPT .HTACCESS
````

#### Remove static file signing in dev environment (mydql)
`insert into core_config_data (config_id, scope, scope_id, path, value) values (null, 'default', 0, 'dev/static/sign', 0);`

`bin/magento setup:static-content:deploy`
