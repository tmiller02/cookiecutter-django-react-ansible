import re
import sys


def validate_slug_regex():
    slug_regex = r'^[a-zA-Z][_a-zA-Z0-9]+$'
    project_slug = '{{ cookiecutter.project_slug }}'
    if not re.match(slug_regex, '{{ cookiecutter.project_slug }}'):
        print('ERROR: %s is not a valid project slug' % project_slug)
        sys.exit(1)


if __name__ == "__main__":
    validate_slug_regex()
