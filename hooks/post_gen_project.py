import os
import random
import string


def generate_random_string(length):
    choices = set(string.ascii_letters + string.digits + string.punctuation)
    unsuitable = {"'", '"', "$", "\\"}
    choices = tuple(choices.difference(unsuitable))
    return ''.join([
        random.SystemRandom().choice(choices) for _ in range(length)
    ])


def substitute_pattern_in_file(file_path, pattern, value):
    with open(file_path, "r+") as file_obj:
        contents = file_obj.read()
        contents = contents.replace(pattern, value)
        file_obj.seek(0)
        file_obj.write(contents)
        file_obj.truncate()


def set_django_secret_key(file_path):
    substitute_pattern_in_file(
        file_path, pattern="$DJANGO SECRET KEY$",
        value=generate_random_string(length=50)
    )


def set_database_password(file_path):
    substitute_pattern_in_file(
        file_path, pattern="$DATABASE PASSWORD$",
        value=generate_random_string(length=60)
    )


if __name__ == "__main__":
    dev_group_vars = os.path.join(
        'provisioning', 'environments', 'dev', 'group_vars')
    dev_backend_vars = os.path.join(dev_group_vars, 'backend', 'vars.yml')
    dev_all_vars = os.path.join(dev_group_vars, 'all', 'vars.yml')

    set_django_secret_key(dev_backend_vars)
    set_database_password(dev_all_vars)
