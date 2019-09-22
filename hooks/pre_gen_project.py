import re
import sys


def validate_slug_regex():
    slug_regex = r"^[a-zA-Z][_a-zA-Z0-9]+$"
    project_slug = "{{ cookiecutter.project_slug }}"
    if not re.match(slug_regex, "{{ cookiecutter.project_slug }}"):
        print("ERROR: %s is not a valid project slug" % project_slug)
        sys.exit(1)


def validate_hostnames():
    hostnames = [
        "{{ cookiecutter.frontend_app_dev_hostname }}",
        "{{ cookiecutter.backend_app_dev_hostname }}",
        "{{ cookiecutter.database_dev_hostname }}"
        "{{ cookiecutter.controller_hostname }}"
    ]
    if len(set(hostnames)) != len(hostnames):
        print("ERROR: all hostnames must be unique")
        sys.exit(1)


if __name__ == "__main__":
    validate_slug_regex()
    validate_hostnames()
