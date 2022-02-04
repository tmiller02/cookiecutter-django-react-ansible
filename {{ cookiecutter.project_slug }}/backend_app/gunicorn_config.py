import os
import environ
from multiprocessing import cpu_count

BASE_DIR = os.path.dirname((os.path.abspath(__file__)))
env = environ.Env()
env.read_env(os.path.join(BASE_DIR, "settings.env"))

bind = env.str("GUNICORN_BIND")
pidfile = env.str("GUNICORN_PID_FILE")
worker_class = "uvicorn.workers.UvicornWorker"
workers = cpu_count() * 2 + 1
