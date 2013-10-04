#ifdef __cplusplus
extern "C" {
#endif
/*
ANSI C code generated by 
Liberty Eiffel The GNU Eiffel Compiler, Eiffel tools and libraries
    release 2013.10 (Charles Adler, Jr.)

Copyright (C), 2011-2013 - C.ADRIAN, P.REDAELLI, R.MACK
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

/*NATIVE_ARRAY[IFTHEN]*/T1390 r1390realloc(T1390 C,T2 a1,T2 a2){
T1390 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1390copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[IFTHEN]*/void r1390copy_from(T1390 C,T1390 a1,T2 a2){
/*RF3:copy_slice_from*/r1390copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[IFTHEN]*/void r1390clear(T1390 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[IFTHEN]*/void r1390clear_all(T1390 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[IFTHEN]*/void r1390remove(T1390 C,T2 a1,T2 a2){
T2 _i=0;
_i=a1;
while(1){
/*until*/if((_i)==(a2)) break;
/*RF7:put*/(C)[_i]=(/*RF8:item*/(C)[/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/]/*:RF8*/);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[IFTHEN]*/void r1390remove_first(T1390 C,T2 a1){
T2 _i=0;
while(1){
/*until*/if((_i)==(a1)) break;
/*RF7:put*/(C)[_i]=(/*RF8:item*/(C)[/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/]/*:RF8*/);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[IFTHEN]*/void r1390copy_slice_from(T1390 C,T1390 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[WHEN_ITEM]*/T1391 r1391realloc(T1391 C,T2 a1,T2 a2){
T1391 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1391copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[WHEN_ITEM]*/void r1391copy_from(T1391 C,T1391 a1,T2 a2){
/*RF3:copy_slice_from*/r1391copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[WHEN_ITEM]*/void r1391clear(T1391 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[WHEN_ITEM]*/void r1391clear_all(T1391 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[WHEN_ITEM]*/void r1391copy_slice_from(T1391 C,T1391 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[INSTRUCTION]*/T1392 r1392realloc(T1392 C,T2 a1,T2 a2){
T1392 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1392copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[INSTRUCTION]*/void r1392copy_from(T1392 C,T1392 a1,T2 a2){
/*RF3:copy_slice_from*/r1392copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[INSTRUCTION]*/void r1392clear(T1392 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INSTRUCTION]*/void r1392clear_all(T1392 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INSTRUCTION]*/void r1392remove_first(T1392 C,T2 a1){
T2 _i=0;
while(1){
/*until*/if((_i)==(a1)) break;
/*RF7:put*/(C)[_i]=(/*RF8:item*/(C)[/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/]/*:RF8*/);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INSTRUCTION]*/void r1392copy_slice_from(T1392 C,T1392 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[OPEN_OPERAND]*/T1393 r1393realloc(T1393 C,T2 a1,T2 a2){
T1393 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1393copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[OPEN_OPERAND]*/void r1393copy_from(T1393 C,T1393 a1,T2 a2){
/*RF3:copy_slice_from*/r1393copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[OPEN_OPERAND]*/void r1393clear(T1393 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[OPEN_OPERAND]*/void r1393clear_all(T1393 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[OPEN_OPERAND]*/void r1393copy_slice_from(T1393 C,T1393 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[CLOSED_OPERAND]*/T1395 r1395realloc(T1395 C,T2 a1,T2 a2){
T1395 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1395copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[CLOSED_OPERAND]*/void r1395copy_from(T1395 C,T1395 a1,T2 a2){
/*RF3:copy_slice_from*/r1395copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[CLOSED_OPERAND]*/void r1395clear(T1395 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[CLOSED_OPERAND]*/void r1395clear_all(T1395 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[CLOSED_OPERAND]*/void r1395copy_slice_from(T1395 C,T1395 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[CLIENT_LIST,FEATURE_NAME]]*/void r1398clear_all(T1398 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FEATURE_CLAUSE]*/T1399 r1399realloc(T1399 C,T2 a1,T2 a2){
T1399 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1399copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[FEATURE_CLAUSE]*/void r1399copy_from(T1399 C,T1399 a1,T2 a2){
/*RF3:copy_slice_from*/r1399copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[FEATURE_CLAUSE]*/void r1399clear(T1399 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FEATURE_CLAUSE]*/void r1399clear_all(T1399 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FEATURE_CLAUSE]*/void r1399copy_slice_from(T1399 C,T1399 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[CREATION_CLAUSE]*/T1400 r1400realloc(T1400 C,T2 a1,T2 a2){
T1400 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1400copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[CREATION_CLAUSE]*/void r1400copy_from(T1400 C,T1400 a1,T2 a2){
/*RF3:copy_slice_from*/r1400copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[CREATION_CLAUSE]*/void r1400clear(T1400 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[CREATION_CLAUSE]*/void r1400clear_all(T1400 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[CREATION_CLAUSE]*/void r1400copy_slice_from(T1400 C,T1400 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[INDEX_CLAUSE]*/T1401 r1401realloc(T1401 C,T2 a1,T2 a2){
T1401 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1401copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[INDEX_CLAUSE]*/void r1401copy_from(T1401 C,T1401 a1,T2 a2){
/*RF3:copy_slice_from*/r1401copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[INDEX_CLAUSE]*/void r1401set_slice_with(T1401 C,T0* a1,T2 a2,T2 a3){
T2 _i=0;
_i=a2;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a3)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(a1);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INDEX_CLAUSE]*/void r1401clear_all(T1401 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INDEX_CLAUSE]*/void r1401set_all_with(T1401 C,T0* a1,T2 a2){
/*RF3:set_slice_with*/r1401set_slice_with(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[INDEX_CLAUSE]*/void r1401copy_slice_from(T1401 C,T1401 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[WEAK_REFERENCE[ANY_HASHED_BIJECTIVE_DICTIONARY_NODE],STRING]]*/void r1402clear_all(T1402 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_2]*/T1405 r1405realloc(T1405 C,T2 a1,T2 a2){
T1405 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1405copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_2]*/void r1405copy_from(T1405 C,T1405 a1,T2 a2){
/*RF3:copy_slice_from*/r1405copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_2]*/void r1405clear(T1405 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_2]*/void r1405set_slice_with(T1405 C,T0* a1,T2 a2,T2 a3){
T2 _i=0;
_i=a2;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a3)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(a1);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_2]*/void r1405clear_all(T1405 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_2]*/void r1405set_all_with(T1405 C,T0* a1,T2 a2){
/*RF3:set_slice_with*/r1405set_slice_with(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_2]*/void r1405copy_slice_from(T1405 C,T1405 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_SET_NODE[GRAPH_NODE]]*/void r1406clear_all(T1406 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AVL_SET_NODE[LIVE_TYPE]]*/T1409 r1409realloc(T1409 C,T2 a1,T2 a2){
T1409 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1409copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[AVL_SET_NODE[LIVE_TYPE]]*/void r1409copy_from(T1409 C,T1409 a1,T2 a2){
/*RF3:copy_slice_from*/r1409copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[AVL_SET_NODE[LIVE_TYPE]]*/void r1409clear(T1409 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AVL_SET_NODE[LIVE_TYPE]]*/void r1409clear_all(T1409 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AVL_SET_NODE[LIVE_TYPE]]*/void r1409copy_slice_from(T1409 C,T1409 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[RECYCLING_POOL[AVL_TREE_NODE_ANY],FIXED_STRING]]*/void r1411clear_all(T1411 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RENAME_PAIR]*/T1417 r1417realloc(T1417 C,T2 a1,T2 a2){
T1417 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1417copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[RENAME_PAIR]*/void r1417copy_from(T1417 C,T1417 a1,T2 a2){
/*RF3:copy_slice_from*/r1417copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[RENAME_PAIR]*/void r1417clear(T1417 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RENAME_PAIR]*/void r1417clear_all(T1417 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RENAME_PAIR]*/void r1417copy_slice_from(T1417 C,T1417 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[EXPRESSION,TYPE]]*/void r1420clear_all(T1420 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[PROCESS_POSIX,INTEGER_32]]*/void r1427clear_all(T1427 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[PROCESS_WIN32,INTEGER_32]]*/void r1430clear_all(T1430 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[LINKED_LIST[TUPLE[CHARACTER,INTEGER_32]]]*/void r1432clear_all(T1432 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[WEAK_REFERENCE[ANY_LINKED_LIST_NODE],STRING]]*/void r1442clear_all(T1442 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AVL_DICTIONARY_NODE[INTEGER_32,INTEGER_32]]*/T1443 r1443realloc(T1443 C,T2 a1,T2 a2){
T1443 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1443copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[AVL_DICTIONARY_NODE[INTEGER_32,INTEGER_32]]*/void r1443copy_from(T1443 C,T1443 a1,T2 a2){
/*RF3:copy_slice_from*/r1443copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[AVL_DICTIONARY_NODE[INTEGER_32,INTEGER_32]]*/void r1443clear(T1443 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AVL_DICTIONARY_NODE[INTEGER_32,INTEGER_32]]*/void r1443clear_all(T1443 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AVL_DICTIONARY_NODE[INTEGER_32,INTEGER_32]]*/void r1443copy_slice_from(T1443 C,T1443 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[AGENT_CREATION]*/T1466 r1466realloc(T1466 C,T2 a1,T2 a2){
T1466 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1466copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[AGENT_CREATION]*/T2 r1466fast_index_of(T1466 C,T0* a1,T2 a2,T2 a3){
/*[INTERNAL_C_LOCAL list*/
T6 tmp0;
/*INTERNAL_C_LOCAL list]*/
T2 R=0;
R=a2;
while(1){
tmp0/*or else*/=((T6)(/*RF8:>*/((int32_t)(R))>(a3)/*:RF8*/));
if(tmp0/*or else*/){
}
else{
tmp0/*or else*/=((T6)((a1)==((void*)(/*RF8:item*/(C)[R]/*:RF8*/))));
}
/*until*/if(tmp0/*or else*/) break;
R=/*RF8:+*/((int32_t)(R))+(INT32_C(1))/*:RF8*/;
}
return R;
}/*--*/

/*NATIVE_ARRAY[AGENT_CREATION]*/void r1466copy_from(T1466 C,T1466 a1,T2 a2){
/*RF3:copy_slice_from*/r1466copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[AGENT_CREATION]*/void r1466clear(T1466 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AGENT_CREATION]*/void r1466clear_all(T1466 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AGENT_CREATION]*/void r1466copy_slice_from(T1466 C,T1466 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[TUPLE[TYPE,TYPE],TYPE]]*/void r1476clear_all(T1476 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[TYPE,TYPE]]*/void r1480clear_all(T1480 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[HASHED_SET_NODE[NATIVE_PLUG_IN]]*/void r1482clear_all(T1482 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[DICTIONARY[PLUGIN,STRING],STRING]]*/void r1487clear_all(T1487 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[PLUGIN,STRING]]*/void r1490clear_all(T1490 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FORMAL_ARG_LIST]*/T1494 r1494realloc(T1494 C,T2 a1,T2 a2){
T1494 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1494copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[FORMAL_ARG_LIST]*/void r1494copy_from(T1494 C,T1494 a1,T2 a2){
/*RF3:copy_slice_from*/r1494copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[FORMAL_ARG_LIST]*/void r1494clear(T1494 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FORMAL_ARG_LIST]*/void r1494clear_all(T1494 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FORMAL_ARG_LIST]*/void r1494copy_slice_from(T1494 C,T1494 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[E_OLD]]*/T1495 r1495realloc(T1495 C,T2 a1,T2 a2){
T1495 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1495copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[E_OLD]]*/void r1495copy_from(T1495 C,T1495 a1,T2 a2){
/*RF3:copy_slice_from*/r1495copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[E_OLD]]*/void r1495clear(T1495 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[E_OLD]]*/void r1495clear_all(T1495 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[E_OLD]]*/void r1495copy_slice_from(T1495 C,T1495 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[E_OLD]*/T1496 r1496realloc(T1496 C,T2 a1,T2 a2){
T1496 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1496copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[E_OLD]*/void r1496copy_from(T1496 C,T1496 a1,T2 a2){
/*RF3:copy_slice_from*/r1496copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[E_OLD]*/void r1496clear(T1496 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[E_OLD]*/void r1496clear_all(T1496 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[E_OLD]*/void r1496copy_slice_from(T1496 C,T1496 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_SET_NODE[FEATURE_STAMP]]*/void r1497clear_all(T1497 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[ADDRESS_OF]*/T1500 r1500realloc(T1500 C,T2 a1,T2 a2){
T1500 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1500copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[ADDRESS_OF]*/void r1500copy_from(T1500 C,T1500 a1,T2 a2){
/*RF3:copy_slice_from*/r1500copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[ADDRESS_OF]*/void r1500clear(T1500 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[ADDRESS_OF]*/void r1500clear_all(T1500 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[ADDRESS_OF]*/void r1500copy_slice_from(T1500 C,T1500 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[INLINE_MEMO]*/T1501 r1501realloc(T1501 C,T2 a1,T2 a2){
T1501 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1501copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[INLINE_MEMO]*/void r1501copy_from(T1501 C,T1501 a1,T2 a2){
/*RF3:copy_slice_from*/r1501copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[INLINE_MEMO]*/void r1501clear(T1501 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INLINE_MEMO]*/void r1501clear_all(T1501 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INLINE_MEMO]*/void r1501copy_slice_from(T1501 C,T1501 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[POINTER]*/void r1502clear_all(T1502 C,T2 a1){
T8 _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AVL_SET_NODE[POSITION]]*/void r1503clear(T1503 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[AVL_SET_NODE[POSITION]]*/void r1503clear_all(T1503 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[CODE_CONTEXT]*/T1538 r1538realloc(T1538 C,T2 a1,T2 a2){
T1538 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1538copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[CODE_CONTEXT]*/void r1538copy_from(T1538 C,T1538 a1,T2 a2){
/*RF3:copy_slice_from*/r1538copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[CODE_CONTEXT]*/void r1538clear(T1538 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[CODE_CONTEXT]*/void r1538clear_all(T1538 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[CODE_CONTEXT]*/void r1538copy_slice_from(T1538 C,T1538 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[CODE_CONTEXT]]*/T1539 r1539realloc(T1539 C,T2 a1,T2 a2){
T1539 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1539copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[CODE_CONTEXT]]*/void r1539copy_from(T1539 C,T1539 a1,T2 a2){
/*RF3:copy_slice_from*/r1539copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[CODE_CONTEXT]]*/void r1539move(T1539 C,T2 a1,T2 a2,T2 a3){
T2 _i=0;
if((a3)==(INT8_C(0))){
}
else{
if(/*RF8:<*/((int32_t)(a3))<(INT32_C(0))/*:RF8*/){
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[/*RF8:+*/((int32_t)(_i))+(a3)/*:RF8*/]=(/*RF8:item*/(C)[_i]/*:RF8*/);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}
else{
_i=a2;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(a1)/*:RF8*/) break;
/*RF7:put*/(C)[/*RF8:+*/((int32_t)(_i))+(a3)/*:RF8*/]=(/*RF8:item*/(C)[_i]/*:RF8*/);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}
}
}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[CODE_CONTEXT]]*/void r1539clear(T1539 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[CODE_CONTEXT]]*/void r1539set_slice_with(T1539 C,T0* a1,T2 a2,T2 a3){
T2 _i=0;
_i=a2;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a3)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(a1);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[CODE_CONTEXT]]*/void r1539clear_all(T1539 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[CODE_CONTEXT]]*/void r1539set_all_with(T1539 C,T0* a1,T2 a2){
/*RF3:set_slice_with*/r1539set_slice_with(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[FAST_ARRAY[CODE_CONTEXT]]*/void r1539copy_slice_from(T1539 C,T1539 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_6]*/T1540 r1540realloc(T1540 C,T2 a1,T2 a2){
T1540 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1540copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_6]*/void r1540copy_from(T1540 C,T1540 a1,T2 a2){
/*RF3:copy_slice_from*/r1540copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_6]*/void r1540clear(T1540 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_6]*/void r1540clear_all(T1540 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_6]*/void r1540copy_slice_from(T1540 C,T1540 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[AGENT_ARGS,STRING]]*/void r1542clear_all(T1542 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_5]*/T1544 r1544realloc(T1544 C,T2 a1,T2 a2){
T1544 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1544copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_5]*/void r1544copy_from(T1544 C,T1544 a1,T2 a2){
/*RF3:copy_slice_from*/r1544copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_5]*/void r1544clear(T1544 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_5]*/void r1544clear_all(T1544 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[RUN_FEATURE_5]*/void r1544copy_slice_from(T1544 C,T1544 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[INTERNAL_C_LOCAL]*/T1545 r1545realloc(T1545 C,T2 a1,T2 a2){
T1545 R=(void*)0;
R=/*RF8:calloc*/se_calloc(a2,sizeof(T0*))/*:RF8*/;
/*RF3:copy_from*/r1545copy_from(R,C,/*RF8:-*/((int32_t)(a1))-(INT32_C(1))/*:RF8*/);
/*:RF3*/return R;
}/*--*/

/*NATIVE_ARRAY[INTERNAL_C_LOCAL]*/void r1545copy_from(T1545 C,T1545 a1,T2 a2){
/*RF3:copy_slice_from*/r1545copy_slice_from(C,a1,INT32_C(0),a2);
/*:RF3*/}/*--*/

/*NATIVE_ARRAY[INTERNAL_C_LOCAL]*/void r1545clear(T1545 C,T2 a1,T2 a2){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:>*/((int32_t)(_i))>(a2)/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:+*/((int32_t)(_i))+(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INTERNAL_C_LOCAL]*/void r1545clear_all(T1545 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

/*NATIVE_ARRAY[INTERNAL_C_LOCAL]*/void r1545copy_slice_from(T1545 C,T1545 a1,T2 a2,T2 a3){
/*RF7:slice_copy*/{/*slice_copy*/
int a3tmp=a2;
memcpy((C)+(INT32_C(0)),(a1)+a3tmp,((a3)-a3tmp+1)*sizeof(T0*));}
/*:RF7*/}/*--*/

/*NATIVE_ARRAY[HASHED_DICTIONARY_NODE[TAGGED_INTEGER,INTEGER_32]]*/void r1565clear_all(T1565 C,T2 a1){
T0* _v=(void*)0;
T2 _i=0;
_i=a1;
while(1){
/*until*/if(/*RF8:<*/((int32_t)(_i))<(INT32_C(0))/*:RF8*/) break;
/*RF7:put*/(C)[_i]=(_v);
/*:RF7*/_i=/*RF8:-*/((int32_t)(_i))-(INT32_C(1))/*:RF8*/;
}
}/*--*/

#ifdef __cplusplus
}
#endif
