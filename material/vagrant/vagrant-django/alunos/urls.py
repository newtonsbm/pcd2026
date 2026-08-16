from django.urls import path

from . import views

app_name = "alunos"

urlpatterns = [
    path("", views.lista_alunos, name="lista_alunos"),
    path("alunos/<int:aluno_id>/", views.detalhe_aluno, name="detalhe_aluno"),
    path("cursos/", views.lista_cursos, name="lista_cursos"),
]
