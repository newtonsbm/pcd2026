from django.contrib import admin

from .models import Aluno, Curso


@admin.register(Curso)
class CursoAdmin(admin.ModelAdmin):
    list_display = ["nome"]
    search_fields = ["nome"]


@admin.register(Aluno)
class AlunoAdmin(admin.ModelAdmin):
    list_display = ["nome", "email", "curso", "data_nascimento"]
    list_filter = ["curso"]
    search_fields = ["nome", "email"]
