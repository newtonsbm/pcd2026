from django.db import models


class Curso(models.Model):
    nome = models.CharField(max_length=100)

    class Meta:
        ordering = ["nome"]

    def __str__(self):
        return self.nome


class Aluno(models.Model):
    nome = models.CharField(max_length=150)
    email = models.EmailField(unique=True)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE, related_name="alunos")
    data_nascimento = models.DateField()
    matriculado_em = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ["nome"]

    def __str__(self):
        return self.nome
