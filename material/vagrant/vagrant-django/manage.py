#!/usr/bin/env python
"""Utilitario de linha de comando do Django."""
import os
import sys


def main():
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "escola.settings")
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Nao foi possivel importar o Django. Ele esta instalado e "
            "o virtualenv esta ativado?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == "__main__":
    main()
