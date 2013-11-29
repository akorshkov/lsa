" Vim syntax file
" Language: LISA
" Maintainer: Andrey Gladilin <agladilin@sw-soft.com>
" Last Change:  2005 Aug 12

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn keyword lsaStatement Icon ICON NOT NULL PK SK GK return exclude NOTAB
syn keyword lsaStatement Static Slave Manual Select RowName WhenEmpty
syn keyword lsaStatement access granted denied writable readonly audit not_referencible
syn keyword lsaStatement Name WIDTH RDBMS rdbmspp LEN java_gui_def java_gui MYSQL
syn keyword lsaStatement XMLVALIDATOR XMLTYPE SVALIDATOR XMLTYPE ENCRYPT DBLEN COLOR

syn keyword lsaType Int INT INT_POSITIVE INT_NON_NEGATIVE ENTITY_ID ID ENUM
syn keyword lsaType Double DOUBLE DATE TIME NAME BOOL MONEY STRA all
syntax match lsaType /\m\<STR\d*\>/

syn keyword lsaStorageClass UnArch Abstract Virtual Internal const
syn keyword lsaStatement Class Attributes Methods Views DataWindow Window Folder Groups
syn keyword lsaInclude parent embed
syn keyword lsaConstant INT_NULL
syn keyword lsaConstant ADMIN_Write ADMIN_Read PROVIDER_Read PROVIDER_Setup PROVIDER_Support PROVIDER_Financial PROVIDER_Marketing PROVIDER_Sales PROVIDER_Setup_R PROVIDER_Support_R PROVIDER_Financial_R PROVIDER_Marketing_R PROVIDER_Sales_R CUSTOMER_Write CUSTOMER_Read Decrypt NOBODY
syn keyword lsaSpecWord StandardInput MoveToArc Add Get Update
syn keyword lsaSpecWord GetWin UpdateWin

syn match   lsaSpecial display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region  lsaString   start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=lsaSpecial

syn region  lsaComment start="/\*" end="\*/" contains=cSpecial
syn region  lsaCommentLine start="//" skip="\\$" end="$" keepend contains=lsaSpecial
syn region  lsaCommentStrange start="\#" skip="\\$" end="$" keepend contains=lsaSpecial


" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink lsaInclude     Include
  HiLink lsaStatement   Statement
  HiLink lsaStructure   Structure
  HiLink lsaStorageClass StorageClass
  HiLink lsaType        Type
  HiLink lsaConstant    Constant
  HiLink lsaSpecWord    Identifier
  HiLink lsaString      String
  HiLink lsaCommentString Comment
  HiLink lsaComment     Comment
  HiLink lsaCommentLine Comment
  HiLink lsaCommentStrange Comment
  delcommand HiLink
endif
