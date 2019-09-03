from .helpers import SeleniumLiveServerTestCase


class AdminTests(SeleniumLiveServerTestCase):

    def test_display_admin_login_page(self):
        """Simple test to demonstrate the usage of selenium.

        Check that navigating to /admin/ displays the login page for the
        django admin.
        """
        self.selenium.get('%s%s' % (self.live_server_url, '/admin/'))
        site_name_element = self.selenium.find_element_by_id("site-name")
        self.assertEqual(site_name_element.text, 'Django administration')
