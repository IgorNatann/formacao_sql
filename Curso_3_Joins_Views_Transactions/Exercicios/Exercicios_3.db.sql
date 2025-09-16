/*
Consulta 1: Buscar o nome do professor e a turma que ele é orientador

Consulta 2: Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática

Consulta 3: Identificar o total de alunos por turma

Consulta 4: Listar os Alunos e as disciplinas em que estão matriculados

Consulta 5: Criar uma view que apresenta o nome, a disciplina e a nota dos alunos
*/

-- Consulta 1: Buscar o nome do professor e a turma que ele é orientador
SELECT P.Nome_Professor, T.Nome_Turma
FROM Professores P
JOIN Turmas T ON T.ID_Professor_Orientador = P.ID_Professor

-- Consulta 2: Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática
SELECT A.nome_aluno, N.nota 
FROM Alunos A 
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D ON N.ID_Disciplina = D.ID_Disciplina
WHERE D.Nome_Disciplina = 'Matemática'
order BY N.Nota DESC
LIMIT 1;

SELECT nome_aluno, MAX(nota)  as maior_nota
FROM Alunos A
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D ON D.ID_Disciplina = N.ID_Disciplina 
WHERE N.ID_Disciplina = 1;

-- Consulta 3: Identificar o total de alunos por turma
SELECT T.nome_turma, COUNT(TA.ID_Aluno) AS total_alunos
FROM Turmas T
JOIN Turma_Alunos TA ON T.ID_Turma = TA.ID_Turma
GROUP BY nome_turma;

SELECT nome_turma, COUNT(TA.ID_Turma) Total_alunos_turma
FROM Turmas T
JOIN Turma_Alunos TA
ON T.ID_Turma = TA.ID_Turma
GROUP BY nome_turma;

-- Consulta 4: Listar os Alunos e as disciplinas em que estão matriculados
SELECT A.Nome_Aluno, D.Nome_Disciplina
FROM Alunos A
JOIN Turma_Alunos TA on A.ID_Aluno = TA.ID_Aluno
JOIN Turma_Disciplinas TD ON TA.ID_Turma = TD.ID_Turma
JOIN Disciplinas D ON D.ID_Disciplina = TD.ID_Disciplina
ORDER BY nome_aluno;

-- Consulta 5: Criar uma view que apresenta o nome, a disciplina e a nota dos alunos
CREATE VIEW Disciplinas_Notas_Aluno AS
SELECT A.Nome_Aluno, D.Nome_Disciplina, N.nota
FROM Alunos A
JOIN Notas N ON A.ID_Aluno = N.ID_Aluno
JOIN Disciplinas D ON N.ID_Disciplina = D.ID_Disciplina
ORDER BY nome_aluno;

SELECT * FROM Disciplinas_Notas_Aluno;








