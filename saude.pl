:- [dados].

% Binary Relations
%%%%%%%%%%%%%%%%%%%%%%%%%
% Instituição - Serviço
% Instituição - Utente
% Instituição - Profissional
% Serviços - Profissionais
% Serviços - Utentes
% Profissionais - Utentes

% Ternary Relations
%%%%%%%%%%%%%%%%%%%%%%%%%
% Instituição   - Serviço       - Profissionais
% Instituição   - Serviço       - Utentes 
% Instituição   - Profissionais - Utentes
% Profissionais - Serviço       - Utentes


%%%%%%%%%%%%%%%%
% Utils

% union([], _, []).
% union(_, [], []).
% union([X|Xs], Ys, [X | Joined]) :- member(X, Ys), union(Xs, Ys, Joined).
% union([_|Xs], Ys, Joined) :- union(Xs, Ys, Joined).



%%%%%%%%%%%%%%%%
% Enunciado

% Identificar os serviços existentes numa instituição;
servicosInstituicao(Instituicao, Servicos) :- 
    findall(Servico , prestaServico(Instituicao, Servico), Servicos).


% Identificar os utentes de uma instituição;
utentesInstituicao(Instituicao, Utentes) :- 
    findall(Utente, eUtente(Utente, Instituicao), Utentes).


% Identificar os utentes de um determinado serviço;
utentesServico(Servico, Utentes) :- 
    findall(Utente, inscritoServico(Utente, Servico), Utentes).

% Identificar os utentes de um determinado serviço numa instituição;
utentesServicoInstituicao(Servico, Instituicao, Utentes) :- 
    utentesServico(Servico, Utentes1), 
    utentesInstituicao(Instituicao, Utentes2), 
    union(Utentes1, Utentes2, Utentes).

% Identificar as instituições onde seja prestado um dado serviço ou conjunto de serviços;

instituicoesServico(Instituicoes, Servico) :-
    findall(Instituicao , prestaServico(Instituicao, Servico), Instituicoes).

instituicoesServicos(Instituicoes, [Servico]) :-
    instituicoesServico(Instituicoes, Servico).
instituicoesServicos(Instituicoes, [Servico | Servicos]) :-
    instituicoesServico(Instituicoes1, Servico), 
    instituicoesServicos(Instituicoes2, Servicos), 
    union(Instituicoes1, Instituicoes2, Instituicoes).


% Identificar os serviços que não se podem encontrar numa instituição;
servicosNaoPrestados(Instituicao, Servicos) :-
    findall(Servico, prestaServico(_, Servico), TodosServicos), 
    servicosInstituicao(Instituicao, ServicosInstituicao),
    subtract(TodosServicos, ServicosInstituicao, Servicos).


% Determinar as instituições onde um profissional presta serviço;


% Determinar todas as instituições (ou serviços, ou profissionais) a que um utente já recorreu;

% Registar utentes, profissionais, serviços ou instituições;

% Remover utentes (ou profissionais, ou serviços, ou instituições) dos registos.

