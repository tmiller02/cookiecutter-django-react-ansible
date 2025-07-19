# Limitations and Warnings

## Security

Basic security measures, such as a firewall (firewalld), are included, but overall server security is your responsibility.

Some advanced security features are intentionally left unconfigured to prevent accidental lockouts. Consider additional steps such as disabling root login, enforcing SSH key authentication, using monitoring tools like fail2ban, and setting up centralized logging.

## Backups

Backups are not configured by default. Ensure you have a reliable backup strategy and test it regularly.

## Load Balancing

This project works out of the box for small-scale production with certbot, whether the frontend and backend apps are co-located or on separate hosts. For horizontal scaling behind a load balancer, you must modify the certbot setup. Certbot in 'standalone' mode cannot handle Let's Encrypt challenges across multiple servers behind a load balancer.

## Certificate Update Process

Production certificates are regenerated with certbot in 'standalone' mode, which briefly stops NGINX every 60 days. If this approach does not fit your needs, consider alternative certificate management strategies.
