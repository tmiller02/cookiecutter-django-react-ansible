import os
import random
import string

GREEN = "\033[32m"
BOLD = "\033[1m"
END_COLOR = "\033[0m"


def generate_random_string(length):
    choices = set(string.ascii_letters + string.digits + string.punctuation)
    unsuitable = {"'", '"', "$", "\\", "%"}
    choices = tuple(choices.difference(unsuitable))
    return "".join([random.SystemRandom().choice(choices) for _ in range(length)])


def substitute_pattern_in_file(file_path, pattern, value):
    with open(file_path, "r+") as open_file:
        contents = open_file.read()
        contents = contents.replace(pattern, value)
        open_file.seek(0)
        open_file.write(contents)
        open_file.truncate()


def set_django_secret_key(file_path):
    substitute_pattern_in_file(
        file_path,
        pattern="$DJANGO SECRET KEY$",
        value=generate_random_string(length=50),
    )


def set_database_password(file_path):
    substitute_pattern_in_file(
        file_path,
        pattern="$DATABASE PASSWORD$",
        value=generate_random_string(length=60),
    )


def convert_crlf_to_lf():
    """Convert the line endings of all files in the current working directory to LF.

    If cookiecutter is run on Windows to generate the project, all files are
    initially written with CRLF line endings. This breaks the shebang line in
    files such as manage.py, so we convert all line endings to LF."""

    crlf_line_ending = b'\r\n'
    lf_line_ending = b'\n'

    for dir_path, _, filenames in os.walk(os.getcwd()):
        for filename in filenames:
            file_path = os.path.join(dir_path, filename)

            with open(file_path, 'rb') as open_file:
                content = open_file.read()

            content = content.replace(crlf_line_ending, lf_line_ending)

            with open(file_path, 'wb') as open_file:
                open_file.write(content)
                open_file.truncate()


success_message = u"""
This project has the following requirements. Make sure these are installed \
before getting started:

  \u2022 VirtualBox - https://www.virtualbox.org/
  \u2022 Vagrant - https://www.vagrantup.com/
    
To get started, run:

  $ cd {{ cookiecutter.project_slug }}
  $ vagrant up --provision
    
Once provisioning has finished, you can access the dev VM at \
http://{{ cookiecutter.dev_vm_hostname }}
    
Check the documentation at  {{ cookiecutter.project_slug }}/README.md for more.
"""


def print_success():
    print(
        "\n" + GREEN + BOLD + "Your project has been generated successfully." + END_COLOR
    )
    print(success_message)


if __name__ == "__main__":
    convert_crlf_to_lf()

    dev_group_vars = os.path.join("provisioning", "environments", "dev", "group_vars")
    dev_backend_vars = os.path.join(dev_group_vars, "backend", "vars.yml")
    dev_all_vars = os.path.join(dev_group_vars, "all", "vars.yml")

    set_django_secret_key(dev_backend_vars)
    set_database_password(dev_all_vars)
    print_success()
