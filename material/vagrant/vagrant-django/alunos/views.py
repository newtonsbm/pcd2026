from django.shortcuts import get_object_or_404, render

from .models import Aluno, Curso


def lista_alunos(request):
    alunos = Aluno.objects.select_related("curso").all()
    return render(request, "alunos/lista_alunos.html", {"alunos": alunos})


def detalhe_aluno(request, aluno_id):
    aluno = get_object_or_404(Aluno, pk=aluno_id)
    return render(request, "alunos/detalhe_aluno.html", {"aluno": aluno})


def lista_cursos(request):
    cursos = Curso.objects.all()
    return render(request, "alunos/lista_cursos.html", {"cursos": cursos})
