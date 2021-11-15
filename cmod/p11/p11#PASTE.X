// This may look like garbage but is actually -*- C -*-
#pragma CMOD separator ◼
#pragma CMOD module PASTE = p11◼PASTE
#pragma CMOD import NARG1 = p11◼NARG1
#pragma CMOD import ID10  = p11◼ID10

#pragma CMOD declaration

#define EXPC(...) __VA_ARGS__
#define EXPB(M, N, ...) EXPC(ID10(N, M)(__VA_ARGS__))
#define EXPA(...) EXPB(MODULE_PREFIX(7CASE_), __VA_ARGS__)
#define PASTE(...) EXPA(NARG1(__VA_ARGS__), __VA_ARGS__)

#define CAT2(_1,_2) _1 ## _2
#define CASE_00()
#define CASE_01(_1) _1
#define CASE_02(_1,_2) CAT2(_1, _2)
#define CASE_03(_1,_2,...) CASE_02(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_04(_1,_2,...) CASE_03(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_05(_1,_2,...) CASE_04(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_06(_1,_2,...) CASE_05(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_07(_1,_2,...) CASE_06(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_08(_1,_2,...) CASE_07(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_09(_1,_2,...) CASE_08(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_10(_1,_2,...) CASE_09(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_11(_1,_2,...) CASE_10(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_12(_1,_2,...) CASE_11(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_13(_1,_2,...) CASE_12(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_14(_1,_2,...) CASE_13(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_15(_1,_2,...) CASE_14(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_16(_1,_2,...) CASE_15(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_17(_1,_2,...) CASE_16(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_18(_1,_2,...) CASE_17(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_19(_1,_2,...) CASE_18(CASE_02(_1, _2), __VA_ARGS__)
#define CASE_20(_1,_2,...) CASE_19(CASE_02(_1, _2), __VA_ARGS__)

#pragma CMOD definition
