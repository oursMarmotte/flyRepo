[program:nginx]
priority=10
autostart=true
autorestart=true
stdout_events_enabled=true
stderr_events_enabled=true
command=/usr/local/bin/start-nginx
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0
stderr_logfile=/dev/stderr
stderr_logfile_maxbytes=0
<?php /**PATH phar://C:/Users/marmotte/Documents/monRestaurant_SERV/backend/vendor/fly-apps/dockerfile-laravel/builds/dockerfile-laravel\resources\views/fly/supervisor/conf_d/nginx_conf.blade.php ENDPATH**/ ?>