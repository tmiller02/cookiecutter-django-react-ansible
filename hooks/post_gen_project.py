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
    with open(file_path, "r+") as file_obj:
        contents = file_obj.read()
        contents = contents.replace(pattern, value)
        file_obj.seek(0)
        file_obj.write(contents)
        file_obj.truncate()


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


success_message = """
This project has the following requirements. Make sure these are installed \
before getting started:

  \u2022 VirtualBox - https://www.virtualbox.org/
  \u2022 Vagrant - https://www.vagrantup.com/
    
To get started, run:

  $ cd {{ cookiecutter.project_slug }}
  $ vagrant up --provision
    
Once provisioning has finished, you can access the dev VM at \
http://{{ cookiecutter.dev_vm_hostname }} or \
http://api.{{ cookiecutter.dev_vm_hostname }}
    
Check the documentation at  {{ cookiecutter.project_slug }}/README.md for more.
"""


def print_success():
    print(
        "\n" + GREEN + BOLD + "Your project has been generated successfully." + END_COLOR
    )
    print(success_message)


if __name__ == "__main__":
    dev_group_vars = os.path.join("provisioning", "environments", "dev", "group_vars")
    dev_backend_vars = os.path.join(dev_group_vars, "backend", "vars.yml")
    dev_all_vars = os.path.join(dev_group_vars, "all", "vars.yml")

    set_django_secret_key(dev_backend_vars)
    set_database_password(dev_all_vars)
    print_success()
