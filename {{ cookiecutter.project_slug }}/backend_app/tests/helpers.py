from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.firefox_binary import FirefoxBinary

from django.contrib.staticfiles.testing import StaticLiveServerTestCase
from django.conf import settings


class SeleniumLiveServerTestCase(StaticLiveServerTestCase):
    @classmethod
    def setUpClass(cls):
        super().setUpClass()
        options = Options()
        options.add_argument("--width=1024")
        options.add_argument("--height=768")
        if settings.SELENIUM_TESTS_RUN_HEADLESS:
            options.headless = True

        cls.selenium = Firefox(
            firefox_binary=FirefoxBinary(firefox_path='/usr/bin/firefox'),
            executable_path="/usr/local/bin/geckodriver", options=options
        )
        cls.selenium.implicitly_wait(10)

    @classmethod
    def tearDownClass(cls):
        cls.selenium.quit()
        super().tearDownClass()
