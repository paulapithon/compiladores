%{ #include <stdio.h>
   #inlcude <stdlib.h>
   codigo* raiz = null;
%}

% token ID,
% token L_STRING,
% token OP_GT,
% token OP_LT,
% token PIPE,
% token COLON,
% token SEMICOLON,
% token INCLUD_OPEN, 
% token INCLUD_CLOSE,
% token L_TOKEN,
% token L_UNION,
% token C_BRACKET_LEFT,
% token C_BRACKET_RIGHT,
% token SEPARATOR,
% token L_TYPE


% union  {
  int64_t integer;
  std: string  strg;
}
%type <integer> L_INT
%type <strg> ID

%%
inicio : codigo { raiz = $1; }

codigo: preambulo  SEPARATOR exps SEPARATOR { $$ = new PreambuloSeparatorExpsSeparator($1, $3); };

preambulo: includes def_tokens def_union def_tipos { $$ = new IncludesDef_TokenDef_UnionDef_Tipos($1,$2,$3,$4); };
           
includes: INCLUD_OPEN texto INCLUD_CLOSE { $$ = new Includ_OpenTextoInclud_Open($2); }
          | ;

texto: L_STRING
       | L_STRING texto { $$ = new L_StringTexto ($2); };

def_tokens: L_TOKEN ID { $$ = new L_TokenId ($2); }
            | L_TOKEN ID def_tokens { $$ = new L_TokenIdDef_Tokens ($3); };
                  
def_union: L_UNION C_BRACKET_LEFT texto C_BRACKET_RIGHT { $$ = new L_UnionC_Bracket_LeftTextoC_Bracket_Right($3); }  
           | ;

def_tipos: L_TYPE OP_LT texto OP_GT ID { $$ = new L_TypeOp_LTTextoOp_GtId($2); }  
           | L_TYPE OP_LT texto OP_GT ID def_tipos { $$ = new L_TypeOp_LTTextoOp_GtIdDef_Tipos ($2,$5); }  
           | ;
                             
exps: bloco { $$ = new Bloco(); }                                 // { $$ = $1;}
     |bloco exps { $$ = new BlocoExps ($1, $2); }

bloco: ID COLON linhas SEMICOLON { $$ = new IdColonLinhasSemicolon  ($3); };

linhas: linha { $$ = new Linha(); }                               // { $$ = $1;}
        |linha linhas { $$ = new LinhaLinhas ($2); };

linha: palavras { $$ = new Palavras(); }                          // { $$ = $1;}
       |PIPE palavras { $$ = new PipePalavras($2); } ; 
                   
palavras: ID
          |ID palavras { $$ = new IDPalavras ($2); } ;
   
%%
