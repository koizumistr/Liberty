#ifdef __cplusplus
extern "C" {
#endif
/*
ANSI C code generated by 
Liberty Eiffel The GNU Eiffel Compiler, Eiffel tools and libraries
    release 2014.dev (Alexander Graham Bell)

Copyright (C), 2011-2014 - C.ADRIAN, P.REDAELLI, R.MACK
    http://www.liberty-eiffel.org

Original SmartEiffel code:
Copyright (C), 1994-2002 - INRIA - LORIA - ESIAL UHP Nancy 1 - FRANCE
Copyright (C), 2003-2005 - INRIA - LORIA - IUT Charlemagne Nancy 2 - FRANCE
D.COLNET, P.RIBET, C.ADRIAN, V.CROIZIER, F.MERIZEN
    http://smarteiffel.loria.fr
C Compiler options used: -pipe -O2 -fno-gcse
*/

#ifdef __cplusplus
}
#endif
#include "compile_to_c.h"
#ifdef __cplusplus
extern "C" {
#endif

T0* se_manifest1200(T2 initial_lower,int argc,...){
/*ARRAY[ARRAY[INTEGER_8]]*/
T1200*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1200/*niiii*/));
*C=M1200;
r1200manifest_make(C,argc,initial_lower);
imax=argc;
while (i < imax) {
T0* element=((T0*)(va_arg(pa,T0*)));
r1200manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

T0* se_manifest1057(T2 initial_lower,int argc,...){
/*ARRAY[TYPE_MARK]*/
T1057*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1057/*niiii*/));
*C=M1057;
r1057manifest_make(C,argc,initial_lower);
imax=argc;
while (i < imax) {
T0* element=((T0*)(va_arg(pa,T0*)));
r1057manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

T0* se_manifest1116(T2 initial_lower,int argc,...){
/*ARRAY[DECLARATION]*/
T1116*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1116/*niiii*/));
*C=M1116;
r1116manifest_make(C,argc,initial_lower);
imax=argc;
while (i < imax) {
T0* element=((T0*)(va_arg(pa,T0*)));
r1116manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

T0* se_manifest1159(int argc,...){
/*FAST_ARRAY[CODE]*/
T1159*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1159/*niii*/));
*C=M1159;
r1159manifest_make(C,argc);
imax=argc;
while (i < imax) {
T0* element=((T0*)(va_arg(pa,T0*)));
r1159manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

T0* se_manifest1044(int argc,...){
/*FAST_ARRAY[STRING]*/
T1044*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1044/*Tniii*/));
*C=M1044;
r1044manifest_make(C,argc);
imax=argc;
while (i < imax) {
T0* element=((T0*)(va_arg(pa,T0*)));
r1044manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

T0* se_manifest1496(int argc,...){
/*FAST_ARRAY[POINTER]*/
T1496*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1496/*niii*/));
*C=M1496;
r1496manifest_make(C,argc);
imax=argc;
while (i < imax) {
T8 element=((T8)(va_arg(pa,T8)));
r1496manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

T0* se_manifest1201(T2 initial_lower,int argc,...){
/*ARRAY[INTEGER_8]*/
T1201*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1201/*niiii*/));
*C=M1201;
r1201manifest_make(C,argc,initial_lower);
imax=argc;
while (i < imax) {
T1 element=((T1)(va_arg(pa,int)));
r1201manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

T0* se_manifest1066(int argc,...){
/*HASHED_SET[HASHED_STRING]*/
T1066*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1066/*pniiii*/));
*C=M1066;
r1066manifest_make(C,argc);
imax=argc;
while (i < imax) {
T0* element=((T0*)(va_arg(pa,T0*)));
r1066manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

T0* se_manifest1166(int argc,...){
/*HASHED_SET[STRING]*/
T1166*C;
va_list pa;
int i=0;
int imax;
va_start(pa,argc);
C=se_malloc(sizeof(T1166/*pniiii*/));
*C=M1166;
r1166manifest_make(C,argc);
imax=argc;
while (i < imax) {
T0* element=((T0*)(va_arg(pa,T0*)));
r1166manifest_put(C,i++,element);
}
va_end(pa);
return ((T0*)C);
}/*--*/

int can_assign_to394_from393(T0* expression){
/* WHEN_ITEM_1 ?:= WHEN_ITEM */
if (expression == NULL) return 1;
switch (expression->id) {
case 394/*WHEN_ITEM_1*/: return 1;
}
return 0;
}/*--*/

int can_assign_to822_from705(T0* expression){
/* LOADPATH ?:= CLASSES */
if (expression == NULL) return 1;
switch (expression->id) {
case 822/*LOADPATH*/: return 1;
}
return 0;
}/*--*/

int can_assign_to694_from349(T0* expression){
/* CST_ATT ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 699/*CST_ATT_CHARACTER*/: return 1;
case 696/*CST_ATT_STRING*/: return 1;
case 700/*CST_ATT_REAL*/: return 1;
case 693/*CST_ATT_BOOLEAN*/: return 1;
case 698/*CST_ATT_INTEGER*/: return 1;
case 697/*CST_ATT_UNIQUE*/: return 1;
}
return 0;
}/*--*/

int can_assign_toATTRIBUTE_from349(T0* expression){
/* ATTRIBUTE ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 701/*WRITABLE_ATTRIBUTE*/: return 1;
case 699/*CST_ATT_CHARACTER*/: return 1;
case 696/*CST_ATT_STRING*/: return 1;
case 700/*CST_ATT_REAL*/: return 1;
case 693/*CST_ATT_BOOLEAN*/: return 1;
case 698/*CST_ATT_INTEGER*/: return 1;
case 697/*CST_ATT_UNIQUE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to692_from349(T0* expression){
/* E_FUNCTION ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 692/*E_FUNCTION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to584_from349(T0* expression){
/* ONCE_FUNCTION ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 584/*ONCE_FUNCTION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to698_from349(T0* expression){
/* CST_ATT_INTEGER ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 698/*CST_ATT_INTEGER*/: return 1;
}
return 0;
}/*--*/

int can_assign_to701_from349(T0* expression){
/* WRITABLE_ATTRIBUTE ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 701/*WRITABLE_ATTRIBUTE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to691_from349(T0* expression){
/* E_PROCEDURE ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 691/*E_PROCEDURE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to690_from349(T0* expression){
/* ONCE_PROCEDURE ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 690/*ONCE_PROCEDURE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to693_from349(T0* expression){
/* CST_ATT_BOOLEAN ?:= ANONYMOUS_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 693/*CST_ATT_BOOLEAN*/: return 1;
}
return 0;
}/*--*/

int can_assign_to471_from401(T0* expression){
/* E_FALSE ?:= BOOLEAN_CONSTANT */
if (expression == NULL) return 1;
switch (expression->id) {
case 471/*E_FALSE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to376_from357(T0* expression){
/* OTHER_INSPECT_STATEMENT ?:= INSTRUCTION */
if (expression == NULL) return 1;
switch (expression->id) {
case 376/*OTHER_INSPECT_STATEMENT*/: return 1;
}
return 0;
}/*--*/

int can_assign_to410_from357(T0* expression){
/* COMPOUND ?:= INSTRUCTION */
if (expression == NULL) return 1;
switch (expression->id) {
case 410/*COMPOUND*/: return 1;
}
return 0;
}/*--*/

int can_assign_to437_from357(T0* expression){
/* COMMENT ?:= INSTRUCTION */
if (expression == NULL) return 1;
switch (expression->id) {
case 437/*COMMENT*/: return 1;
}
return 0;
}/*--*/

int can_assign_to381_from357(T0* expression){
/* ASSIGNMENT ?:= INSTRUCTION */
if (expression == NULL) return 1;
switch (expression->id) {
case 381/*ASSIGNMENT*/: return 1;
}
return 0;
}/*--*/

int can_assign_to682_from357(T0* expression){
/* SEDB ?:= INSTRUCTION */
if (expression == NULL) return 1;
switch (expression->id) {
case 682/*SEDB*/: return 1;
}
return 0;
}/*--*/

int can_assign_to770_from344(T0* expression){
/* RUN_FEATURE_7 ?:= RUN_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 770/*RUN_FEATURE_7*/: return 1;
}
return 0;
}/*--*/

int can_assign_to421_from344(T0* expression){
/* RUN_FEATURE_2 ?:= RUN_FEATURE */
if (expression == NULL) return 1;
switch (expression->id) {
case 421/*RUN_FEATURE_2*/: return 1;
}
return 0;
}/*--*/

int can_assign_to39_from40(T0* expression){
/* NATIVELY_STORED_STRING ?:= ABSTRACT_STRING */
if (expression == NULL) return 1;
switch (expression->id) {
case 7/*STRING*/: return 1;
case 306/*FIXED_STRING*/: return 1;
}
return 0;
}/*--*/

int can_assign_to306_from39(T0* expression){
/* FIXED_STRING ?:= NATIVELY_STORED_STRING */
if (expression == NULL) return 1;
switch (expression->id) {
case 306/*FIXED_STRING*/: return 1;
}
return 0;
}/*--*/

int can_assign_to357_from354(T0* expression){
/* INSTRUCTION ?:= CODE */
if (expression == NULL) return 1;
switch (expression->id) {
case 437/*COMMENT*/: return 1;
case 355/*PROCEDURE_CALL_0*/: return 1;
case 359/*PROCEDURE_CALL_1*/: return 1;
case 360/*PROCEDURE_CALL_N*/: return 1;
case 684/*REQUIRE_ASSERTION*/: return 1;
case 537/*CHECK_COMPOUND*/: return 1;
case 496/*DEBUG_COMPOUND*/: return 1;
case 427/*IFTHEN*/: return 1;
case 413/*IFTHENELSE*/: return 1;
case 371/*WHEN_CLAUSE*/: return 1;
case 376/*OTHER_INSPECT_STATEMENT*/: return 1;
case 498/*MANIFEST_STRING_INSPECT_STATEMENT*/: return 1;
case 443/*ASSERTION_LIST*/: return 1;
case 485/*LOOP_INSTRUCTION*/: return 1;
case 419/*CREATE_INSTRUCTION*/: return 1;
case 482/*C_INLINE*/: return 1;
case 513/*PRECURSOR_INSTRUCTION*/: return 1;
case 381/*ASSIGNMENT*/: return 1;
case 409/*ASSIGNMENT_ATTEMPT*/: return 1;
case 483/*ASSIGNMENT_CALL_ASSIGNER*/: return 1;
case 477/*RETRY_INSTRUCTION*/: return 1;
case 410/*COMPOUND*/: return 1;
case 680/*ENSURE_ASSERTION*/: return 1;
case 442/*CLASS_INVARIANT*/: return 1;
case 428/*NO_INVARIANT_WRAPPER*/: return 1;
case 682/*SEDB*/: return 1;
case 681/*UNUSED_EXPRESSION*/: return 1;
case 683/*RUN_TIME_ERROR_INSTRUCTION*/: return 1;
case 578/*VOID_PROC_CALL*/: return 1;
case 685/*AGENT_INSTRUCTION*/: return 1;
case 426/*RAW_CREATE_INSTRUCTION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to465_from354(T0* expression){
/* COMPOUND_EXPRESSION ?:= CODE */
if (expression == NULL) return 1;
switch (expression->id) {
case 465/*COMPOUND_EXPRESSION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to356_from354(T0* expression){
/* PROCEDURE_CALL ?:= CODE */
if (expression == NULL) return 1;
switch (expression->id) {
case 355/*PROCEDURE_CALL_0*/: return 1;
case 359/*PROCEDURE_CALL_1*/: return 1;
case 360/*PROCEDURE_CALL_N*/: return 1;
}
return 0;
}/*--*/

int can_assign_to410_from354(T0* expression){
/* COMPOUND ?:= CODE */
if (expression == NULL) return 1;
switch (expression->id) {
case 410/*COMPOUND*/: return 1;
}
return 0;
}/*--*/

int can_assign_to363_from354(T0* expression){
/* FUNCTION_CALL ?:= CODE */
if (expression == NULL) return 1;
switch (expression->id) {
case 507/*CALL_PREFIX_NOT*/: return 1;
case 361/*FUNCTION_CALL_0*/: return 1;
case 364/*FUNCTION_CALL_1*/: return 1;
case 366/*FUNCTION_CALL_N*/: return 1;
case 509/*CALL_PREFIX_PLUS*/: return 1;
case 510/*CALL_PREFIX_MINUS*/: return 1;
case 511/*CALL_PREFIX_FREEOP*/: return 1;
case 534/*CALL_INFIX_FREEOP*/: return 1;
case 533/*CALL_INFIX_POWER*/: return 1;
case 529/*CALL_INFIX_TIMES*/: return 1;
case 530/*CALL_INFIX_INT_DIV*/: return 1;
case 531/*CALL_INFIX_INT_REM*/: return 1;
case 532/*CALL_INFIX_DIV*/: return 1;
case 528/*CALL_INFIX_PLUS*/: return 1;
case 389/*CALL_INFIX_MINUS*/: return 1;
case 524/*CALL_INFIX_LE*/: return 1;
case 525/*CALL_INFIX_GE*/: return 1;
case 526/*CALL_INFIX_LT*/: return 1;
case 527/*CALL_INFIX_GT*/: return 1;
case 417/*CALL_INFIX_AND_THEN*/: return 1;
case 523/*CALL_INFIX_AND*/: return 1;
case 520/*CALL_INFIX_OR_ELSE*/: return 1;
case 521/*CALL_INFIX_OR*/: return 1;
case 522/*CALL_INFIX_XOR*/: return 1;
case 519/*CALL_INFIX_IMPLIES*/: return 1;
case 429/*STATIC_CALL_0_C*/: return 1;
}
return 0;
}/*--*/

int can_assign_to419_from354(T0* expression){
/* CREATE_INSTRUCTION ?:= CODE */
if (expression == NULL) return 1;
switch (expression->id) {
case 419/*CREATE_INSTRUCTION*/: return 1;
case 426/*RAW_CREATE_INSTRUCTION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to353_from354(T0* expression){
/* EXPRESSION ?:= CODE */
if (expression == NULL) return 1;
switch (expression->id) {
case 395/*MANIFEST_STRING*/: return 1;
case 538/*OLD_MANIFEST_ARRAY*/: return 1;
case 507/*CALL_PREFIX_NOT*/: return 1;
case 416/*ASSIGNMENT_TEST*/: return 1;
case 493/*OPEN_OPERAND*/: return 1;
case 386/*INTEGER_CONSTANT*/: return 1;
case 494/*REAL_CONSTANT*/: return 1;
case 495/*MANIFEST_GENERIC*/: return 1;
case 361/*FUNCTION_CALL_0*/: return 1;
case 364/*FUNCTION_CALL_1*/: return 1;
case 366/*FUNCTION_CALL_N*/: return 1;
case 509/*CALL_PREFIX_PLUS*/: return 1;
case 510/*CALL_PREFIX_MINUS*/: return 1;
case 511/*CALL_PREFIX_FREEOP*/: return 1;
case 499/*MANIFEST_TUPLE*/: return 1;
case 400/*E_TRUE*/: return 1;
case 471/*E_FALSE*/: return 1;
case 481/*CHARACTER_CONSTANT*/: return 1;
case 500/*PRECURSOR_EXPRESSION*/: return 1;
case 535/*FAKE_TARGET*/: return 1;
case 536/*CREATE_EXPRESSION*/: return 1;
case 435/*ASSERTION*/: return 1;
case 384/*IMPLICIT_CURRENT*/: return 1;
case 484/*LOOP_VARIANT*/: return 1;
case 378/*RESULT*/: return 1;
case 503/*WRITTEN_CURRENT*/: return 1;
case 502/*AGENT_CREATION*/: return 1;
case 472/*EXPRESSION_WITH_COMMENT*/: return 1;
case 411/*E_VOID*/: return 1;
case 473/*IFTHEN_EXP*/: return 1;
case 475/*IFTHENELSE_EXP*/: return 1;
case 512/*E_OLD*/: return 1;
case 534/*CALL_INFIX_FREEOP*/: return 1;
case 533/*CALL_INFIX_POWER*/: return 1;
case 529/*CALL_INFIX_TIMES*/: return 1;
case 530/*CALL_INFIX_INT_DIV*/: return 1;
case 531/*CALL_INFIX_INT_REM*/: return 1;
case 532/*CALL_INFIX_DIV*/: return 1;
case 528/*CALL_INFIX_PLUS*/: return 1;
case 389/*CALL_INFIX_MINUS*/: return 1;
case 412/*BUILT_IN_EQ_NEQ*/: return 1;
case 524/*CALL_INFIX_LE*/: return 1;
case 525/*CALL_INFIX_GE*/: return 1;
case 526/*CALL_INFIX_LT*/: return 1;
case 527/*CALL_INFIX_GT*/: return 1;
case 417/*CALL_INFIX_AND_THEN*/: return 1;
case 523/*CALL_INFIX_AND*/: return 1;
case 520/*CALL_INFIX_OR_ELSE*/: return 1;
case 521/*CALL_INFIX_OR*/: return 1;
case 522/*CALL_INFIX_XOR*/: return 1;
case 519/*CALL_INFIX_IMPLIES*/: return 1;
case 476/*ADDRESS_OF*/: return 1;
case 372/*ARGUMENT_NAME_REF*/: return 1;
case 425/*WRITABLE_ATTRIBUTE_NAME*/: return 1;
case 408/*LOCAL_NAME_REF*/: return 1;
case 547/*NON_VOID_NO_DISPATCH*/: return 1;
case 465/*COMPOUND_EXPRESSION*/: return 1;
case 675/*CREATE_WRITABLE*/: return 1;
case 676/*CLOSED_OPERAND*/: return 1;
case 369/*FAKE_ARGUMENT*/: return 1;
case 667/*NULL_POINTER*/: return 1;
case 580/*VOID_CALL*/: return 1;
case 668/*NO_DISPATCH*/: return 1;
case 672/*DYNAMIC_DISPATCH_TEMPORARY1*/: return 1;
case 671/*DYNAMIC_DISPATCH_TEMPORARY2*/: return 1;
case 673/*DYNAMIC_DISPATCH_TEMPORARY1_ID*/: return 1;
case 670/*INTERNAL_LOCAL2*/: return 1;
case 666/*NATURAL_CONSTANT*/: return 1;
case 544/*IMPLICIT_CAST*/: return 1;
case 677/*AGENT_EXPRESSION*/: return 1;
case 429/*STATIC_CALL_0_C*/: return 1;
case 380/*GENERATOR_GENERATING_TYPE*/: return 1;
case 669/*NATIVE_ARRAY_ITEM*/: return 1;
case 674/*FAKE_TUPLE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to386_from388(T0* expression){
/* INTEGER_CONSTANT ?:= MANIFEST_EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 386/*INTEGER_CONSTANT*/: return 1;
}
return 0;
}/*--*/

int can_assign_to558_from559(T0* expression){
/* PATH_NAME_NOTATION ?:= DIRECTORY_NOTATION */
if (expression == NULL) return 1;
switch (expression->id) {
case 557/*UNIX_DIRECTORY_NOTATION*/: return 1;
case 561/*WINDOWS_DIRECTORY_NOTATION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to562_from559(T0* expression){
/* MACINTOSH_DIRECTORY_NOTATION ?:= DIRECTORY_NOTATION */
if (expression == NULL) return 1;
switch (expression->id) {
case 562/*MACINTOSH_DIRECTORY_NOTATION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to564_from559(T0* expression){
/* OPENVMS_DIRECTORY_NOTATION ?:= DIRECTORY_NOTATION */
if (expression == NULL) return 1;
switch (expression->id) {
case 564/*OPENVMS_DIRECTORY_NOTATION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to561_from559(T0* expression){
/* WINDOWS_DIRECTORY_NOTATION ?:= DIRECTORY_NOTATION */
if (expression == NULL) return 1;
switch (expression->id) {
case 561/*WINDOWS_DIRECTORY_NOTATION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to557_from559(T0* expression){
/* UNIX_DIRECTORY_NOTATION ?:= DIRECTORY_NOTATION */
if (expression == NULL) return 1;
switch (expression->id) {
case 557/*UNIX_DIRECTORY_NOTATION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to563_from559(T0* expression){
/* AMIGA_DIRECTORY_NOTATION ?:= DIRECTORY_NOTATION */
if (expression == NULL) return 1;
switch (expression->id) {
case 563/*AMIGA_DIRECTORY_NOTATION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to565_from559(T0* expression){
/* CYGWIN_DIRECTORY_NOTATION ?:= DIRECTORY_NOTATION */
if (expression == NULL) return 1;
switch (expression->id) {
case 565/*CYGWIN_DIRECTORY_NOTATION*/: return 1;
}
return 0;
}/*--*/

int can_assign_to517_from379(T0* expression){
/* LIKE_ARGUMENT_TYPE_MARK ?:= TYPE_MARK */
if (expression == NULL) return 1;
switch (expression->id) {
case 517/*LIKE_ARGUMENT_TYPE_MARK*/: return 1;
}
return 0;
}/*--*/

int can_assign_to449_from379(T0* expression){
/* REAL_TYPE_MARK ?:= TYPE_MARK */
if (expression == NULL) return 1;
switch (expression->id) {
case 449/*REAL_TYPE_MARK*/: return 1;
}
return 0;
}/*--*/

int can_assign_to480_from379(T0* expression){
/* WEAK_REFERENCE_TYPE_MARK ?:= TYPE_MARK */
if (expression == NULL) return 1;
switch (expression->id) {
case 480/*WEAK_REFERENCE_TYPE_MARK*/: return 1;
}
return 0;
}/*--*/

int can_assign_to418_from379(T0* expression){
/* CLASS_TYPE_MARK ?:= TYPE_MARK */
if (expression == NULL) return 1;
switch (expression->id) {
case 418/*CLASS_TYPE_MARK*/: return 1;
}
return 0;
}/*--*/

int can_assign_to422_from379(T0* expression){
/* INTEGER_TYPE_MARK ?:= TYPE_MARK */
if (expression == NULL) return 1;
switch (expression->id) {
case 422/*INTEGER_TYPE_MARK*/: return 1;
}
return 0;
}/*--*/

int can_assign_to489_from487(T0* expression){
/* NATIVE_C_PLUS_PLUS ?:= NATIVE */
if (expression == NULL) return 1;
switch (expression->id) {
case 489/*NATIVE_C_PLUS_PLUS*/: return 1;
}
return 0;
}/*--*/

int can_assign_to471_from353(T0* expression){
/* E_FALSE ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 471/*E_FALSE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to494_from353(T0* expression){
/* REAL_CONSTANT ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 494/*REAL_CONSTANT*/: return 1;
}
return 0;
}/*--*/

int can_assign_to499_from353(T0* expression){
/* MANIFEST_TUPLE ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 499/*MANIFEST_TUPLE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to544_from353(T0* expression){
/* IMPLICIT_CAST ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 544/*IMPLICIT_CAST*/: return 1;
}
return 0;
}/*--*/

int can_assign_to412_from353(T0* expression){
/* BUILT_IN_EQ_NEQ ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 412/*BUILT_IN_EQ_NEQ*/: return 1;
}
return 0;
}/*--*/

int can_assign_to363_from353(T0* expression){
/* FUNCTION_CALL ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 507/*CALL_PREFIX_NOT*/: return 1;
case 361/*FUNCTION_CALL_0*/: return 1;
case 364/*FUNCTION_CALL_1*/: return 1;
case 366/*FUNCTION_CALL_N*/: return 1;
case 509/*CALL_PREFIX_PLUS*/: return 1;
case 510/*CALL_PREFIX_MINUS*/: return 1;
case 511/*CALL_PREFIX_FREEOP*/: return 1;
case 534/*CALL_INFIX_FREEOP*/: return 1;
case 533/*CALL_INFIX_POWER*/: return 1;
case 529/*CALL_INFIX_TIMES*/: return 1;
case 530/*CALL_INFIX_INT_DIV*/: return 1;
case 531/*CALL_INFIX_INT_REM*/: return 1;
case 532/*CALL_INFIX_DIV*/: return 1;
case 528/*CALL_INFIX_PLUS*/: return 1;
case 389/*CALL_INFIX_MINUS*/: return 1;
case 524/*CALL_INFIX_LE*/: return 1;
case 525/*CALL_INFIX_GE*/: return 1;
case 526/*CALL_INFIX_LT*/: return 1;
case 527/*CALL_INFIX_GT*/: return 1;
case 417/*CALL_INFIX_AND_THEN*/: return 1;
case 523/*CALL_INFIX_AND*/: return 1;
case 520/*CALL_INFIX_OR_ELSE*/: return 1;
case 521/*CALL_INFIX_OR*/: return 1;
case 522/*CALL_INFIX_XOR*/: return 1;
case 519/*CALL_INFIX_IMPLIES*/: return 1;
case 429/*STATIC_CALL_0_C*/: return 1;
}
return 0;
}/*--*/

int can_assign_to547_from353(T0* expression){
/* NON_VOID_NO_DISPATCH ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 547/*NON_VOID_NO_DISPATCH*/: return 1;
}
return 0;
}/*--*/

int can_assign_to493_from353(T0* expression){
/* OPEN_OPERAND ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 493/*OPEN_OPERAND*/: return 1;
}
return 0;
}/*--*/

int can_assign_to481_from353(T0* expression){
/* CHARACTER_CONSTANT ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 481/*CHARACTER_CONSTANT*/: return 1;
}
return 0;
}/*--*/

int can_assign_to408_from353(T0* expression){
/* LOCAL_NAME_REF ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 408/*LOCAL_NAME_REF*/: return 1;
}
return 0;
}/*--*/

int can_assign_to472_from353(T0* expression){
/* EXPRESSION_WITH_COMMENT ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 472/*EXPRESSION_WITH_COMMENT*/: return 1;
}
return 0;
}/*--*/

int can_assign_to535_from353(T0* expression){
/* FAKE_TARGET ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 535/*FAKE_TARGET*/: return 1;
}
return 0;
}/*--*/

int can_assign_to400_from353(T0* expression){
/* E_TRUE ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 400/*E_TRUE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to386_from353(T0* expression){
/* INTEGER_CONSTANT ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 386/*INTEGER_CONSTANT*/: return 1;
}
return 0;
}/*--*/

int can_assign_to401_from353(T0* expression){
/* BOOLEAN_CONSTANT ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 400/*E_TRUE*/: return 1;
case 471/*E_FALSE*/: return 1;
}
return 0;
}/*--*/

int can_assign_to395_from353(T0* expression){
/* MANIFEST_STRING ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 395/*MANIFEST_STRING*/: return 1;
}
return 0;
}/*--*/

int can_assign_to667_from353(T0* expression){
/* NULL_POINTER ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 667/*NULL_POINTER*/: return 1;
}
return 0;
}/*--*/

int can_assign_to365_from353(T0* expression){
/* CALL_1 ?:= EXPRESSION */
if (expression == NULL) return 1;
switch (expression->id) {
case 364/*FUNCTION_CALL_1*/: return 1;
case 534/*CALL_INFIX_FREEOP*/: return 1;
case 533/*CALL_INFIX_POWER*/: return 1;
case 529/*CALL_INFIX_TIMES*/: return 1;
case 530/*CALL_INFIX_INT_DIV*/: return 1;
case 531/*CALL_INFIX_INT_REM*/: return 1;
case 532/*CALL_INFIX_DIV*/: return 1;
case 528/*CALL_INFIX_PLUS*/: return 1;
case 389/*CALL_INFIX_MINUS*/: return 1;
case 524/*CALL_INFIX_LE*/: return 1;
case 525/*CALL_INFIX_GE*/: return 1;
case 526/*CALL_INFIX_LT*/: return 1;
case 527/*CALL_INFIX_GT*/: return 1;
case 417/*CALL_INFIX_AND_THEN*/: return 1;
case 523/*CALL_INFIX_AND*/: return 1;
case 520/*CALL_INFIX_OR_ELSE*/: return 1;
case 521/*CALL_INFIX_OR*/: return 1;
case 522/*CALL_INFIX_XOR*/: return 1;
case 519/*CALL_INFIX_IMPLIES*/: return 1;
}
return 0;
}/*--*/

#ifdef __cplusplus
}
#endif
