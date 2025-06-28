#define FLEX_SCANNER
#define YY_FLEX_MAJOR_VERSION 2
#define YY_FLEX_MINOR_VERSION 5
#include <stdio.h>
#ifdef c_plusplus
#ifndef __cplusplus
#define __cplusplus
#endif
#endif
#ifdef __cplusplus
#include <stdlib.h>
#include <unistd.h>
#define YY_USE_PROTOS
#define YY_USE_CONST
#else
#if __STDC__
#define YY_USE_PROTOS
#define YY_USE_CONST
#endif
#endif
#ifdef __TURBOC__
#pragma warn - rch
#pragma warn - use
#include <io.h>
#include <stdlib.h>
#define YY_USE_CONST
#define YY_USE_PROTOS
#endif
#ifdef YY_USE_CONST
#define yyconst const
#else
#define yyconst
#endif
#ifdef YY_USE_PROTOS
#define YY_PROTO(proto) proto
#else
#define YY_PROTO(proto) ()
#endif
#define YY_NULL 0
#define YY_SC_TO_UI(c) ((unsigned int)(unsigned char)c)
#define BEGIN yy_start = 1 + 2 *
#define YY_START ((yy_start - 1) / 2)
#define YYSTATE YY_START
#define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
#define YY_NEW_FILE yyrestart(yyin)
#define YY_END_OF_BUFFER_CHAR 0
#define YY_BUF_SIZE 16384
typedef struct yy_buffer_state *YY_BUFFER_STATE;
extern int yyleng;
extern FILE *yyin, *yyout;
#define EOB_ACT_CONTINUE_SCAN 0
#define EOB_ACT_END_OF_FILE 1
#define EOB_ACT_LAST_MATCH 2
#define yyless(n)                                     \
	do                                                \
	{                                                 \
		*yy_cp = yy_hold_char;                        \
		YY_RESTORE_YY_MORE_OFFSET                     \
		yy_c_buf_p = yy_cp = yy_bp + n - YY_MORE_ADJ; \
		YY_DO_BEFORE_ACTION;                          \
	} while (0)
#define unput(c) yyunput(c, yytext_ptr)
typedef unsigned int yy_size_t;
struct yy_buffer_state
{
	FILE *yy_input_file;
	char *yy_ch_buf;
	char *yy_buf_pos;
	yy_size_t yy_buf_size;
	int yy_n_chars;
	int yy_is_our_buffer;
	int yy_is_interactive;
	int yy_at_bol;
	int yy_fill_buffer;
	int yy_buffer_status;
#define YY_BUFFER_NEW 0
#define YY_BUFFER_NORMAL 1
#define YY_BUFFER_EOF_PENDING 2
};
static YY_BUFFER_STATE yy_current_buffer = 0;
#define YY_CURRENT_BUFFER yy_current_buffer
static char yy_hold_char;
static int yy_n_chars;
int yyleng;
static char *yy_c_buf_p = (char *)0;
static int yy_init = 1;
static int yy_start = 0;
static int yy_did_buffer_switch_on_eof;
void yyrestart YY_PROTO((FILE * input_file));
void yy_switch_to_buffer YY_PROTO((YY_BUFFER_STATE new_buffer));
void yy_load_buffer_state YY_PROTO((void));
YY_BUFFER_STATE yy_create_buffer YY_PROTO((FILE * file, int size));
void yy_delete_buffer YY_PROTO((YY_BUFFER_STATE b));
void yy_init_buffer YY_PROTO((YY_BUFFER_STATE b, FILE *file));
void yy_flush_buffer YY_PROTO((YY_BUFFER_STATE b));
#define YY_FLUSH_BUFFER yy_flush_buffer(yy_current_buffer)
YY_BUFFER_STATE yy_scan_buffer YY_PROTO((char *base, yy_size_t size));
YY_BUFFER_STATE yy_scan_string YY_PROTO((yyconst char *yy_str));
YY_BUFFER_STATE yy_scan_bytes YY_PROTO((yyconst char *bytes, int len));
static void *yy_flex_alloc YY_PROTO((yy_size_t));
static void *yy_flex_realloc YY_PROTO((void *, yy_size_t));
static void yy_flex_free YY_PROTO((void *));
#define yy_new_buffer yy_create_buffer
#define yy_set_interactive(is_interactive)                           \
	{                                                                \
		if (!yy_current_buffer)                                      \
			yy_current_buffer = yy_create_buffer(yyin, YY_BUF_SIZE); \
		yy_current_buffer->yy_is_interactive = is_interactive;       \
	}
#define yy_set_bol(at_bol)                                           \
	{                                                                \
		if (!yy_current_buffer)                                      \
			yy_current_buffer = yy_create_buffer(yyin, YY_BUF_SIZE); \
		yy_current_buffer->yy_at_bol = at_bol;                       \
	}
#define YY_AT_BOL() (yy_current_buffer->yy_at_bol)
#define yywrap() 1
#define YY_SKIP_YYWRAP
typedef unsigned char YY_CHAR;
FILE *yyin = (FILE *)0, *yyout = (FILE *)0;
typedef int yy_state_type;
extern char *yytext;
#define yytext_ptr yytext
static yy_state_type yy_get_previous_state YY_PROTO((void));
static yy_state_type yy_try_NUL_trans YY_PROTO((yy_state_type current_state));
static int yy_get_next_buffer YY_PROTO((void));
static void yy_fatal_error YY_PROTO((yyconst char msg[]));
#define YY_DO_BEFORE_ACTION        \
	yytext_ptr = yy_bp;            \
	yyleng = (int)(yy_cp - yy_bp); \
	yy_hold_char = *yy_cp;         \
	*yy_cp = '\0';                 \
	yy_c_buf_p = yy_cp;
#define YY_NUM_RULES 17
#define YY_END_OF_BUFFER 18
static yyconst short int yy_accept[69] =
	{0,
	 0, 0, 18, 16, 14, 15, 16, 16, 13, 16,
	 7, 8, 6, 6, 12, 6, 3, 11, 6, 6,
	 6, 2, 2, 2, 2, 2, 2, 2, 2, 9,
	 16, 10, 6, 0, 5, 0, 0, 3, 0, 0,
	 2, 2, 2, 2, 2, 2, 1, 2, 2, 2,
	 5, 4, 3, 0, 3, 2, 2, 2, 2, 2,
	 2, 2, 2, 2, 2, 2, 2, 0};
static yyconst int yy_ec[256] =
	{0,
	 1, 1, 1, 1, 1, 1, 1, 1, 2, 3,
	 1, 1, 2, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 2, 4, 5, 1, 1, 1, 6, 7, 8,
	 9, 10, 11, 12, 13, 14, 15, 16, 16, 16,
	 16, 16, 16, 16, 16, 16, 16, 1, 17, 18,
	 19, 20, 1, 1, 21, 21, 21, 21, 22, 21,
	 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
	 1, 23, 1, 1, 21, 1, 24, 25, 26, 27,
	 28, 29, 21, 30, 31, 21, 21, 32, 21, 33,
	 34, 21, 21, 35, 36, 37, 38, 21, 39, 21,
	 21, 21, 40, 41, 42, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1};
static yyconst int yy_meta[43] =
	{0,
	 1, 1, 2, 1, 1, 1, 3, 1, 1, 1,
	 1, 1, 1, 1, 1, 4, 1, 1, 1, 1,
	 4, 4, 1, 4, 4, 4, 4, 4, 4, 4,
	 4, 4, 4, 4, 4, 4, 4, 4, 4, 1,
	 1, 1};
static yyconst short int yy_base[72] =
	{0,
	 0, 0, 113, 114, 114, 114, 93, 38, 105, 0,
	 114, 114, 114, 99, 114, 93, 30, 114, 89, 88,
	 87, 0, 75, 70, 71, 13, 20, 74, 71, 114,
	 59, 114, 114, 43, 114, 45, 92, 41, 82, 43,
	 0, 73, 58, 59, 60, 58, 0, 55, 54, 59,
	 55, 114, 48, 73, 72, 52, 60, 52, 53, 37,
	 42, 41, 35, 36, 39, 37, 29, 114, 78, 82,
	 47};
static yyconst short int yy_def[72] =
	{0,
	 68, 1, 68, 68, 68, 68, 68, 69, 68, 70,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 71, 71, 71, 71, 71, 71, 71, 71, 68,
	 68, 68, 68, 69, 68, 69, 68, 68, 68, 68,
	 71, 71, 71, 71, 71, 71, 71, 71, 71, 71,
	 69, 68, 68, 68, 68, 71, 71, 71, 71, 71,
	 71, 71, 71, 71, 71, 71, 71, 0, 68, 68,
	 68};
static yyconst short int yy_nxt[157] =
	{0,
	 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
	 14, 15, 16, 4, 13, 17, 18, 19, 20, 21,
	 22, 22, 4, 22, 22, 23, 24, 25, 26, 22,
	 27, 22, 22, 22, 28, 22, 22, 22, 29, 30,
	 31, 32, 35, 39, 45, 38, 46, 35, 47, 51,
	 41, 40, 48, 54, 39, 54, 38, 40, 55, 35,
	 36, 47, 40, 53, 47, 36, 47, 36, 40, 40,
	 67, 47, 66, 65, 64, 40, 63, 36, 34, 47,
	 34, 34, 37, 37, 62, 37, 47, 55, 55, 61,
	 60, 47, 47, 59, 58, 57, 56, 53, 52, 33,
	 50, 49, 44, 43, 42, 33, 33, 33, 38, 33,
	 33, 33, 68, 3, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68};
static yyconst short int yy_chk[157] =
	{0,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	 1, 1, 8, 17, 26, 17, 26, 34, 27, 36,
	 71, 17, 27, 40, 38, 40, 38, 17, 40, 51,
	 8, 67, 38, 53, 66, 34, 65, 36, 38, 53,
	 64, 63, 62, 61, 60, 53, 59, 51, 69, 58,
	 69, 69, 70, 70, 57, 70, 56, 55, 54, 50,
	 49, 48, 46, 45, 44, 43, 42, 39, 37, 31,
	 29, 28, 25, 24, 23, 21, 20, 19, 16, 14,
	 9, 7, 3, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68, 68, 68, 68, 68,
	 68, 68, 68, 68, 68, 68};
static yy_state_type yy_last_accepting_state;
static char *yy_last_accepting_cpos;
#define REJECT reject_used_but_not_detected
#define yymore() yymore_used_but_not_detected
#define YY_MORE_ADJ 0
#define YY_RESTORE_YY_MORE_OFFSET
char *yytext;
#define INITIAL 0
#include <stdio.h>
int yylex()
{
	register yy_state_type yy_current_state;
	register char *yy_cp, *yy_bp;
	register int yy_act;
	if (yy_init)
	{
		yy_init = 0;
		if (!yy_start)
			yy_start = 1;
		if (!yyin)
			yyin = stdin;
		if (!yyout)
			yyout = stdout;
		if (!yy_current_buffer)
			yy_current_buffer =
				yy_create_buffer(yyin, YY_BUF_SIZE);
		yy_load_buffer_state();
	}
	while (1)
	{
		yy_cp = yy_c_buf_p;
		*yy_cp = yy_hold_char;
		yy_bp = yy_cp;
		yy_current_state = yy_start;
	yy_match:
		do
		{
			register YY_CHAR yy_c = yy_ec[YY_SC_TO_UI(*yy_cp)];
			if (yy_accept[yy_current_state])
			{
				yy_last_accepting_state = yy_current_state;
				yy_last_accepting_cpos = yy_cp;
			}
			while (yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state)
			{
				yy_current_state = (int)yy_def[yy_current_state];
				if (yy_current_state >= 69)
					yy_c = yy_meta[(unsigned int)yy_c];
			}
			yy_current_state = yy_nxt[yy_base[yy_current_state] + (unsigned int)yy_c];
			++yy_cp;
		} while (yy_base[yy_current_state] != 114);
	yy_find_action:
		yy_act = yy_accept[yy_current_state];
		if (yy_act == 0)
		{
			yy_cp = yy_last_accepting_cpos;
			yy_current_state = yy_last_accepting_state;
			yy_act = yy_accept[yy_current_state];
		}
		YY_DO_BEFORE_ACTION;
	do_action:
		switch (yy_act)
		{
		case 1:
		{
			printf("%s -> KEYWORD\n", yytext);
		}
		break;
		case 2:
		{
			printf("%s -> IDENTIFIER\n", yytext);
		}
		break;
		case 3:
		{
			printf("%s -> NUMBER\n", yytext);
		}
		break;
		case 4:
		{
			printf("%s -> CHAR_CONSTANT\n", yytext);
		}
		break;
		case 5:
		{
			printf("%s -> STRING_LITERAL\n", yytext);
		}
		break;
		case 6:
		{
			printf("%s -> OPERATOR\n", yytext);
		}
		break;
		case 7:
		{
			printf("%s -> LPAREN\n", yytext);
		}
		break;
		case 8:
		{
			printf("%s -> RPAREN\n", yytext);
		}
		break;
		case 9:
		{
			printf("%s -> LBRACE\n", yytext);
		}
		break;
		case 10:
		{
			printf("%s -> RBRACE\n", yytext);
		}
		break;
		case 11:
		{
			printf("%s -> SEMICOLON\n", yytext);
		}
		break;
		case 12:
		{
			printf("%s -> COMMA\n", yytext);
		}
		break;
		case 13:
		{
			printf("%s -> ADDRESS_OP\n", yytext);
		}
		break;
		case 14:
			break;
		case 15:
			break;
		case 16:
		{
			printf("%s -> UNKNOWN\n", yytext);
		}
		break;
		case 17:
			fwrite(yytext, yyleng, 1, yyout);
			break;
		case YY_STATE_EOF(INITIAL):
			return YY_NULL;
		case YY_END_OF_BUFFER:
		{
			int yy_amount_of_matched_text = (int)(yy_cp - yytext_ptr) - 1;
			*yy_cp = yy_hold_char;
			YY_RESTORE_YY_MORE_OFFSET
			if (yy_current_buffer->yy_buffer_status == YY_BUFFER_NEW)
			{
				yy_n_chars = yy_current_buffer->yy_n_chars;
				yy_current_buffer->yy_input_file = yyin;
				yy_current_buffer->yy_buffer_status = YY_BUFFER_NORMAL;
			}
			if (yy_c_buf_p <= &yy_current_buffer->yy_ch_buf[yy_n_chars])
			{
				yy_state_type yy_next_state;
				yy_c_buf_p = yytext_ptr + yy_amount_of_matched_text;
				yy_current_state = yy_get_previous_state();
				yy_next_state = yy_try_NUL_trans(yy_current_state);
				yy_bp = yytext_ptr + YY_MORE_ADJ;
				if (yy_next_state)
				{
					yy_cp = ++yy_c_buf_p;
					yy_current_state = yy_next_state;
					goto yy_match;
				}
				else
				{
					yy_cp = yy_c_buf_p;
					goto yy_find_action;
				}
			}
			else
				switch (yy_get_next_buffer())
				{
				case EOB_ACT_END_OF_FILE:
				{
					yy_did_buffer_switch_on_eof = 0;
					if (yywrap())
					{
						yy_c_buf_p = yytext_ptr + YY_MORE_ADJ;
						yy_act = YY_STATE_EOF(YY_START);
						goto do_action;
					}
					else
					{
						if (!yy_did_buffer_switch_on_eof)
							YY_NEW_FILE;
					}
					break;
				}
				case EOB_ACT_CONTINUE_SCAN:
					yy_c_buf_p =
						yytext_ptr + yy_amount_of_matched_text;
					yy_current_state = yy_get_previous_state();
					yy_cp = yy_c_buf_p;
					yy_bp = yytext_ptr + YY_MORE_ADJ;
					goto yy_match;
				case EOB_ACT_LAST_MATCH:
					yy_c_buf_p =
						&yy_current_buffer->yy_ch_buf[yy_n_chars];
					yy_current_state = yy_get_previous_state();
					yy_cp = yy_c_buf_p;
					yy_bp = yytext_ptr + YY_MORE_ADJ;
					goto yy_find_action;
				}
			break;
		}
		default:
			yy_fatal_error(
				"fatal flex scanner internal error--no action found");
		}
	}
}
int main()
{
	yylex();
	return 0;
}