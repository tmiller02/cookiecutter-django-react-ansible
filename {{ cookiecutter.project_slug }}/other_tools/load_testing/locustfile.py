from locust import between, task
from locust.contrib.fasthttp import FastHttpUser


class WebsiteUser(FastHttpUser):

    wait_time = between(5.0, 9.0)

    @task
    def get_index(self):
        self.client.get("/admin/")
