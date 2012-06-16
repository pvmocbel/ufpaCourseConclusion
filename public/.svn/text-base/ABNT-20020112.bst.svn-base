%% ----------------------------------------------------------------------
%% BibTeX estilo bibliografico `abnt'
%% (baseado no estilo `alpha')
%% versao 1.01
%% ----------------------------------------------------------------------
%% versao 1.00
%% Modificado por Ricardo Felipe Custodio (RFC) para contemplar
%% a norma ABNT - Brasil.
%% ----------------------------------------------------------------------
%% versao 1.01 em 11/2000
%% Modificado por Augusto Jun Devegili (AJD)
%% - formatacao do campo "edition" -> 1. ed.
%%   FUNCTION translate.edition
%%   FUNCTION format.edition
%%
%% - alteracao do tipo MISC para que howpublished possa ser interpretado
%%   como uma URL HTTP -> Dispon\'{\i}vel em <url>
%%   FUNCTION format.howpublished
%%   FUNCTION misc
%%
%% - alteracao para lidar com referencias legislativas
%%   @CONSTITUICAO = {
%%     local      (obrigatorio) % pais, estado ou munic\'{\i}pio
%%     anopromulg (obrigatorio) % ano de promulgacao
%%     titulo     (obrigatorio) % e.g. Constituicao da Republ...
%%     note       (opcional)    % dados gerais de publicacao
%%   }
%%
%%   @LEI = { % leis ou decretos
%%     local  (obrigatorio) % pais, estado ou municipio
%%     tipo   (opcional)    % lei (default) ou decreto
%%     numero (obrigatorio) % n\'{u}mero da lei/decreto
%%     data   (obrigatorio)
%%     ementa (obrigatorio)
%%     note   (opcional)    % dados gerais de publicacao
%%   }
%%
%%   @RESOLUCAO = { % portarias, resolucoes ou deliberacoes
%%     author (obrigatorio)
%%     ementa (opcional)
%%     tipo   (opcional)     % resolucao (default), portaria ou deliberacao
%%     numero (obrigatorio)
%%     data   (obrigatorio)
%%     note   (opcional)     % dados gerais de publicacao
%%   }
%%
%%   FUNCTION constituicao
%%   FUNCTION lei
%%   FUNCTION resolucao
%%   FUNCTION format.local
%%   FUNCTION format.anopromulg
%%   FUNCTION format.titulo
%%   FUNCTION format.numerodata
%%   FUNCTION format.titulolei
%%   FUNCTION format.autorresolucao
%%   FUNCTION format.tituloresolucao
%% ----------------------------------------------------------------------
ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
%% Inicio alteracao AJD
    local
    anopromulg
    titulo
    tipo
    numero
    data
    ementa
%% Fim alteracao AJD
  }
  {}
  { label extra.label sort.label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
    { add.period$ write$
      newline$
      "\newblock " write$
    }
    { output.state before.all =
        'write$
        { add.period$ " " * write$ }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output.nnaddress}
{ 's :=
  output.state mid.sentence =
    { ": " * write$ }
    { output.state after.block =
    { add.period$ write$
      newline$
      "\newblock " write$
    }
    { output.state before.all =
        'write$
        { add.period$ " " * write$ }
      if$
    }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.endereco}
{ duplicate$ empty$
    {pop$ "[S.l.]" output.nonnull }
    {output.nonnull}
  if$
}

FUNCTION {output.publicador}
{ duplicate$ empty$
    {pop$ "[s.n.]" output.nnaddress }
    {output.nnaddress}
  if$
}

FUNCTION {output.address}
{ duplicate$ empty$
    'pop$
    'output.nnaddress
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  "]{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
    'skip$
    { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\textbf{ " swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
% Se o número de autores for maior que 3 então apresenta somente um autor e colocar et. al.
% Se namesleft > 3
  namesleft #3 >
% então namesleft = 1
  { #1 'namesleft := }
% senão não faz nada
  'skip$
% fim se
  if$

% Enquanto namesleft > 0 faça 
    { namesleft #0 > }
    { s nameptr "{vv~}{ll}{, jj}{, f.}" format.name$ 't :=

% Se nameptr for maior que 1 Então
      nameptr #1 >
    { 
% Se namesleft > 0 Então    
    namesleft #0 >
% Adiciona ;
        { "; " * t * }
% Senão
        { 
% Se numnames > 2 então
        numnames #2 >
% Concatena com nulo
        { "" * }
% Senão
        'skip$
% Fim se
          if$
        }
% Fim se
      if$
    }
% Senão
    't
% Fim se
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
% Fim enquanto
  while$

  numnames nameptr >
  {" {et~al.}" * }
  'skip$
  if$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names "u" change.case$ }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
      editor num.names$ #1 >
    { ", editors" * }
    { ", editor" * }
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
    { t #1 #2 substring$ "--" = not
        { "--" *
          t #2 global.max$ substring$ 't :=
        }
        {   { t #1 #1 substring$ "-" = }
        { "-" *
          t #2 global.max$ substring$ 't :=
        }
          while$
        }
      if$
    }
    { t #1 #1 substring$ *
      t #2 global.max$ substring$ 't :=
    }
      if$
    }
  while$
}

FUNCTION {format.date}
{ year empty$
    { month empty$
    { "" }
    { "there's a month but no year in " cite$ * warning$
      month
    }
      if$
    }
    { month empty$
    'year
    { month ", " * year * }
      if$
    }
  if$
}

FUNCTION {formata.ano}
{ year empty$
    { "[S.d.]" }
    'year
  if$
}

FUNCTION {format.so.ano}
{ year empty$
    { month empty$
    { "" }
    { "there's a month but no year in " cite$ * warning$
      month
    }
      if$
    }
    { month empty$
    'year
    { year * }
      if$
    }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "" }
    { "" }
  if$
  swap$ * *
}

FUNCTION {conecta}
{ duplicate$ text.length$ #3 <
    { "" }
    { "" }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { "v." volume tie.or.space.connect
      series empty$
    'skip$
    { " of " * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
    { series field.or.null }
    { output.state mid.sentence =
        { "number" }
        { "Number" }
      if$
      number tie.or.space.connect
      series empty$
        { "there's a number but no series in " cite$ * warning$ }
        { " in " * series * }
      if$
    }
      if$
    }
    { "" }
  if$
}

%%%%%
%% FUNCTION translate.edition
%% Criada por AJD
%% Traduz a edi\c{c}\~{a}o (First = 1. etc)
%% Obs.: Faz apenas at\'{e} terceira edi\c{c}\~{a}o (experimental)
%%%%%

STRINGS { edicao }

FUNCTION {translate.edition}
{
    edition empty$
        { "" 'edicao := }
        { edition "First" =
            { "1." 'edicao := }
            { edition "Second" =
                { "2." 'edicao := }
                { edition "Third" =
                    { "3." 'edicao := }
                    { edition 'edicao := }
                  if$
                }
              if$
            }
          if$
        }
    if$
    edicao empty$
        'skip$
        { edicao add.period$ 'edicao := }
    if$
}

%%%%%
%% Alterada por AJD
%% Chamada a funcao translate.edition
%% Traducao "edition" -> "ed."
%% Para a norma ABNT nao faz sentido o tratamento de caso
%% executado pela versao anterior de format.edition
%%%%%
FUNCTION {format.edition}
{
    translate.edition
    edicao empty$
        { "" }
        { edicao "~ed." * }
    if$
%    edition empty$
%        { "" }
%        { output.state mid.sentence =
%            { edition "l" change.case$ " edition" * }
%            { edition "t" change.case$ " edition" * }
%          if$
%        }
%    if$
}

%%%%%
%% Criada por AJD
%% Verifica se a entrada howpublished contem uma URL e a formata
%% como: Disponivel em <http://url>
%%%%%
FUNCTION {format.howpublished}
{
    howpublished empty$
        { "" }
        { howpublished
          #1
          #7
          substring$
          "http://" =
            { "Dispon\'{\i}vel em $<$" howpublished * "$>$. Acesso em: " month * * }
            { howpublished }
          if$
        }
    if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
    { #1 'multiresult := }
    { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
    { "p." pages n.dashify tie.or.space.connect }
    { "p." pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {formata.pagina}
{ pages empty$
    { "" }
    { pages multi.page.check
    { pages " p." n.dashify tie.or.space.connect }
    { pages " p." conecta }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ "v." volume * field.or.null
  number empty$
    'skip$
    { ", n." number * *
      volume empty$
    { "there's a number but no volume in " cite$ * warning$ }
    'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
    { pop$ format.pages }
    { ", p." * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
    { "chapter" }
    { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
    'skip$
    { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
    { "In: " booktitle "u" change.case$ * }
    { "In: " format.editors * ", " * booktitle "u" change.case$ * }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Relat\'{o}rio T\'{e}cnico" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
    { "need key or journal for " cite$ * " to crossref " * crossref *
      warning$
      ""
    }
    { "In: {\em " journal * "\/}" * }
      if$
    }
    { "In: " key * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
    'skip$
    { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
        { " et~al." * }
        { " and " * editor #2 "{vv~}{ll}" format.name$ * }
      if$
    }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In: "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
    { series empty$
        { "need editor, key, or series for " cite$ * " to crossref " *
          crossref * warning$
          "" *
        }
        { "{\em " * series * "\/}" * }
      if$
    }
    { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
    { booktitle empty$
        { "need editor, key, or booktitle for " cite$ * " to crossref " *
          crossref * warning$
          ""
        }
        { "In: {\em " booktitle * "\/}" * }
      if$
    }
    { "In: " key * }
      if$
    }
    { "In: " format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { journal emphasize "journal" output.check
      address output.endereco
      format.vol.num.pages output
      format.date "year" output.check
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
    { "author and editor" editor either.or.check }
    'skip$
      if$
    }
  if$
  new.block
% Alterado por RFC em 13/01/2002
% Objetivo: Colocar em negrito o título
% Falta: Não colocar em negrito o subtítulo
% Código Origianal
%  format.title "title" output.check
% Código Alterado
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
% Alterado por RFC em 13/01/2002
% Objetivo: Inserir a Edição antes do local de publicação
      format.edition output
      new.sentence
% Fim da alteração
      address output.address
% Alterado por RFC em 13/01/2002
% Código Origianal
%      publisher "publisher" output.check
% Código Alterado
      publisher output.address
    }
    { new.block
      format.book.crossref output.nonnull
    }
  if$
%  format.edition output
  format.date "year" output.check
  new.block
  formata.pagina output
  new.block
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.title "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    { format.authors output.nonnull
      crossref missing$
    { "author and editor" editor either.or.check }
    'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      publisher "publisher" output.check
      address output
    }
    { format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      new.sentence
      publisher "publisher" output.check
      address output
      format.edition output
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      year output.nonnull
      new.block
     "\textbf{Proceedings... }" address * output.address
     publisher output.publicador
     formata.ano "year" output.check
     new.block
      format.bvolume output
      format.number.series output
      format.pages output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
    'skip$
    { organization output.nonnull
      address output
    }
      if$
    }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  author empty$
    { organization empty$
    { address new.block.checka
      address output
    }
    'skip$
      if$
    }
    { organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  address output.address
%  school "school" output.check
  school output.address
  format.date "year" output.check
  new.block
  formata.pagina output
  new.block
%  note output
  "Disserta\c{c}\~{a}o de Mestrado" format.thesis.type output.nonnull
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors "author" output.check
  new.block
  title howpublished new.block.checkb
  format.btitle output
  howpublished new.block.checka
%% Alterado por AJD
%% howpublished output
  format.howpublished output
%% Fim da alteracao AJD
%%  format.date output
  new.block
  note output
  fin.entry
  empty.misc.check
}

%%%%%
% Criada por AJD
% Formatacao do local de uma referencia legislativa
%%%%%
FUNCTION {format.local}
{
    local empty$
        { "" }
        { local "u" change.case$ }
    if$
}

%%%%%
% Criado por AJD
% Formatacao do ano de promulgacao de uma constituicao
%%%%%
FUNCTION {format.anopromulg}
{
    anopromulg empty$
        { "" }
        { "Constitui\c{c}\~{a}o (" anopromulg * ")" * }
    if$
}

%%%%%
% Criado por AJD
% Formatacao do titulo de uma constituicao
%%%%%
FUNCTION {format.titulo}
{
    titulo empty$
        { "" }
        { "\textbf{" titulo * "}" * }
    if$
}

%%%%%
% Criada por AJD
% Formatacao do numero e data de uma ref. legislativa
%%%%%

FUNCTION {format.numerodata}
{
    numero empty$
        { "" }
        { data empty$
            { "" }
            { " n.~" numero * ", de " * data * }
          if$
        }
    if$
}

%%%%%
% Criada por AJD
% Formatacao do tipo, numero e data de uma lei/decreto
%%%%%
FUNCTION {format.titulolei}
{
    format.numerodata empty$
        { "" }
        {
            tipo empty$
                { "Lei" }
                { tipo }
            if$
            format.numerodata *

        }
    if$
}

%%%%%
% Criada por AJD
% Formatacao do tipo, numero e data de uma lei/decreto
%%%%%
FUNCTION {format.tituloresolucao}
{
    format.numerodata empty$
        { "" }
        {
            tipo empty$
                { "Resolu\c{c}\~{a}o" }
                { tipo }
            if$
            format.numerodata *
        }
    if$
}

%%%%%
% Criada por AJD
% Formatacao do autor da resolucao
%%%%%
FUNCTION {format.autorresolucao}
{
    author empty$
        { "" }
        { author "u" change.case$ }
    if$
}

%%%%%
% Criada por AJD
% Geracao do item bibliografico ref. constituicao
% @CONSTITUICAO = {
%   local      (obrigatorio) % pais, estado ou munic\'{\i}pio
%   anopromulg (obrigatorio) % ano de promulgacao
%   titulo     (obrigatorio) % e.g. Constituicao da Republ...
%   dados gerais de publicacao (opcionais)
% }
%%%%%
FUNCTION {constituicao}
{
    output.bibitem
    format.local "local" output.check
    new.block
    format.anopromulg "anopromulg" output.check
    new.block
    format.titulo "titulo" output.check
    new.block
    note output
    fin.entry
}

%%%%%
% Criada por AJD
% Geracao do item bibliografico ref. lei/decreto
% @LEI = { % leis ou decretos
%   local  (obrigatorio) % pais, estado ou municipio
%   tipo   (opcional)    % lei (default) ou decreto
%   numero (obrigatorio) % n\'{u}mero da lei/decreto
%   data   (obrigatorio)
%   ementa (obrigatorio)
%   note   (opcional)    % dados gerais de publicacao
% }
%%%%%
FUNCTION {lei}
{
    output.bibitem
    format.local "local" output.check
    new.block
    format.titulolei "tipo/numero/data" output.check
    new.block
    ementa output
    new.block
    note output
    fin.entry
}

%%%%%
% Criada por AJD
% Geracao do item bibliografico ref. resolucao/portaria/deliberacao
% @RESOLUCAO = { % portarias, resolucoes ou deliberacoes
%   author (obrigatorio)
%   ementa (opcional)
%   tipo   (opcional)     % resolucao (default), portaria ou deliberacao
%   numero (obrigatorio)
%   data   (obrigatorio)
%   note   (opcional)     % dados gerais de publicacao
% }
%%%%%
FUNCTION {resolucao}
{
    output.bibitem
    format.autorresolucao "author" output.check
    new.block
    ementa output
    new.block
    format.tituloresolucao "tipo/numero/data" output.check
    new.block
    note output
    fin.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  address output.address
%  school "school" output.check
  school output.address
  format.date "year" output.check
  new.block
  formata.pagina output
  new.block
%  note output
  "Tese de Doutorado" format.thesis.type output.nonnull
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address empty$
    { editor empty$
    { publisher new.sentence.checka }
    { organization publisher new.sentence.checkb
      organization output
    }
      if$
      publisher output
      format.date "year" output.check
    }
    { address output.nonnull
      format.date "year" output.check
      new.sentence
      editor empty$
    'skip$
    { organization output }
      if$
      publisher output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  address output.address
  institution output.address
  format.date "year" output.check
  new.block
  formata.pagina output
  new.block
  format.tr.number output.nonnull
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"Janeiro"}

MACRO {feb} {"Fevereiro"}

MACRO {mar} {"Mar\c{c}o"}

MACRO {apr} {"Abril"}

MACRO {may} {"Maio"}

MACRO {jun} {"Junho"}

MACRO {jul} {"Julho"}

MACRO {aug} {"Agosto"}

MACRO {sep} {"Setembro"}

MACRO {oct} {"Outubro"}

MACRO {nov} {"Novembro"}

MACRO {dec} {"Dezembro"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

INTEGERS { et.al.char.used }

FUNCTION {initialize.et.al.char.used}
{ #0 'et.al.char.used :=
}

EXECUTE {initialize.et.al.char.used}

FUNCTION {format.lab.names}
{ 's :=
  #1 'numnames :=
  numnames #1 >
    { numnames #4 >
    { #3 'namesleft := }
    { numnames 'namesleft := }
      if$
      #1 'nameptr :=
      ""
    { namesleft #0 > }
    { nameptr numnames =
        { s nameptr "{ff }{vv }{ll}{ jj}" format.name$ "others" =
        { s nameptr "{v{}}{l{}}" format.name$ * }
          if$
        }
        { s nameptr "{v{}}{l{}}" format.name$ * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
      while$
    'skip$
      if$
    }
    { s #1 "{v{}}{l{}}" format.name$
      duplicate$ text.length$ #2 <
    { pop$ s #1 "{ll}" format.name$ #3 text.prefix$ "u" change.case$}
    'skip$
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
    { cite$ #1 #3 substring$ }
    { key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        { key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
    { organization empty$
        { cite$ #1 #3 substring$ }
        { "The " #4 organization chop.word #3 text.prefix$ }
      if$
    }
    { key #3 text.prefix$ }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
    { organization empty$
        { cite$ #1 #3 substring$ }
        { "The " #4 organization chop.word #3 text.prefix$ }
      if$
    }
    { key #3 text.prefix$ }
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.label}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
    'editor.key.organization.label
    { type$ "manual" =
        'author.key.organization.label
        'author.key.label
      if$
    }
      if$
    }
  if$
  duplicate$
% Alterado por RFC
  "~" year field.or.null purify$ #-1 #2 substring$ *
  *
  'label :=
  year field.or.null purify$ #-1 #4 substring$
  *
  sortify 'sort.label :=
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
    { "   " * }
    'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = t "others" = and
    { "et al" * }
    { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
    { "to sort, need author or key in " cite$ * warning$
      ""
    }
    { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
    { key empty$
        { "to sort, need author, editor, or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
    { key empty$
        { "to sort, need author, organization, or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
    { key empty$
        { "to sort, need editor, organization, or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  sort.label
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
    'editor.organization.sort
    { type$ "manual" =
        'author.organization.sort
        'author.sort
      if$
    }
      if$
    }
  if$
  *
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { longest.label last.sort.label next.extra }

INTEGERS { longest.label.width last.extra.num }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.sort.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
}

FUNCTION {forward.pass}
{ last.sort.label sort.label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      sort.label 'last.sort.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  label extra.label * 'label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
  extra.label 'next.extra :=
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {begin.bib}
{ et.al.char.used
    { "\newcommand{\etalchar}[1]{$^{#1}$}" write$ newline$ }
    'skip$
  if$
  preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
% Alterado por RFC em 13/01/2002 para não justificar e definir o tamanho da fonte para footnotesize
% Código Original
%  "\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
% Código alterado
  "\begin{flushleft}\footnotesize\begin{thebibliography}{"  longest.label  * "}" * write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
% Alterado por RFC em 13/01/2002 para não justificar e definir o tamanho da fonte para footnotesize
% Código Original
%  "\end{thebibliography}" write$ newline$
% Código alterado
  "\end{thebibliography}\end{flushleft}" write$ newline$
}

EXECUTE {end.bib}
