from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service

from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from django.conf import settings


class SeleniumLiveServerTestCase(StaticLiveServerTestCase):

    selenium: Firefox

    @classmethod
    def setUpClass(cls):
        super().setUpClass()
        options = Options()
        options.add_argument("--width=1024")
        options.add_argument("--height=768")
        options.headless = settings.SELENIUM_TESTS_RUN_HEADLESS
        options.binary_location = "/usr/bin/firefox-esr"

        driver_service = Service("/usr/bin/geckodriver")

        cls.selenium = Firefox(service=driver_service, options=options)
        cls.selenium.implicitly_wait(10)

    @classmethod
    def tearDownClass(cls):
        cls.selenium.quit()
        super().tearDownClass()
