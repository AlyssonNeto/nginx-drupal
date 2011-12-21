server {
    listen 80;
    server_name example.com;

    ## Access and error logs.
    access_log  /var/log/nginx/example.com_access.log;
    error_log   /var/log/nginx/example.com_error.log;

    ## Filesystem root of the site.
    root /var/www/example.com/docroot;

    include drupal;
}

server {
    ## Redirect www.example.com to example.com.
    listen 80;
    server_name www.example.com;
    return 301 $scheme://example.com$request_uri;
}
