from locust import HttpLocust, TaskSet, between, task
from locust.contrib.fasthttp import FastHttpLocust


class UserBehavior(TaskSet):

    @task
    def get_index(self):
        self.client.get("/admin/")


class WebsiteUser(FastHttpLocust):
    task_set = UserBehavior
    wait_time = between(5.0, 9.0)
