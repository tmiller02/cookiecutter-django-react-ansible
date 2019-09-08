#!/bin/sh
{% raw %}
{% for service_name in ssl_certbot_stop_services %}
systemctl stop {{ service_name }}
{% endfor %}
{% endraw %}