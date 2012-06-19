%%%%%
%% Classe ``ufpatcc'' baseada na classe ``inetese''.
%% Os creditos foram mantidos abaixo.
%%
%% Classe ``inetese''
%%
%% Para as disserta��es de mestrado e teses de doutorado
%% do curso de p�s-gradua��o em Ci�ncia da Computa��o 
%% da Universidade Federal de Santa Catarina.
%%
%% Mantida pelo GruTeX (http://www.inf.ufsc.br/grutex)
%%
%% Hist�rico de vers�es:
%% --------------------
%% 0.1 - 26/01/2001 - Augusto Jun Devegili e Luciano Ignaczak
%%       Cria��o do prot�tipo da primeira vers�o
%% 0.5 - 06/04/2001 - Augusto Jun Devegili
%%       Corre��es e libera��o da primeira vers�o `oficial'
%% 0.6 - 11/04/2001 - Augusto Jun Devegili
%%       Inclus�o pacote tocbibind
%%       Altera��es nos ambientes para utilizar o comando \chapter*
%% 0.7 - 26/05/2001 - Ricardo Felipe Cust�dio
%%       Inclus�o dos pacotes babel e graphicx
%%
%% Observa��es:
%% -----------
%%
%% * todos os comandos de usu�rio come�am por `\ine'
%% * todos os comandos internos come�am por `\ine@'
%% * verifique na se��o de pacotes adicionais quais pacotes
%%   precisam estar instalados para a utiliza��o correta
%%   desta classe
%%
%% Exemplo de utiliza��o:
%% ---------------------
%%
%% \documentclass{inetese}
%%
%% \ineTitulo{Aqui vai o titulo da tese}
%% \ineAutor{Aqui vai o nome do autor da tese}
%% \ineOrientador{Aqui vai o nome do orientador do autor}
%% \ineAreaConcentracao{Aqui vai a area de concentra��o}
%% \ineTipoTese{Aqui vai o tipo da tese: disserta��o ou tese}
%% \ineGrau{Aqui vai o grau: mestre ou doutor}
%% \ineMes{Aqui vai o mes da tese}
%% \ineAno{Aqui vai o ano da tese}
%% \ineCoordenadorCurso{Aqui vai o nome do coordenador do CPGCC}
%% \ineMembroBancaA{Aqui vai o nome do 1o. membro da banca}
%% \ineMembroBancaB{Aqui vai o nome do 2o. membro da banca}
%% \ineMembroBancaC{Aqui vai o nome do 3o. membro da banca}
%%
%% \inePaginaDeRosto
%% \inePaginaDeAprovacao
%%
%% \begin{ineEpigrafe}
%%   Aqui vai o texto da epigrafe
%% \end{ineEpigrafe}
%%
%% \begin{ineOferecimento}
%%   Aqui vai o texto de oferecimento
%% \end{ineOferecimento}
%%
%% \begin{ineAgradecimentos}
%%   Aqui vai o texto de agradecimentos
%% \end{ineAgradecimentos}
%%
%% % Insere o Sum�rio
%% \tableofcontents    \clearpage
%%
%% % Insere a lista de Figuras e de Tabelas
%% \listoffigures \clearpage \listoftables \clearpage
%%
%% \begin{ineResumo}
%%   Aqui vai o resumo da tese
%% \end{ineResumo}
%%
%% \begin{abstract}
%%   Aqui vai o `abstract' da tese
%% \end{abstract}
%%
%% -- aqui come�a a monografia
%%
%% \chapter{Introdu��o}
%% \chapter{Revis�o Bibliogr�fica}
%% \chapter{Descri��o do Trabalho Realizado}
%% \chapter{Resultador}
%% \chapter{Conclus�o}
%%
%% % Trocar o nome default Bibliografia para Refer�ncias Bibliogr�ficas
%% \renewcommand\bibname{Refer�ncias Bibliogr�ficas}
%% \bibliographystyle{abnt} % Estilo para gerar refer�ncias em conformidade com
%%                          % as normas brasileiras
%% \bibliography{meu_arquivo_bib}
%%
%% -- aqui termina a monografia
%%%%%

%%%%%
%%
%% Identifica��o da classe
%%
%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufpatcc} [2008/01/10]

\typeout{}
\typeout{***********************************************}
\typeout{* ufpatcc.cls vers�o 0.7 - 10/01/2008}
\typeout{* Estilo para Trabalho de Conclus�o de Curso}
\typeout{* Universidade Federal do Par�}
\typeout{* Desenvolvido no LaPS: http://www.laps.ufpa.br}
\typeout{***********************************************}
\typeout{}

%%%%%
%%
%% Declara��o de op��es
%%
%%%%%
\DeclareOption*{\PassOptionToClass{\CurrentOption}{report}}
\ProcessOptions

%%%%%
%%
%% Utiliza��o da classe `report' como base
%%
%%%%%
\LoadClass[12pt,a4paper]{report}

%%%%%
%%
%% Utiliza��o de pacotes adicionais
%%
%%%%%
\RequirePackage{fancyhdr}
\RequirePackage[paper=a4paper,bottom=2cm,left=3cm,right=2cm,top=3cm,headheight=7mm,headsep=5mm,marginparsep=5mm,marginparwidth=10mm]{geometry}
\RequirePackage{times}
\RequirePackage{tocbibind}
\RequirePackage [brazil]{babel}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
\RequirePackage[small]{caption2}
\RequirePackage{supertabular}
\RequirePackage{ifthen}

\renewcommand{\captionlabelfont}{\bfseries}
\captionstyle{hang}

\setlength{\belowcaptionskip}{.5cm}

%%%%%
%% 
%% Comandos para formata��o de tamanhos (margens, espa�amento) e cabecalho
%%
%%%%%
\AtBeginDocument{
%  \setlength{\parindent}{1em}
  \setlength{\parindent}{1cm}
  \renewcommand{\baselinestretch}{1.5}
  
  \flushbottom
  
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead{}
  \fancyhead[R]{\thepage}
  \fancyfoot{}
  
  \fancypagestyle{plain}{%
    \fancyhead{}
    \fancyfoot{}
  }
}

%%%%%
%%
%% Defini��o de variaveis e valores padr�o
%%
%%%%%

%% Armazena o segundo argumento no comando especificado pelo primeiro
\newcommand{\ufpa@DefufpaValor}[2]{ \gdef#1{#2} }

\newcommand*{\ufpa@Titulo}{
  \ClassError{ufpatese}
    {Faltou especificar o titulo.}
    {Utilize o comando \protect\ufpaTitulo{} no preambulo.}
}

\newcommand*{\ufpa@Autor}{
  \ClassError{ufpatese}
    {Faltou especificar o autor.}
    {Utilize o comando \protect\ufpaAutor{} no preambulo.}
}

\newcommand*{\ufpa@Orientador}{
  \ClassError{ufpatese}
    {Faltou especificar o orientador.}
    {Utilize o comando \protect\ufpaOrientador{} no preambulo.}
}

\newcommand*{\ufpa@CoOrientador}{}

\newcommand*{\ufpa@TipoTese}{
  \ClassError{ufpatese}
    {Faltou especificar o tipo de tese.}
    {Utilize o comando \protect\ufpaTipoTese{} no preambulo para
    especificar o tipo de tese: Tese ou Dissertac�o.}
}

\newcommand*{\ufpa@Grau}{
  \ClassError{ufpatese}
    {Faltou especificar o grau obtido.}
    {Utilize o comando \protect\ufpaGrau{} no preambulo para
    especificar o grau obtido: Doutor ou Mestre.}
}

\newcommand*{\ufpa@AreaConcentracao}{
  \ClassError{ufpatese}
    {Faltou especificar a area de concentra��o.}
    {Utilize o comando \protect\ufpaAreaConcentracao{} no preambulo para
    especificar a area de concentra��o (e.g. sistemas de computa��o ou
    sistemas de conhecimento).}
}

\newcommand*{\ufpa@Mes}{
  \ClassError{ufpatese}
    {Faltou especificar o mes.}
    {Utilize o comando \protect\ufpaMes{} no preambulo para
    especificar o mes.}
}

\newcommand*{\ufpa@Ano}{
  \ClassError{ufpatese}
    {Faltou especificar o ano.}
    {Utilize o comando \protect\ufpaAno{} no preambulo para
    especificar o ano.}
}

\newcommand*{\ufpa@CoordenadorCurso}{
  \ClassError{ufpatese}
    {Faltou especificar o coordenador do curso.}
    {Utilize o comando \protect\ufpaCoordenadorCurso{} no preambulo para
    especificar o coordenador do curso.}
}

\newcommand*{\ufpa@MembroBancaA}{
  \ClassError{ufpatese}
    {Faltou especificar o primeiro membro da banca.}
    {Utilize o comando \protect\ufpaMembroBancaA{} no preambulo para
    especificar o primeiro membro da banca.}
}

\newcommand*{\ufpa@MembroBancaB}{}

\newcommand*{\ufpa@MembroBancaC}{}

%%%%%
%%
%% Defini��o dos comandos de usuario para informa��es padr�o
%%
%%%%%
\newcommand*{\ufpaTitulo}[1]{\ufpa@DefufpaValor{\ufpa@Titulo}{#1}}
\newcommand*{\ufpaAutor}[1]{\ufpa@DefufpaValor{\ufpa@Autor}{#1}}
\newcommand*{\ufpaSegundoAutor}[1]{\ufpa@DefufpaValor{\ufpa@SegundoAutor}{#1}}
\newcommand*{\ufpaOrientador}[1]{\ufpa@DefufpaValor{\ufpa@Orientador}{#1}}
\newcommand*{\ufpaCoOrientador}[1]{\ufpa@DefufpaValor{\ufpa@CoOrientador}{#1}}
\newcommand*{\ufpaTipoTese}[1]{\ufpa@DefufpaValor{\ufpa@TipoTese}{#1}}
\newcommand*{\ufpaGrau}[1]{\ufpa@DefufpaValor{\ufpa@Grau}{#1}}
\newcommand*{\ufpaAreaConcentracao}[1]{\ufpa@DefufpaValor{\ufpa@AreaConcentracao}{#1}}
\newcommand*{\ufpaMes}[1]{\ufpa@DefufpaValor{\ufpa@Mes}{#1}}
\newcommand*{\ufpaAno}[1]{\ufpa@DefufpaValor{\ufpa@Ano}{#1}}
\newcommand*{\ufpaCoordenadorCurso}[1]{\ufpa@DefufpaValor{\ufpa@CoordenadorCurso}{#1}}
\newcommand*{\ufpaMembroBancaA}[1]{\ufpa@DefufpaValor{\ufpa@MembroBancaA}{#1}}
\newcommand*{\ufpaMembroBancaB}[1]{\ufpa@DefufpaValor{\ufpa@MembroBancaB}{#1}}
\newcommand*{\ufpaMembroBancaC}[1]{\ufpa@DefufpaValor{\ufpa@MembroBancaC}{#1}}

%%%%%
%%
%% Defini��o da P�gina de rosto
%%
%%%%%
\newcommand*{\ufpaPaginaDeRosto}{
	\ufpaPaginaDeRostoData{2010}
}

\newcommand*{\ufpaPaginaDeRostoData}[1]{
  \pagenumbering{roman}
  \thispagestyle{empty}
  
  \begin{figure}[ht]
  \begin{center}
  \includegraphics[height=3cm]{ufpalogo}
  \end{center}
  \end{figure}
\begin{center}
    \fontsize{14pt}{14pt}\selectfont
    UNIVERSIDADE FEDERAL DO PAR\'{A}\\
    INSTITUTO DE TECNOLOGIA\\
    FACULDADE DE ENGENHARIA DA COMPUTA\c{C}\~{A}O

    \vspace{5cm}

    \fontsize{12pt}{12pt}\selectfont
    \textbf{\ufpa@Titulo}

\end{center}

\begin{flushright}
    \vspace{4cm}
  
    \fontsize{12pt}{12pt}\selectfont
    \textbf{\ufpa@Autor}

    \fontsize{12pt}{12pt}\selectfont
		 \textbf{\ufpa@SegundoAutor}

\end{flushright}

  
 \vspace{4cm}

  \begin{center}
    \normalsize BEL\'{E}M - PAR\'{A}\\
	#1
  \end{center}

  \vfill
}

%%%%%%%%%%%%%%%%%%%%%
%Inicio da P�gina de rosto 2 
%%%%%%%%%%%%%%%%%%%%%
\newcommand*{\ufpaPagRostodo}{
\ufpaPagRostodoData{2010}
}
\newcommand*{\ufpaPagRostodoData}[1]{
  
  
  \thispagestyle{plain}
  \pagenumbering{roman}
  
  \begin{figure}[ht]
  \begin{center}
  \includegraphics[height=3cm]{ufpalogo}
  \end{center}
  \end{figure}

\begin{center}
  
    \fontsize{14pt}{14pt}\selectfont
    UNIVERSIDADE FEDERAL DO PAR\'{A}\\
    INSTITUTO DE TECNOLOGIA\\
    FACULDADE DE ENGENHARIA DA COMPUTA\c{C}\~{A}O

    \vspace{4cm}
  
    \fontsize{12pt}{12pt}\selectfont
    \textbf{\ufpa@Autor} \\
		\textbf{\ufpa@SegundoAutor}
    \vspace{1cm}

    \fontsize{12pt}{12pt}\selectfont
    \textbf{\ufpa@Titulo}

 \vspace{3cm}
\begin{flushright}
\begin{minipage}[right]{7cm}
  \fontsize{10pt}{10pt}\selectfont Trabalho de Conclus\~{a}o de Curso apresentado para obten\c{c}\~{a}o do grau de Engenheiro em Engenharia da Computa\c{c}\~{a}o, do Instituto de Tecnologia, da Faculdade de Engenharia da Computa\c{c}\~{a}o.
 \end{minipage}
\end{flushright}

\vspace{3cm}    \normalsize BEL\'{E}M - PAR\'{A}\\
  #1
  \end{center}
  \vfill
}
%%%%%%%%%%%%%%%%%%%%%
%Fim da P�gina de rosto 2
%%%%%%%%%%%%%%%%%%%%%


%%%%%
%%
%% Defini��o da P�gina de aprova��o
%%
%%%%%
\newcommand*{\ufpa@Assinatura}[1]{
  \vspace{1 cm}
  \begin{flushright}
    \normalsize
    \vspace*{2mm}
    \vrule width 10cm height 0.2mm\\
    \vspace{-4mm} #1
  \end{flushright}
}

\newcommand*{\ufpaPaginaDeAprovacao}{
  %\clearpage
  \pagenumbering{roman}
   %\thispagestyle{empty}
  \thispagestyle{plain}

  \begin{center}
    \fontsize{12pt}{12pt}\selectfont
    \textbf{\ufpa@Titulo}
    \vspace{1cm}
    
  \end{center}
    
  \normalsize \noindent
  Este trabalho foi julgado adequado em \underline{ \qquad \qquad \qquad     } para a obten\c{c}\~{a}o do Grau de Engenheiro da Computa\c{c}\~{a}o, aprovado em sua forma pela banca examinadora que atribuiu o conceito \underline{  \qquad \qquad      }.
  
  \vspace{2 cm}

  \fontsize{11pt}{11pt}\selectfont

  \normalsize
  \begin{flushright}   
  \fontsize{11pt}{11pt}\selectfont
  
  \ufpa@Assinatura{\ufpa@Orientador}
  \vspace{0.3 cm}
  ORIENTADOR
  \ifthenelse{\equal{\ufpa@CoOrientador}{}}{
  }{
    \ufpa@Assinatura{\ufpa@CoOrientador}
    COORIENTADOR
  }
  \ufpa@Assinatura{\ufpa@MembroBancaA}
  MEMBRO DA BANCA EXAMINADORA
  \ufpa@Assinatura{\ufpa@MembroBancaB}
  MEMBRO DA BANCA EXAMINADORA
  \ifthenelse{\equal{\ufpa@MembroBancaC}{}}{
  }{
    \ufpa@Assinatura{\ufpa@MembroBancaC}
    MEMBRO DA BANCA EXAMINADORA
  }
  \vspace{0.5 cm}
  \ufpa@Assinatura{\ufpa@CoordenadorCurso}
  DIRETOR DA FACULDADE DE ENGENHARIA DA COMPUTA\c{C}\~{A}O

  \end{flushright}
  \normalsize
  \vfill
}

%%%%%
%%
%% P�gina de epigrafe
%%
%%%%%
\newenvironment{ufpaEpigrafe}{
  \clearpage
  \null\vfill

  \begin{flushright}
    \renewcommand{\baselinestretch}{1}
      \begin{minipage}{10cm}
        \begin{flushright}
          \fontshape{it}\selectfont
}{
        \end{flushright}
    \renewcommand{\baselinestretch}{1.5}
      \end{minipage}
    \end{flushright}
    \newpage
}

%%%%%
%%
%% P�gina de oferecimento
%%
%%%%%
\newenvironment{ufpaOferecimento}{
  \clearpage
  \null\vfill

  \begin{flushright}
      \begin{minipage}{10cm}
        \begin{flushright}
}{
        \end{flushright}
      \end{minipage}
    \end{flushright}
    \newpage
}

%%%%%
%%
%% P�gina de agradecimentos
%%
%%%%%
\newenvironment{ufpaAgradecimentos}{
    \chapter*{Agradecimentos}
}{
    \newpage
}

%%%%%
%%
%% P�gina do resumo
%%
%%%%%
\newenvironment{ufpaResumo}{
  \chapter*{Resumo}
  \addcontentsline{toc}{chapter}{Resumo}
}{
}

%%%%%
%%
%% P�gina do abstract
%%
%%%%%
\renewenvironment{abstract}{
  \chapter*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
}{
  \newpage
  \pagenumbering{arabic}
}

%%%%%
%%
%%  Parte de desenvolvimento
%%
%%%%%

\setcounter{secnumdepth}{3}
\renewcommand\thesubsubsection {\thesubsection.\@arabic\c@subsubsection}

%%%%%
%%
%%  Parte de desenvolvimento: Sugest�es de melhoria e corre��es necess�rias
%%
%%%%%
%
% D�vida n�mero 1
% Deve haver uma forma de colocar a primeira letra do \ufpa@TipoTese em min�sculo
%
% D�vida n�mero 1
% Trocar o \bibname de Bibliografia, o default para portug��s, para Refer�ncias Bibliogr�ficas
% Para contornar o problema est�-se sugerindo colocar o comando abaixo antes de incluir
% o ambiente de bibliografias no corpo da monografia
% \renewcommand\bibname{Refer�ncias Bibliogr�ficas}%
%
% Fim das d�vidas

%%%%% EOF: ufpatese.cls
