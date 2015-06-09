--an aggregated header of all tcod includes (gotten by doing: 'gcc -E -x c libtcod.h -o output.h' )
-- then replacing all # with empty lines, commenting typedef uint8 bool, removing system specific lines and removing dllimport directive

local header=[[

typedef unsigned char uint8;
typedef char int8;
typedef unsigned short uint16;
typedef short int16;
typedef unsigned int uint32;
typedef int int32;

typedef long intptr;
typedef unsigned long uintptr;

//typedef uint8 bool;

 char *TCOD_strdup(const char *s);
 int TCOD_strcasecmp(const char *s1, const char *s2);
 int TCOD_strncasecmp(const char *s1, const char *s2, size_t n);


char *strcasestr (const char *haystack, const char *needle);



typedef void *TCOD_list_t;

 TCOD_list_t TCOD_list_new();
 TCOD_list_t TCOD_list_allocate(int nb_elements);
 TCOD_list_t TCOD_list_duplicate(TCOD_list_t l);
 void TCOD_list_delete(TCOD_list_t l);
 void TCOD_list_push(TCOD_list_t l, const void * elt);
 void * TCOD_list_pop(TCOD_list_t l);
 void * TCOD_list_peek(TCOD_list_t l);
 void TCOD_list_add_all(TCOD_list_t l, TCOD_list_t l2);
 void * TCOD_list_get(TCOD_list_t l,int idx);
 void TCOD_list_set(TCOD_list_t l,const void *elt, int idx);
 void ** TCOD_list_begin(TCOD_list_t l);
 void ** TCOD_list_end(TCOD_list_t l);
 void TCOD_list_reverse(TCOD_list_t l);
 void **TCOD_list_remove_iterator(TCOD_list_t l, void **elt);
 void TCOD_list_remove(TCOD_list_t l, const void * elt);
 void **TCOD_list_remove_iterator_fast(TCOD_list_t l, void **elt);
 void TCOD_list_remove_fast(TCOD_list_t l, const void * elt);
 bool TCOD_list_contains(TCOD_list_t l,const void * elt);
 void TCOD_list_clear(TCOD_list_t l);
 void TCOD_list_clear_and_delete(TCOD_list_t l);
 int TCOD_list_size(TCOD_list_t l);
 void ** TCOD_list_insert_before(TCOD_list_t l,const void *elt,int before);
 bool TCOD_list_is_empty(TCOD_list_t l);



typedef struct {
 uint8 r,g,b;
} TCOD_color_t;


 TCOD_color_t TCOD_color_RGB(uint8 r, uint8 g, uint8 b);
 TCOD_color_t TCOD_color_HSV(float h, float s, float v);

 bool TCOD_color_equals (TCOD_color_t c1, TCOD_color_t c2);
 TCOD_color_t TCOD_color_add (TCOD_color_t c1, TCOD_color_t c2);
 TCOD_color_t TCOD_color_subtract (TCOD_color_t c1, TCOD_color_t c2);
 TCOD_color_t TCOD_color_multiply (TCOD_color_t c1, TCOD_color_t c2);
 TCOD_color_t TCOD_color_multiply_scalar (TCOD_color_t c1, float value);
 TCOD_color_t TCOD_color_lerp (TCOD_color_t c1, TCOD_color_t c2, float coef);

 void TCOD_color_set_HSV (TCOD_color_t *c,float h, float s, float v);
 void TCOD_color_get_HSV (TCOD_color_t c,float * h, float * s, float * v);
 float TCOD_color_get_hue (TCOD_color_t c);
 void TCOD_color_set_hue (TCOD_color_t *c, float h);
 float TCOD_color_get_saturation (TCOD_color_t c);
 void TCOD_color_set_saturation (TCOD_color_t *c, float s);
 float TCOD_color_get_value (TCOD_color_t c);
 void TCOD_color_set_value (TCOD_color_t *c, float v);
 void TCOD_color_shift_hue (TCOD_color_t *c, float hshift);
 void TCOD_color_scale_HSV (TCOD_color_t *c, float scoef, float vcoef);

 void TCOD_color_gen_map(TCOD_color_t *map, int nb_key, TCOD_color_t const *key_color, int const *key_index);


enum {
 TCOD_COLOR_RED,
 TCOD_COLOR_FLAME,
 TCOD_COLOR_ORANGE,
 TCOD_COLOR_AMBER,
 TCOD_COLOR_YELLOW,
 TCOD_COLOR_LIME,
 TCOD_COLOR_CHARTREUSE,
 TCOD_COLOR_GREEN,
 TCOD_COLOR_SEA,
 TCOD_COLOR_TURQUOISE,
 TCOD_COLOR_CYAN,
 TCOD_COLOR_SKY,
 TCOD_COLOR_AZURE,
 TCOD_COLOR_BLUE,
 TCOD_COLOR_HAN,
 TCOD_COLOR_VIOLET,
 TCOD_COLOR_PURPLE,
 TCOD_COLOR_FUCHSIA,
 TCOD_COLOR_MAGENTA,
 TCOD_COLOR_PINK,
 TCOD_COLOR_CRIMSON,
 TCOD_COLOR_NB
};


enum {
 TCOD_COLOR_DESATURATED,
 TCOD_COLOR_LIGHTEST,
 TCOD_COLOR_LIGHTER,
 TCOD_COLOR_LIGHT,
 TCOD_COLOR_NORMAL,
 TCOD_COLOR_DARK,
 TCOD_COLOR_DARKER,
 TCOD_COLOR_DARKEST,
 TCOD_COLOR_LEVELS
};


extern const TCOD_color_t TCOD_colors[TCOD_COLOR_NB][TCOD_COLOR_LEVELS];


extern const TCOD_color_t TCOD_black;
extern const TCOD_color_t TCOD_darkest_grey;
extern const TCOD_color_t TCOD_darker_grey;
extern const TCOD_color_t TCOD_dark_grey;
extern const TCOD_color_t TCOD_grey;
extern const TCOD_color_t TCOD_light_grey;
extern const TCOD_color_t TCOD_lighter_grey;
extern const TCOD_color_t TCOD_lightest_grey;
extern const TCOD_color_t TCOD_darkest_gray;
extern const TCOD_color_t TCOD_darker_gray;
extern const TCOD_color_t TCOD_dark_gray;
extern const TCOD_color_t TCOD_gray;
extern const TCOD_color_t TCOD_light_gray;
extern const TCOD_color_t TCOD_lighter_gray;
extern const TCOD_color_t TCOD_lightest_gray;
extern const TCOD_color_t TCOD_white;


extern const TCOD_color_t TCOD_darkest_sepia;
extern const TCOD_color_t TCOD_darker_sepia;
extern const TCOD_color_t TCOD_dark_sepia;
extern const TCOD_color_t TCOD_sepia;
extern const TCOD_color_t TCOD_light_sepia;
extern const TCOD_color_t TCOD_lighter_sepia;
extern const TCOD_color_t TCOD_lightest_sepia;


extern const TCOD_color_t TCOD_red;
extern const TCOD_color_t TCOD_flame;
extern const TCOD_color_t TCOD_orange;
extern const TCOD_color_t TCOD_amber;
extern const TCOD_color_t TCOD_yellow;
extern const TCOD_color_t TCOD_lime;
extern const TCOD_color_t TCOD_chartreuse;
extern const TCOD_color_t TCOD_green;
extern const TCOD_color_t TCOD_sea;
extern const TCOD_color_t TCOD_turquoise;
extern const TCOD_color_t TCOD_cyan;
extern const TCOD_color_t TCOD_sky;
extern const TCOD_color_t TCOD_azure;
extern const TCOD_color_t TCOD_blue;
extern const TCOD_color_t TCOD_han;
extern const TCOD_color_t TCOD_violet;
extern const TCOD_color_t TCOD_purple;
extern const TCOD_color_t TCOD_fuchsia;
extern const TCOD_color_t TCOD_magenta;
extern const TCOD_color_t TCOD_pink;
extern const TCOD_color_t TCOD_crimson;


extern const TCOD_color_t TCOD_dark_red;
extern const TCOD_color_t TCOD_dark_flame;
extern const TCOD_color_t TCOD_dark_orange;
extern const TCOD_color_t TCOD_dark_amber;
extern const TCOD_color_t TCOD_dark_yellow;
extern const TCOD_color_t TCOD_dark_lime;
extern const TCOD_color_t TCOD_dark_chartreuse;
extern const TCOD_color_t TCOD_dark_green;
extern const TCOD_color_t TCOD_dark_sea;
extern const TCOD_color_t TCOD_dark_turquoise;
extern const TCOD_color_t TCOD_dark_cyan;
extern const TCOD_color_t TCOD_dark_sky;
extern const TCOD_color_t TCOD_dark_azure;
extern const TCOD_color_t TCOD_dark_blue;
extern const TCOD_color_t TCOD_dark_han;
extern const TCOD_color_t TCOD_dark_violet;
extern const TCOD_color_t TCOD_dark_purple;
extern const TCOD_color_t TCOD_dark_fuchsia;
extern const TCOD_color_t TCOD_dark_magenta;
extern const TCOD_color_t TCOD_dark_pink;
extern const TCOD_color_t TCOD_dark_crimson;


extern const TCOD_color_t TCOD_darker_red;
extern const TCOD_color_t TCOD_darker_flame;
extern const TCOD_color_t TCOD_darker_orange;
extern const TCOD_color_t TCOD_darker_amber;
extern const TCOD_color_t TCOD_darker_yellow;
extern const TCOD_color_t TCOD_darker_lime;
extern const TCOD_color_t TCOD_darker_chartreuse;
extern const TCOD_color_t TCOD_darker_green;
extern const TCOD_color_t TCOD_darker_sea;
extern const TCOD_color_t TCOD_darker_turquoise;
extern const TCOD_color_t TCOD_darker_cyan;
extern const TCOD_color_t TCOD_darker_sky;
extern const TCOD_color_t TCOD_darker_azure;
extern const TCOD_color_t TCOD_darker_blue;
extern const TCOD_color_t TCOD_darker_han;
extern const TCOD_color_t TCOD_darker_violet;
extern const TCOD_color_t TCOD_darker_purple;
extern const TCOD_color_t TCOD_darker_fuchsia;
extern const TCOD_color_t TCOD_darker_magenta;
extern const TCOD_color_t TCOD_darker_pink;
extern const TCOD_color_t TCOD_darker_crimson;


extern const TCOD_color_t TCOD_darkest_red;
extern const TCOD_color_t TCOD_darkest_flame;
extern const TCOD_color_t TCOD_darkest_orange;
extern const TCOD_color_t TCOD_darkest_amber;
extern const TCOD_color_t TCOD_darkest_yellow;
extern const TCOD_color_t TCOD_darkest_lime;
extern const TCOD_color_t TCOD_darkest_chartreuse;
extern const TCOD_color_t TCOD_darkest_green;
extern const TCOD_color_t TCOD_darkest_sea;
extern const TCOD_color_t TCOD_darkest_turquoise;
extern const TCOD_color_t TCOD_darkest_cyan;
extern const TCOD_color_t TCOD_darkest_sky;
extern const TCOD_color_t TCOD_darkest_azure;
extern const TCOD_color_t TCOD_darkest_blue;
extern const TCOD_color_t TCOD_darkest_han;
extern const TCOD_color_t TCOD_darkest_violet;
extern const TCOD_color_t TCOD_darkest_purple;
extern const TCOD_color_t TCOD_darkest_fuchsia;
extern const TCOD_color_t TCOD_darkest_magenta;
extern const TCOD_color_t TCOD_darkest_pink;
extern const TCOD_color_t TCOD_darkest_crimson;


extern const TCOD_color_t TCOD_light_red;
extern const TCOD_color_t TCOD_light_flame;
extern const TCOD_color_t TCOD_light_orange;
extern const TCOD_color_t TCOD_light_amber;
extern const TCOD_color_t TCOD_light_yellow;
extern const TCOD_color_t TCOD_light_lime;
extern const TCOD_color_t TCOD_light_chartreuse;
extern const TCOD_color_t TCOD_light_green;
extern const TCOD_color_t TCOD_light_sea;
extern const TCOD_color_t TCOD_light_turquoise;
extern const TCOD_color_t TCOD_light_cyan;
extern const TCOD_color_t TCOD_light_sky;
extern const TCOD_color_t TCOD_light_azure;
extern const TCOD_color_t TCOD_light_blue;
extern const TCOD_color_t TCOD_light_han;
extern const TCOD_color_t TCOD_light_violet;
extern const TCOD_color_t TCOD_light_purple;
extern const TCOD_color_t TCOD_light_fuchsia;
extern const TCOD_color_t TCOD_light_magenta;
extern const TCOD_color_t TCOD_light_pink;
extern const TCOD_color_t TCOD_light_crimson;


extern const TCOD_color_t TCOD_lighter_red;
extern const TCOD_color_t TCOD_lighter_flame;
extern const TCOD_color_t TCOD_lighter_orange;
extern const TCOD_color_t TCOD_lighter_amber;
extern const TCOD_color_t TCOD_lighter_yellow;
extern const TCOD_color_t TCOD_lighter_lime;
extern const TCOD_color_t TCOD_lighter_chartreuse;
extern const TCOD_color_t TCOD_lighter_green;
extern const TCOD_color_t TCOD_lighter_sea;
extern const TCOD_color_t TCOD_lighter_turquoise;
extern const TCOD_color_t TCOD_lighter_cyan;
extern const TCOD_color_t TCOD_lighter_sky;
extern const TCOD_color_t TCOD_lighter_azure;
extern const TCOD_color_t TCOD_lighter_blue;
extern const TCOD_color_t TCOD_lighter_han;
extern const TCOD_color_t TCOD_lighter_violet;
extern const TCOD_color_t TCOD_lighter_purple;
extern const TCOD_color_t TCOD_lighter_fuchsia;
extern const TCOD_color_t TCOD_lighter_magenta;
extern const TCOD_color_t TCOD_lighter_pink;
extern const TCOD_color_t TCOD_lighter_crimson;


extern const TCOD_color_t TCOD_lightest_red;
extern const TCOD_color_t TCOD_lightest_flame;
extern const TCOD_color_t TCOD_lightest_orange;
extern const TCOD_color_t TCOD_lightest_amber;
extern const TCOD_color_t TCOD_lightest_yellow;
extern const TCOD_color_t TCOD_lightest_lime;
extern const TCOD_color_t TCOD_lightest_chartreuse;
extern const TCOD_color_t TCOD_lightest_green;
extern const TCOD_color_t TCOD_lightest_sea;
extern const TCOD_color_t TCOD_lightest_turquoise;
extern const TCOD_color_t TCOD_lightest_cyan;
extern const TCOD_color_t TCOD_lightest_sky;
extern const TCOD_color_t TCOD_lightest_azure;
extern const TCOD_color_t TCOD_lightest_blue;
extern const TCOD_color_t TCOD_lightest_han;
extern const TCOD_color_t TCOD_lightest_violet;
extern const TCOD_color_t TCOD_lightest_purple;
extern const TCOD_color_t TCOD_lightest_fuchsia;
extern const TCOD_color_t TCOD_lightest_magenta;
extern const TCOD_color_t TCOD_lightest_pink;
extern const TCOD_color_t TCOD_lightest_crimson;


extern const TCOD_color_t TCOD_desaturated_red;
extern const TCOD_color_t TCOD_desaturated_flame;
extern const TCOD_color_t TCOD_desaturated_orange;
extern const TCOD_color_t TCOD_desaturated_amber;
extern const TCOD_color_t TCOD_desaturated_yellow;
extern const TCOD_color_t TCOD_desaturated_lime;
extern const TCOD_color_t TCOD_desaturated_chartreuse;
extern const TCOD_color_t TCOD_desaturated_green;
extern const TCOD_color_t TCOD_desaturated_sea;
extern const TCOD_color_t TCOD_desaturated_turquoise;
extern const TCOD_color_t TCOD_desaturated_cyan;
extern const TCOD_color_t TCOD_desaturated_sky;
extern const TCOD_color_t TCOD_desaturated_azure;
extern const TCOD_color_t TCOD_desaturated_blue;
extern const TCOD_color_t TCOD_desaturated_han;
extern const TCOD_color_t TCOD_desaturated_violet;
extern const TCOD_color_t TCOD_desaturated_purple;
extern const TCOD_color_t TCOD_desaturated_fuchsia;
extern const TCOD_color_t TCOD_desaturated_magenta;
extern const TCOD_color_t TCOD_desaturated_pink;
extern const TCOD_color_t TCOD_desaturated_crimson;


extern const TCOD_color_t TCOD_brass;
extern const TCOD_color_t TCOD_copper;
extern const TCOD_color_t TCOD_gold;
extern const TCOD_color_t TCOD_silver;


extern const TCOD_color_t TCOD_celadon;
extern const TCOD_color_t TCOD_peach;





typedef enum {
 TCODK_NONE,
 TCODK_ESCAPE,
 TCODK_BACKSPACE,
 TCODK_TAB,
 TCODK_ENTER,
 TCODK_SHIFT,
 TCODK_CONTROL,
 TCODK_ALT,
 TCODK_PAUSE,
 TCODK_CAPSLOCK,
 TCODK_PAGEUP,
 TCODK_PAGEDOWN,
 TCODK_END,
 TCODK_HOME,
 TCODK_UP,
 TCODK_LEFT,
 TCODK_RIGHT,
 TCODK_DOWN,
 TCODK_PRINTSCREEN,
 TCODK_INSERT,
 TCODK_DELETE,
 TCODK_LWIN,
 TCODK_RWIN,
 TCODK_APPS,
 TCODK_0,
 TCODK_1,
 TCODK_2,
 TCODK_3,
 TCODK_4,
 TCODK_5,
 TCODK_6,
 TCODK_7,
 TCODK_8,
 TCODK_9,
 TCODK_KP0,
 TCODK_KP1,
 TCODK_KP2,
 TCODK_KP3,
 TCODK_KP4,
 TCODK_KP5,
 TCODK_KP6,
 TCODK_KP7,
 TCODK_KP8,
 TCODK_KP9,
 TCODK_KPADD,
 TCODK_KPSUB,
 TCODK_KPDIV,
 TCODK_KPMUL,
 TCODK_KPDEC,
 TCODK_KPENTER,
 TCODK_F1,
 TCODK_F2,
 TCODK_F3,
 TCODK_F4,
 TCODK_F5,
 TCODK_F6,
 TCODK_F7,
 TCODK_F8,
 TCODK_F9,
 TCODK_F10,
 TCODK_F11,
 TCODK_F12,
 TCODK_NUMLOCK,
 TCODK_SCROLLLOCK,
 TCODK_SPACE,
 TCODK_CHAR
} TCOD_keycode_t;


typedef struct {
 TCOD_keycode_t vk;
 char c;
 bool pressed ;
 bool lalt ;
 bool lctrl ;
 bool ralt ;
 bool rctrl ;
 bool shift ;
} TCOD_key_t;

typedef enum {

 TCOD_CHAR_HLINE=196,
 TCOD_CHAR_VLINE=179,
 TCOD_CHAR_NE=191,
 TCOD_CHAR_NW=218,
 TCOD_CHAR_SE=217,
 TCOD_CHAR_SW=192,
 TCOD_CHAR_TEEW=180,
 TCOD_CHAR_TEEE=195,
 TCOD_CHAR_TEEN=193,
 TCOD_CHAR_TEES=194,
 TCOD_CHAR_CROSS=197,

 TCOD_CHAR_DHLINE=205,
 TCOD_CHAR_DVLINE=186,
 TCOD_CHAR_DNE=187,
 TCOD_CHAR_DNW=201,
 TCOD_CHAR_DSE=188,
 TCOD_CHAR_DSW=200,
 TCOD_CHAR_DTEEW=185,
 TCOD_CHAR_DTEEE=204,
 TCOD_CHAR_DTEEN=202,
 TCOD_CHAR_DTEES=203,
 TCOD_CHAR_DCROSS=206,

 TCOD_CHAR_BLOCK1=176,
 TCOD_CHAR_BLOCK2=177,
 TCOD_CHAR_BLOCK3=178,

 TCOD_CHAR_ARROW_N=24,
 TCOD_CHAR_ARROW_S=25,
 TCOD_CHAR_ARROW_E=26,
 TCOD_CHAR_ARROW_W=27,

 TCOD_CHAR_ARROW2_N=30,
 TCOD_CHAR_ARROW2_S=31,
 TCOD_CHAR_ARROW2_E=16,
 TCOD_CHAR_ARROW2_W=17,

 TCOD_CHAR_DARROW_H=29,
 TCOD_CHAR_DARROW_V=18,

 TCOD_CHAR_CHECKBOX_UNSET=224,
 TCOD_CHAR_CHECKBOX_SET=225,
 TCOD_CHAR_RADIO_UNSET=9,
 TCOD_CHAR_RADIO_SET=10,

 TCOD_CHAR_SUBP_NW=226,
 TCOD_CHAR_SUBP_NE=227,
 TCOD_CHAR_SUBP_N=228,
 TCOD_CHAR_SUBP_SE=229,
 TCOD_CHAR_SUBP_DIAG=230,
 TCOD_CHAR_SUBP_E=231,
 TCOD_CHAR_SUBP_SW=232,

 TCOD_CHAR_SMILIE = 1,
 TCOD_CHAR_SMILIE_INV = 2,
 TCOD_CHAR_HEART = 3,
 TCOD_CHAR_DIAMOND = 4,
 TCOD_CHAR_CLUB = 5,
 TCOD_CHAR_SPADE = 6,
 TCOD_CHAR_BULLET = 7,
 TCOD_CHAR_BULLET_INV = 8,
 TCOD_CHAR_MALE = 11,
 TCOD_CHAR_FEMALE = 12,
 TCOD_CHAR_NOTE = 13,
 TCOD_CHAR_NOTE_DOUBLE = 14,
 TCOD_CHAR_LIGHT = 15,
 TCOD_CHAR_EXCLAM_DOUBLE = 19,
 TCOD_CHAR_PILCROW = 20,
 TCOD_CHAR_SECTION = 21,
 TCOD_CHAR_POUND = 156,
 TCOD_CHAR_MULTIPLICATION = 158,
 TCOD_CHAR_FUNCTION = 159,
 TCOD_CHAR_RESERVED = 169,
 TCOD_CHAR_HALF = 171,
 TCOD_CHAR_ONE_QUARTER = 172,
 TCOD_CHAR_COPYRIGHT = 184,
 TCOD_CHAR_CENT = 189,
 TCOD_CHAR_YEN = 190,
 TCOD_CHAR_CURRENCY = 207,
 TCOD_CHAR_THREE_QUARTERS = 243,
 TCOD_CHAR_DIVISION = 246,
 TCOD_CHAR_GRADE = 248,
 TCOD_CHAR_UMLAUT = 249,
 TCOD_CHAR_POW1 = 251,
 TCOD_CHAR_POW3 = 252,
 TCOD_CHAR_POW2 = 253,
 TCOD_CHAR_BULLET_SQUARE = 254,

} TCOD_chars_t;

typedef enum {
 TCOD_COLCTRL_1 = 1,
 TCOD_COLCTRL_2,
 TCOD_COLCTRL_3,
 TCOD_COLCTRL_4,
 TCOD_COLCTRL_5,
 TCOD_COLCTRL_NUMBER=5,
 TCOD_COLCTRL_FORE_RGB,
 TCOD_COLCTRL_BACK_RGB,
 TCOD_COLCTRL_STOP
} TCOD_colctrl_t;

typedef enum {
 TCOD_BKGND_NONE,
 TCOD_BKGND_SET,
 TCOD_BKGND_MULTIPLY,
 TCOD_BKGND_LIGHTEN,
 TCOD_BKGND_DARKEN,
 TCOD_BKGND_SCREEN,
 TCOD_BKGND_COLOR_DODGE,
 TCOD_BKGND_COLOR_BURN,
 TCOD_BKGND_ADD,
 TCOD_BKGND_ADDA,
 TCOD_BKGND_BURN,
 TCOD_BKGND_OVERLAY,
 TCOD_BKGND_ALPH,
 TCOD_BKGND_DEFAULT
} TCOD_bkgnd_flag_t;

typedef enum {
 TCOD_KEY_PRESSED=1,
 TCOD_KEY_RELEASED=2,
} TCOD_key_status_t;


typedef enum {
 TCOD_FONT_LAYOUT_ASCII_INCOL=1,
 TCOD_FONT_LAYOUT_ASCII_INROW=2,
 TCOD_FONT_TYPE_GREYSCALE=4,
 TCOD_FONT_TYPE_GRAYSCALE=4,
 TCOD_FONT_LAYOUT_TCOD=8,
} TCOD_font_flags_t;

typedef enum {
 TCOD_RENDERER_GLSL,
 TCOD_RENDERER_OPENGL,
 TCOD_RENDERER_SDL,
 TCOD_NB_RENDERERS,
} TCOD_renderer_t;

typedef enum {
 TCOD_LEFT,
 TCOD_RIGHT,
 TCOD_CENTER
} TCOD_alignment_t;





typedef void * TCOD_console_t;

 void TCOD_console_init_root(int w, int h, const char * title, bool fullscreen, TCOD_renderer_t renderer);
 void TCOD_console_set_window_title(const char *title);
 void TCOD_console_set_fullscreen(bool fullscreen);
 bool TCOD_console_is_fullscreen();
 bool TCOD_console_is_window_closed();
 bool TCOD_console_has_mouse_focus();
 bool TCOD_console_is_active();

 void TCOD_console_set_custom_font(const char *fontFile, int flags,int nb_char_horiz, int nb_char_vertic);
 void TCOD_console_map_ascii_code_to_font(int asciiCode, int fontCharX, int fontCharY);
 void TCOD_console_map_ascii_codes_to_font(int asciiCode, int nbCodes, int fontCharX, int fontCharY);
 void TCOD_console_map_string_to_font(const char *s, int fontCharX, int fontCharY);

 void TCOD_console_set_dirty(int x, int y, int w, int h);
 void TCOD_console_set_default_background(TCOD_console_t con,TCOD_color_t col);
 void TCOD_console_set_default_foreground(TCOD_console_t con,TCOD_color_t col);
 void TCOD_console_clear(TCOD_console_t con);
 void TCOD_console_set_char_background(TCOD_console_t con,int x, int y, TCOD_color_t col, TCOD_bkgnd_flag_t flag);
 void TCOD_console_set_char_foreground(TCOD_console_t con,int x, int y, TCOD_color_t col);
 void TCOD_console_set_char(TCOD_console_t con,int x, int y, int c);
 void TCOD_console_put_char(TCOD_console_t con,int x, int y, int c, TCOD_bkgnd_flag_t flag);
 void TCOD_console_put_char_ex(TCOD_console_t con,int x, int y, int c, TCOD_color_t fore, TCOD_color_t back);

 void TCOD_console_set_background_flag(TCOD_console_t con,TCOD_bkgnd_flag_t flag);
 TCOD_bkgnd_flag_t TCOD_console_get_background_flag(TCOD_console_t con);
 void TCOD_console_set_alignment(TCOD_console_t con,TCOD_alignment_t alignment);
 TCOD_alignment_t TCOD_console_get_alignment(TCOD_console_t con);
 void TCOD_console_print(TCOD_console_t con,int x, int y, const char *fmt, ...);
 void TCOD_console_print_ex(TCOD_console_t con,int x, int y, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const char *fmt, ...);
 int TCOD_console_print_rect(TCOD_console_t con,int x, int y, int w, int h, const char *fmt, ...);
 int TCOD_console_print_rect_ex(TCOD_console_t con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const char *fmt, ...);
 int TCOD_console_get_height_rect(TCOD_console_t con,int x, int y, int w, int h, const char *fmt, ...);

 void TCOD_console_rect(TCOD_console_t con,int x, int y, int w, int h, bool clear, TCOD_bkgnd_flag_t flag);
 void TCOD_console_hline(TCOD_console_t con,int x,int y, int l, TCOD_bkgnd_flag_t flag);
 void TCOD_console_vline(TCOD_console_t con,int x,int y, int l, TCOD_bkgnd_flag_t flag);
 void TCOD_console_print_frame(TCOD_console_t con,int x,int y,int w,int h, bool empty, TCOD_bkgnd_flag_t flag, const char *fmt, ...);



 void TCOD_console_map_string_to_font_utf(const wchar_t *s, int fontCharX, int fontCharY);
 void TCOD_console_print_utf(TCOD_console_t con,int x, int y, const wchar_t *fmt, ...);
 void TCOD_console_print_ex_utf(TCOD_console_t con,int x, int y, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const wchar_t *fmt, ...);
 int TCOD_console_print_rect_utf(TCOD_console_t con,int x, int y, int w, int h, const wchar_t *fmt, ...);
 int TCOD_console_print_rect_ex_utf(TCOD_console_t con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const wchar_t *fmt, ...);
 int TCOD_console_get_height_rect_utf(TCOD_console_t con,int x, int y, int w, int h, const wchar_t *fmt, ...);



 TCOD_color_t TCOD_console_get_default_background(TCOD_console_t con);
 TCOD_color_t TCOD_console_get_default_foreground(TCOD_console_t con);
 TCOD_color_t TCOD_console_get_char_background(TCOD_console_t con,int x, int y);
 TCOD_color_t TCOD_console_get_char_foreground(TCOD_console_t con,int x, int y);
 int TCOD_console_get_char(TCOD_console_t con,int x, int y);

 void TCOD_console_set_fade(uint8 val, TCOD_color_t fade);
 uint8 TCOD_console_get_fade();
 TCOD_color_t TCOD_console_get_fading_color();

 void TCOD_console_flush();

 void TCOD_console_set_color_control(TCOD_colctrl_t con, TCOD_color_t fore, TCOD_color_t back);

 TCOD_key_t TCOD_console_check_for_keypress(int flags);
 TCOD_key_t TCOD_console_wait_for_keypress(bool flush);
 void TCOD_console_set_keyboard_repeat(int initial_delay, int interval);
 void TCOD_console_disable_keyboard_repeat();
 bool TCOD_console_is_key_pressed(TCOD_keycode_t key);


 TCOD_console_t TCOD_console_from_file(const char *filename);
 bool TCOD_console_load_asc(TCOD_console_t con, const char *filename);
 bool TCOD_console_load_apf(TCOD_console_t con, const char *filename);
 bool TCOD_console_save_asc(TCOD_console_t con, const char *filename);
 bool TCOD_console_save_apf(TCOD_console_t con, const char *filename);

 TCOD_console_t TCOD_console_new(int w, int h);
 int TCOD_console_get_width(TCOD_console_t con);
 int TCOD_console_get_height(TCOD_console_t con);
 void TCOD_console_set_key_color(TCOD_console_t con,TCOD_color_t col);
 void TCOD_console_blit(TCOD_console_t src,int xSrc, int ySrc, int wSrc, int hSrc, TCOD_console_t dst, int xDst, int yDst, float foreground_alpha, float background_alpha);
 void TCOD_console_delete(TCOD_console_t console);

 void TCOD_console_credits();
 void TCOD_console_credits_reset();
 bool TCOD_console_credits_render(int x, int y, bool alpha);



typedef void *TCOD_image_t;

 TCOD_image_t TCOD_image_new(int width, int height);
 TCOD_image_t TCOD_image_from_console(TCOD_console_t console);
 void TCOD_image_refresh_console(TCOD_image_t image, TCOD_console_t console);
 TCOD_image_t TCOD_image_load(const char *filename);
 void TCOD_image_clear(TCOD_image_t image, TCOD_color_t color);
 void TCOD_image_invert(TCOD_image_t image);
 void TCOD_image_hflip(TCOD_image_t image);
 void TCOD_image_rotate90(TCOD_image_t image, int numRotations);
 void TCOD_image_vflip(TCOD_image_t image);
 void TCOD_image_scale(TCOD_image_t image, int neww, int newh);
 void TCOD_image_save(TCOD_image_t image, const char *filename);
 void TCOD_image_get_size(TCOD_image_t image, int *w,int *h);
 TCOD_color_t TCOD_image_get_pixel(TCOD_image_t image,int x, int y);
 int TCOD_image_get_alpha(TCOD_image_t image,int x, int y);
 TCOD_color_t TCOD_image_get_mipmap_pixel(TCOD_image_t image,float x0,float y0, float x1, float y1);
 void TCOD_image_put_pixel(TCOD_image_t image,int x, int y,TCOD_color_t col);
 void TCOD_image_blit(TCOD_image_t image, TCOD_console_t console, float x, float y,
 TCOD_bkgnd_flag_t bkgnd_flag, float scalex, float scaley, float angle);
 void TCOD_image_blit_rect(TCOD_image_t image, TCOD_console_t console, int x, int y, int w, int h,
 TCOD_bkgnd_flag_t bkgnd_flag);
 void TCOD_image_blit_2x(TCOD_image_t image, TCOD_console_t dest, int dx, int dy, int sx, int sy, int w, int h);
 void TCOD_image_delete(TCOD_image_t image);
 void TCOD_image_set_key_color(TCOD_image_t image, TCOD_color_t key_color);
 bool TCOD_image_is_pixel_transparent(TCOD_image_t image, int x, int y);





typedef struct {
  int x,y;
  int dx,dy;
  int cx,cy;
  int dcx,dcy;
  bool lbutton ;
  bool rbutton ;
  bool mbutton ;
  bool lbutton_pressed ;
  bool rbutton_pressed ;
  bool mbutton_pressed ;
  bool wheel_up ;
  bool wheel_down ;
} TCOD_mouse_t;


 void TCOD_mouse_show_cursor(bool visible);
 TCOD_mouse_t TCOD_mouse_get_status();
 bool TCOD_mouse_is_cursor_visible();
 void TCOD_mouse_move(int x, int y);
 void TCOD_mouse_includes_touch(bool enable);



 uint32 TCOD_sys_elapsed_milli();
 float TCOD_sys_elapsed_seconds();
 void TCOD_sys_sleep_milli(uint32 val);
 void TCOD_sys_save_screenshot(const char *filename);
 void TCOD_sys_force_fullscreen_resolution(int width, int height);
 void TCOD_sys_set_renderer(TCOD_renderer_t renderer);
 TCOD_renderer_t TCOD_sys_get_renderer();
 void TCOD_sys_set_fps(int val);
 int TCOD_sys_get_fps();
 float TCOD_sys_get_last_frame_length();
 void TCOD_sys_get_current_resolution(int *w, int *h);
 void TCOD_sys_get_fullscreen_offsets(int *offx, int *offy);
 void TCOD_sys_update_char(int asciiCode, int fontx, int fonty, TCOD_image_t img, int x, int y);
 void TCOD_sys_get_char_size(int *w, int *h);
 void *TCOD_sys_get_SDL_window();

typedef enum {
  TCOD_EVENT_NONE=0,
  TCOD_EVENT_KEY_PRESS=1,
  TCOD_EVENT_KEY_RELEASE=2,
  TCOD_EVENT_KEY=TCOD_EVENT_KEY_PRESS|TCOD_EVENT_KEY_RELEASE,
  TCOD_EVENT_MOUSE_MOVE=4,
  TCOD_EVENT_MOUSE_PRESS=8,
  TCOD_EVENT_MOUSE_RELEASE=16,
  TCOD_EVENT_MOUSE=TCOD_EVENT_MOUSE_MOVE|TCOD_EVENT_MOUSE_PRESS|TCOD_EVENT_MOUSE_RELEASE,

  TCOD_EVENT_FINGER_MOVE=32,
  TCOD_EVENT_FINGER_PRESS=64,
  TCOD_EVENT_FINGER_RELEASE=128,
  TCOD_EVENT_FINGER=TCOD_EVENT_FINGER_MOVE|TCOD_EVENT_FINGER_PRESS|TCOD_EVENT_FINGER_RELEASE,

  TCOD_EVENT_ANY=TCOD_EVENT_KEY|TCOD_EVENT_MOUSE|TCOD_EVENT_FINGER,
} TCOD_event_t;
 TCOD_event_t TCOD_sys_wait_for_event(int eventMask, TCOD_key_t *key, TCOD_mouse_t *mouse, bool flush);
 TCOD_event_t TCOD_sys_check_for_event(int eventMask, TCOD_key_t *key, TCOD_mouse_t *mouse);


 bool TCOD_sys_create_directory(const char *path);
 bool TCOD_sys_delete_file(const char *path);
 bool TCOD_sys_delete_directory(const char *path);
 bool TCOD_sys_is_directory(const char *path);
 TCOD_list_t TCOD_sys_get_directory_content(const char *path, const char *pattern);
 bool TCOD_sys_file_exists(const char * filename, ...);
 bool TCOD_sys_read_file(const char *filename, unsigned char **buf, size_t *size);
 bool TCOD_sys_write_file(const char *filename, unsigned char *buf, uint32 size);


 void TCOD_sys_clipboard_set(const char *value);
 char *TCOD_sys_clipboard_get();


typedef void *TCOD_thread_t;
typedef void *TCOD_semaphore_t;
typedef void *TCOD_mutex_t;
typedef void *TCOD_cond_t;

 TCOD_thread_t TCOD_thread_new(int (*func)(void *), void *data);
 void TCOD_thread_delete(TCOD_thread_t th);
 int TCOD_sys_get_num_cores();
 void TCOD_thread_wait(TCOD_thread_t th);

 TCOD_mutex_t TCOD_mutex_new();
 void TCOD_mutex_in(TCOD_mutex_t mut);
 void TCOD_mutex_out(TCOD_mutex_t mut);
 void TCOD_mutex_delete(TCOD_mutex_t mut);

 TCOD_semaphore_t TCOD_semaphore_new(int initVal);
 void TCOD_semaphore_lock(TCOD_semaphore_t sem);
 void TCOD_semaphore_unlock(TCOD_semaphore_t sem);
 void TCOD_semaphore_delete( TCOD_semaphore_t sem);

 TCOD_cond_t TCOD_condition_new();
 void TCOD_condition_signal(TCOD_cond_t sem);
 void TCOD_condition_broadcast(TCOD_cond_t sem);
 void TCOD_condition_wait(TCOD_cond_t sem, TCOD_mutex_t mut);
 void TCOD_condition_delete( TCOD_cond_t sem);

typedef void *TCOD_library_t;
 TCOD_library_t TCOD_load_library(const char *path);
 void * TCOD_get_function_address(TCOD_library_t library, const char *function_name);
 void TCOD_close_library(TCOD_library_t);




typedef void (*SDL_renderer_t) (void *sdl_surface);

 void TCOD_sys_register_SDL_renderer(SDL_renderer_t renderer);





typedef struct {
 int nb_rolls;
 int nb_faces;
 float multiplier;
 float addsub;
} TCOD_dice_t;


typedef enum {
    TCOD_RNG_MT,
    TCOD_RNG_CMWC
} TCOD_random_algo_t;

typedef enum {
 TCOD_DISTRIBUTION_LINEAR,
 TCOD_DISTRIBUTION_GAUSSIAN,
 TCOD_DISTRIBUTION_GAUSSIAN_RANGE,
 TCOD_DISTRIBUTION_GAUSSIAN_INVERSE,
 TCOD_DISTRIBUTION_GAUSSIAN_RANGE_INVERSE
} TCOD_distribution_t;


typedef void *TCOD_random_t;

 TCOD_random_t TCOD_random_get_instance(void);
 TCOD_random_t TCOD_random_new(TCOD_random_algo_t algo);
 TCOD_random_t TCOD_random_save(TCOD_random_t mersenne);
 void TCOD_random_restore(TCOD_random_t mersenne, TCOD_random_t backup);
 TCOD_random_t TCOD_random_new_from_seed(TCOD_random_algo_t algo, uint32 seed);
 void TCOD_random_delete(TCOD_random_t mersenne);

 void TCOD_random_set_distribution (TCOD_random_t mersenne, TCOD_distribution_t distribution);

 int TCOD_random_get_int (TCOD_random_t mersenne, int min, int max);
 float TCOD_random_get_float (TCOD_random_t mersenne, float min, float max);
 double TCOD_random_get_double (TCOD_random_t mersenne, double min, double max);

 int TCOD_random_get_int_mean (TCOD_random_t mersenne, int min, int max, int mean);
 float TCOD_random_get_float_mean (TCOD_random_t mersenne, float min, float max, float mean);
 double TCOD_random_get_double_mean (TCOD_random_t mersenne, double min, double max, double mean);

 TCOD_dice_t TCOD_random_dice_new (const char * s);
 int TCOD_random_dice_roll (TCOD_random_t mersenne, TCOD_dice_t dice);
 int TCOD_random_dice_roll_s (TCOD_random_t mersenne, const char * s);



typedef bool (*TCOD_line_listener_t) (int x, int y);

 void TCOD_line_init(int xFrom, int yFrom, int xTo, int yTo);
 bool TCOD_line_step(int *xCur, int *yCur);

 bool TCOD_line(int xFrom, int yFrom, int xTo, int yTo, TCOD_line_listener_t listener);


typedef struct {
 int stepx;
 int stepy;
 int e;
 int deltax;
 int deltay;
 int origx;
 int origy;
 int destx;
 int desty;
} TCOD_bresenham_data_t;

 void TCOD_line_init_mt(int xFrom, int yFrom, int xTo, int yTo, TCOD_bresenham_data_t *data);
 bool TCOD_line_step_mt(int *xCur, int *yCur, TCOD_bresenham_data_t *data);
 bool TCOD_line_mt(int xFrom, int yFrom, int xTo, int yTo, TCOD_line_listener_t listener, TCOD_bresenham_data_t *data);



typedef void *TCOD_noise_t;

typedef enum {
 TCOD_NOISE_PERLIN = 1,
 TCOD_NOISE_SIMPLEX = 2,
 TCOD_NOISE_WAVELET = 4,
 TCOD_NOISE_DEFAULT = 0
} TCOD_noise_type_t;





 TCOD_noise_t TCOD_noise_new(int dimensions, float hurst, float lacunarity, TCOD_random_t random);


 void TCOD_noise_set_type (TCOD_noise_t noise, TCOD_noise_type_t type);
 float TCOD_noise_get_ex (TCOD_noise_t noise, float *f, TCOD_noise_type_t type);
 float TCOD_noise_get_fbm_ex (TCOD_noise_t noise, float *f, float octaves, TCOD_noise_type_t type);
 float TCOD_noise_get_turbulence_ex (TCOD_noise_t noise, float *f, float octaves, TCOD_noise_type_t type);
 float TCOD_noise_get (TCOD_noise_t noise, float *f);
 float TCOD_noise_get_fbm (TCOD_noise_t noise, float *f, float octaves);
 float TCOD_noise_get_turbulence (TCOD_noise_t noise, float *f, float octaves);

 void TCOD_noise_delete(TCOD_noise_t noise);



typedef void *TCOD_map_t;



typedef enum {
 FOV_BASIC,
 FOV_DIAMOND,
 FOV_SHADOW,
 FOV_PERMISSIVE_0,
 FOV_PERMISSIVE_1,
 FOV_PERMISSIVE_2,
 FOV_PERMISSIVE_3,
 FOV_PERMISSIVE_4,
 FOV_PERMISSIVE_5,
 FOV_PERMISSIVE_6,
 FOV_PERMISSIVE_7,
 FOV_PERMISSIVE_8,
 FOV_RESTRICTIVE,
 NB_FOV_ALGORITHMS } TCOD_fov_algorithm_t;



 TCOD_map_t TCOD_map_new(int width, int height);

 void TCOD_map_clear(TCOD_map_t map, bool transparent, bool walkable);

 void TCOD_map_copy(TCOD_map_t source, TCOD_map_t dest);

 void TCOD_map_set_properties(TCOD_map_t map, int x, int y, bool is_transparent, bool is_walkable);

 void TCOD_map_delete(TCOD_map_t map);


 void TCOD_map_compute_fov(TCOD_map_t map, int player_x, int player_y, int max_radius, bool light_walls, TCOD_fov_algorithm_t algo);

 bool TCOD_map_is_in_fov(TCOD_map_t map, int x, int y);
 void TCOD_map_set_in_fov(TCOD_map_t map, int x, int y, bool fov);


 bool TCOD_map_is_transparent(TCOD_map_t map, int x, int y);
 bool TCOD_map_is_walkable(TCOD_map_t map, int x, int y);
 int TCOD_map_get_width(TCOD_map_t map);
 int TCOD_map_get_height(TCOD_map_t map);
 int TCOD_map_get_nb_cells(TCOD_map_t map);



typedef float (*TCOD_path_func_t)( int xFrom, int yFrom, int xTo, int yTo, void *user_data );
typedef void *TCOD_path_t;

 TCOD_path_t TCOD_path_new_using_map(TCOD_map_t map, float diagonalCost);
 TCOD_path_t TCOD_path_new_using_function(int map_width, int map_height, TCOD_path_func_t func, void *user_data, float diagonalCost);

 bool TCOD_path_compute(TCOD_path_t path, int ox,int oy, int dx, int dy);
 bool TCOD_path_walk(TCOD_path_t path, int *x, int *y, bool recalculate_when_needed);
 bool TCOD_path_is_empty(TCOD_path_t path);
 int TCOD_path_size(TCOD_path_t path);
 void TCOD_path_reverse(TCOD_path_t path);
 void TCOD_path_get(TCOD_path_t path, int index, int *x, int *y);
 void TCOD_path_get_origin(TCOD_path_t path, int *x, int *y);
 void TCOD_path_get_destination(TCOD_path_t path, int *x, int *y);
 void TCOD_path_delete(TCOD_path_t path);



typedef void *TCOD_dijkstra_t;

 TCOD_dijkstra_t TCOD_dijkstra_new (TCOD_map_t map, float diagonalCost);
 TCOD_dijkstra_t TCOD_dijkstra_new_using_function(int map_width, int map_height, TCOD_path_func_t func, void *user_data, float diagonalCost);
 void TCOD_dijkstra_compute (TCOD_dijkstra_t dijkstra, int root_x, int root_y);
 float TCOD_dijkstra_get_distance (TCOD_dijkstra_t dijkstra, int x, int y);
 bool TCOD_dijkstra_path_set (TCOD_dijkstra_t dijkstra, int x, int y);
 bool TCOD_dijkstra_is_empty(TCOD_dijkstra_t path);
 int TCOD_dijkstra_size(TCOD_dijkstra_t path);
 void TCOD_dijkstra_reverse(TCOD_dijkstra_t path);
 void TCOD_dijkstra_get(TCOD_dijkstra_t path, int index, int *x, int *y);
 bool TCOD_dijkstra_path_walk (TCOD_dijkstra_t dijkstra, int *x, int *y);
 void TCOD_dijkstra_delete (TCOD_dijkstra_t dijkstra);



typedef struct {
 int file_line, token_type, token_int_val, token_idx;
 float token_float_val;
 char *tok;
    int toklen;
 char lastStringDelim;
 char *pos;
 char *buf;
 char *filename;
 char *last_javadoc_comment;

 int nb_symbols, nb_keywords, flags;
 char symbols[ 100][ 5 ],
 keywords[ 100 ][ 20 ];
 const char *simpleCmt;
 const char *cmtStart, *cmtStop, *javadocCmtStart;
 const char *stringDelim;
 bool javadoc_read;
 bool allocBuf;
 bool savept;
} TCOD_lex_t;

 TCOD_lex_t *TCOD_lex_new_intern();
 TCOD_lex_t *TCOD_lex_new(const char **symbols, const char **keywords, const char *simpleComment,
  const char *commentStart, const char *commentStop, const char *javadocCommentStart, const char *stringDelim, int flags);
 void TCOD_lex_delete(TCOD_lex_t *lex);

 void TCOD_lex_set_data_buffer(TCOD_lex_t *lex,char *dat);
 bool TCOD_lex_set_data_file(TCOD_lex_t *lex,const char *filename);

 int TCOD_lex_parse(TCOD_lex_t *lex);
 int TCOD_lex_parse_until_token_type(TCOD_lex_t *lex,int token_type);
 int TCOD_lex_parse_until_token_value(TCOD_lex_t *lex,const char *token_value);

 bool TCOD_lex_expect_token_type(TCOD_lex_t *lex,int token_type);
 bool TCOD_lex_expect_token_value(TCOD_lex_t *lex,int token_type,const char *token_value);

 void TCOD_lex_savepoint(TCOD_lex_t *lex,TCOD_lex_t *savept);
 void TCOD_lex_restore(TCOD_lex_t *lex,TCOD_lex_t *savept);
 char *TCOD_lex_get_last_javadoc(TCOD_lex_t *lex);
 const char *TCOD_lex_get_token_name(int token_type);
 char *TCOD_lex_get_last_error();

 int TCOD_lex_hextoint(char c);



typedef enum {
 TCOD_TYPE_NONE,
 TCOD_TYPE_BOOL,
 TCOD_TYPE_CHAR,
 TCOD_TYPE_INT,
 TCOD_TYPE_FLOAT,
 TCOD_TYPE_STRING,
 TCOD_TYPE_COLOR,
 TCOD_TYPE_DICE,
 TCOD_TYPE_VALUELIST00,
 TCOD_TYPE_VALUELIST01,
 TCOD_TYPE_VALUELIST02,
 TCOD_TYPE_VALUELIST03,
 TCOD_TYPE_VALUELIST04,
 TCOD_TYPE_VALUELIST05,
 TCOD_TYPE_VALUELIST06,
 TCOD_TYPE_VALUELIST07,
 TCOD_TYPE_VALUELIST08,
 TCOD_TYPE_VALUELIST09,
 TCOD_TYPE_VALUELIST10,
 TCOD_TYPE_VALUELIST11,
 TCOD_TYPE_VALUELIST12,
 TCOD_TYPE_VALUELIST13,
 TCOD_TYPE_VALUELIST14,
 TCOD_TYPE_VALUELIST15,
 TCOD_TYPE_CUSTOM00,
 TCOD_TYPE_CUSTOM01,
 TCOD_TYPE_CUSTOM02,
 TCOD_TYPE_CUSTOM03,
 TCOD_TYPE_CUSTOM04,
 TCOD_TYPE_CUSTOM05,
 TCOD_TYPE_CUSTOM06,
 TCOD_TYPE_CUSTOM07,
 TCOD_TYPE_CUSTOM08,
 TCOD_TYPE_CUSTOM09,
 TCOD_TYPE_CUSTOM10,
 TCOD_TYPE_CUSTOM11,
 TCOD_TYPE_CUSTOM12,
 TCOD_TYPE_CUSTOM13,
 TCOD_TYPE_CUSTOM14,
 TCOD_TYPE_CUSTOM15,
 TCOD_TYPE_LIST=1024
} TCOD_value_type_t;


typedef union {
 bool b;
 char c;
 int32 i;
 float f;
 char *s;
 TCOD_color_t col;
 TCOD_dice_t dice;
 TCOD_list_t list;
 void *custom;
} TCOD_value_t;


typedef void *TCOD_parser_struct_t;
 const char *TCOD_struct_get_name(TCOD_parser_struct_t def);
 void TCOD_struct_add_property(TCOD_parser_struct_t def, const char *name,TCOD_value_type_t type, bool mandatory);
 void TCOD_struct_add_list_property(TCOD_parser_struct_t def, const char *name,TCOD_value_type_t type, bool mandatory);
 void TCOD_struct_add_value_list(TCOD_parser_struct_t def,const char *name, const char **value_list, bool mandatory);
 void TCOD_struct_add_value_list_sized(TCOD_parser_struct_t def,const char *name, const char **value_list, int size, bool mandatory);
 void TCOD_struct_add_flag(TCOD_parser_struct_t def,const char *propname);
 void TCOD_struct_add_structure(TCOD_parser_struct_t def,TCOD_parser_struct_t sub_structure);
 bool TCOD_struct_is_mandatory(TCOD_parser_struct_t def,const char *propname);
 TCOD_value_type_t TCOD_struct_get_type(TCOD_parser_struct_t def, const char *propname);



typedef struct {
 bool (*new_struct)(TCOD_parser_struct_t str,const char *name);
 bool (*new_flag)(const char *name);
 bool (*new_property)(const char *propname, TCOD_value_type_t type, TCOD_value_t value);
 bool (*end_struct)(TCOD_parser_struct_t str, const char *name);
 void (*error)(const char *msg);
} TCOD_parser_listener_t;


typedef TCOD_value_t (*TCOD_parser_custom_t)(TCOD_lex_t *lex, TCOD_parser_listener_t *listener, TCOD_parser_struct_t str, char *propname);


typedef void *TCOD_parser_t;

 TCOD_parser_t TCOD_parser_new();
 TCOD_parser_struct_t TCOD_parser_new_struct(TCOD_parser_t parser, char *name);
 TCOD_value_type_t TCOD_parser_new_custom_type(TCOD_parser_t parser,TCOD_parser_custom_t custom_type_parser);
 void TCOD_parser_run(TCOD_parser_t parser, const char *filename, TCOD_parser_listener_t *listener);
 void TCOD_parser_delete(TCOD_parser_t parser);

 void TCOD_parser_error(const char *msg, ...);

 bool TCOD_parser_has_property(TCOD_parser_t parser, const char *name);
 bool TCOD_parser_get_bool_property(TCOD_parser_t parser, const char *name);
 int TCOD_parser_get_char_property(TCOD_parser_t parser, const char *name);
 int TCOD_parser_get_int_property(TCOD_parser_t parser, const char *name);
 float TCOD_parser_get_float_property(TCOD_parser_t parser, const char *name);
 const char * TCOD_parser_get_string_property(TCOD_parser_t parser, const char *name);
 TCOD_color_t TCOD_parser_get_color_property(TCOD_parser_t parser, const char *name);
 TCOD_dice_t TCOD_parser_get_dice_property(TCOD_parser_t parser, const char *name);
 void TCOD_parser_get_dice_property_py(TCOD_parser_t parser, const char *name, TCOD_dice_t *dice);
 void * TCOD_parser_get_custom_property(TCOD_parser_t parser, const char *name);
 TCOD_list_t TCOD_parser_get_list_property(TCOD_parser_t parser, const char *name, TCOD_value_type_t type);



typedef struct {
 char *name;

 TCOD_list_t flags;

 TCOD_list_t props;

 TCOD_list_t lists;

 TCOD_list_t structs;
} TCOD_struct_int_t;

typedef struct {

 TCOD_list_t structs;

 TCOD_parser_custom_t customs[16];

 bool fatal;

 TCOD_list_t props;
} TCOD_parser_int_t;
 TCOD_value_t TCOD_parse_bool_value();
 TCOD_value_t TCOD_parse_char_value();
 TCOD_value_t TCOD_parse_integer_value();
 TCOD_value_t TCOD_parse_float_value();
 TCOD_value_t TCOD_parse_string_value();
 TCOD_value_t TCOD_parse_color_value();
 TCOD_value_t TCOD_parse_dice_value();
 TCOD_value_t TCOD_parse_value_list_value(TCOD_struct_int_t *def,int listnum);
 TCOD_value_t TCOD_parse_property_value(TCOD_parser_int_t *parser, TCOD_parser_struct_t def, char *propname, bool list);



typedef struct _TCOD_tree_t {
 struct _TCOD_tree_t *next;
 struct _TCOD_tree_t *father;
 struct _TCOD_tree_t *sons;
} TCOD_tree_t;

 TCOD_tree_t *TCOD_tree_new();
 void TCOD_tree_add_son(TCOD_tree_t *node, TCOD_tree_t *son);



typedef struct {
 TCOD_tree_t tree;
 int x,y,w,h;
 int position;
 uint8 level;
 bool horizontal;
} TCOD_bsp_t;

typedef bool (*TCOD_bsp_callback_t)(TCOD_bsp_t *node, void *userData);

 TCOD_bsp_t *TCOD_bsp_new();
 TCOD_bsp_t *TCOD_bsp_new_with_size(int x,int y,int w, int h);
 void TCOD_bsp_delete(TCOD_bsp_t *node);

 TCOD_bsp_t * TCOD_bsp_left(TCOD_bsp_t *node);
 TCOD_bsp_t * TCOD_bsp_right(TCOD_bsp_t *node);
 TCOD_bsp_t * TCOD_bsp_father(TCOD_bsp_t *node);

 bool TCOD_bsp_is_leaf(TCOD_bsp_t *node);
 bool TCOD_bsp_traverse_pre_order(TCOD_bsp_t *node, TCOD_bsp_callback_t listener, void *userData);
 bool TCOD_bsp_traverse_in_order(TCOD_bsp_t *node, TCOD_bsp_callback_t listener, void *userData);
 bool TCOD_bsp_traverse_post_order(TCOD_bsp_t *node, TCOD_bsp_callback_t listener, void *userData);
 bool TCOD_bsp_traverse_level_order(TCOD_bsp_t *node, TCOD_bsp_callback_t listener, void *userData);
 bool TCOD_bsp_traverse_inverted_level_order(TCOD_bsp_t *node, TCOD_bsp_callback_t listener, void *userData);
 bool TCOD_bsp_contains(TCOD_bsp_t *node, int x, int y);
 TCOD_bsp_t * TCOD_bsp_find_node(TCOD_bsp_t *node, int x, int y);
 void TCOD_bsp_resize(TCOD_bsp_t *node, int x,int y, int w, int h);
 void TCOD_bsp_split_once(TCOD_bsp_t *node, bool horizontal, int position);
 void TCOD_bsp_split_recursive(TCOD_bsp_t *node, TCOD_random_t randomizer, int nb,
  int minHSize, int minVSize, float maxHRatio, float maxVRatio);
 void TCOD_bsp_remove_sons(TCOD_bsp_t *node);



typedef struct {
 int w,h;
 float *values;
} TCOD_heightmap_t;

 TCOD_heightmap_t *TCOD_heightmap_new(int w,int h);
 void TCOD_heightmap_delete(TCOD_heightmap_t *hm);

 float TCOD_heightmap_get_value(const TCOD_heightmap_t *hm, int x, int y);
 float TCOD_heightmap_get_interpolated_value(const TCOD_heightmap_t *hm, float x, float y);
 void TCOD_heightmap_set_value(TCOD_heightmap_t *hm, int x, int y, float value);
 float TCOD_heightmap_get_slope(const TCOD_heightmap_t *hm, int x, int y);
 void TCOD_heightmap_get_normal(const TCOD_heightmap_t *hm, float x, float y, float n[3], float waterLevel);
 int TCOD_heightmap_count_cells(const TCOD_heightmap_t *hm, float min, float max);
 bool TCOD_heightmap_has_land_on_border(const TCOD_heightmap_t *hm, float waterLevel);
 void TCOD_heightmap_get_minmax(const TCOD_heightmap_t *hm, float *min, float *max);

 void TCOD_heightmap_copy(const TCOD_heightmap_t *hm_source,TCOD_heightmap_t *hm_dest);
 void TCOD_heightmap_add(TCOD_heightmap_t *hm, float value);
 void TCOD_heightmap_scale(TCOD_heightmap_t *hm, float value);
 void TCOD_heightmap_clamp(TCOD_heightmap_t *hm, float min, float max);
 void TCOD_heightmap_normalize(TCOD_heightmap_t *hm, float min, float max);
 void TCOD_heightmap_clear(TCOD_heightmap_t *hm);
 void TCOD_heightmap_lerp_hm(const TCOD_heightmap_t *hm1, const TCOD_heightmap_t *hm2, TCOD_heightmap_t *hmres, float coef);
 void TCOD_heightmap_add_hm(const TCOD_heightmap_t *hm1, const TCOD_heightmap_t *hm2, TCOD_heightmap_t *hmres);
 void TCOD_heightmap_multiply_hm(const TCOD_heightmap_t *hm1, const TCOD_heightmap_t *hm2, TCOD_heightmap_t *hmres);

 void TCOD_heightmap_add_hill(TCOD_heightmap_t *hm, float hx, float hy, float hradius, float hheight);
 void TCOD_heightmap_dig_hill(TCOD_heightmap_t *hm, float hx, float hy, float hradius, float hheight);
 void TCOD_heightmap_dig_bezier(TCOD_heightmap_t *hm, int px[4], int py[4], float startRadius, float startDepth, float endRadius, float endDepth);
 void TCOD_heightmap_rain_erosion(TCOD_heightmap_t *hm, int nbDrops,float erosionCoef,float sedimentationCoef,TCOD_random_t rnd);

 void TCOD_heightmap_kernel_transform(TCOD_heightmap_t *hm, int kernelsize, const int *dx, const int *dy, const float *weight, float minLevel,float maxLevel);
 void TCOD_heightmap_add_voronoi(TCOD_heightmap_t *hm, int nbPoints, int nbCoef, const float *coef,TCOD_random_t rnd);
 void TCOD_heightmap_mid_point_displacement(TCOD_heightmap_t *hm, TCOD_random_t rnd, float roughness);
 void TCOD_heightmap_add_fbm(TCOD_heightmap_t *hm, TCOD_noise_t noise,float mulx, float muly, float addx, float addy, float octaves, float delta, float scale);
 void TCOD_heightmap_scale_fbm(TCOD_heightmap_t *hm, TCOD_noise_t noise,float mulx, float muly, float addx, float addy, float octaves, float delta, float scale);
 void TCOD_heightmap_islandify(TCOD_heightmap_t *hm, float seaLevel,TCOD_random_t rnd);



typedef void *TCOD_zip_t;

 TCOD_zip_t TCOD_zip_new();
 void TCOD_zip_delete(TCOD_zip_t zip);


 void TCOD_zip_put_char(TCOD_zip_t zip, char val);
 void TCOD_zip_put_int(TCOD_zip_t zip, int val);
 void TCOD_zip_put_float(TCOD_zip_t zip, float val);
 void TCOD_zip_put_string(TCOD_zip_t zip, const char *val);
 void TCOD_zip_put_color(TCOD_zip_t zip, const TCOD_color_t val);
 void TCOD_zip_put_image(TCOD_zip_t zip, const TCOD_image_t val);
 void TCOD_zip_put_console(TCOD_zip_t zip, const TCOD_console_t val);
 void TCOD_zip_put_data(TCOD_zip_t zip, int nbBytes, const void *data);
 uint32 TCOD_zip_get_current_bytes(TCOD_zip_t zip);
 int TCOD_zip_save_to_file(TCOD_zip_t zip, const char *filename);


 int TCOD_zip_load_from_file(TCOD_zip_t zip, const char *filename);
 char TCOD_zip_get_char(TCOD_zip_t zip);
 int TCOD_zip_get_int(TCOD_zip_t zip);
 float TCOD_zip_get_float(TCOD_zip_t zip);
 const char *TCOD_zip_get_string(TCOD_zip_t zip);
 TCOD_color_t TCOD_zip_get_color(TCOD_zip_t zip);
 TCOD_image_t TCOD_zip_get_image(TCOD_zip_t zip);
 TCOD_console_t TCOD_zip_get_console(TCOD_zip_t zip);
 int TCOD_zip_get_data(TCOD_zip_t zip, int nbBytes, void *data);
 uint32 TCOD_zip_get_remaining_bytes(TCOD_zip_t zip);
 void TCOD_zip_skip_bytes(TCOD_zip_t zip, uint32 nbBytes);



typedef void * TCOD_namegen_t;


 void TCOD_namegen_parse (const char * filename, TCOD_random_t random);

 char * TCOD_namegen_generate (char * name, bool allocate);

 char * TCOD_namegen_generate_custom (char * name, char * rule, bool allocate);

 TCOD_list_t TCOD_namegen_get_sets (void);

 void TCOD_namegen_destroy (void);



typedef void * TCOD_text_t;

 TCOD_text_t TCOD_text_init(int x, int y, int w, int h, int max_chars);
 TCOD_text_t TCOD_text_init2(int w, int h, int max_chars);
 void TCOD_text_set_pos(TCOD_text_t txt, int x, int y);
 void TCOD_text_set_properties(TCOD_text_t txt, int cursor_char, int blink_interval, const char * prompt, int tab_size);
 void TCOD_text_set_colors(TCOD_text_t txt, TCOD_color_t fore, TCOD_color_t back, float back_transparency);
 bool TCOD_text_update(TCOD_text_t txt, TCOD_key_t key);
 void TCOD_text_render(TCOD_text_t txt, TCOD_console_t con);
 const char * TCOD_text_get(TCOD_text_t txt);
 void TCOD_text_reset(TCOD_text_t txt);
 void TCOD_text_delete(TCOD_text_t txt);
]]
local ffi=require("ffi")

ffi.cdef(header)
local tcodLib=ffi.load("libtcod.dll")
function parseEnum(w,tcod)
	for t in string.gmatch(w, "TCOD_[^,]+[,\n]") do
		local s=t:sub(1,-2)
		local name=string.match(s, "[^= ]+")
		--print("ENUM:",name:sub(6),name)
		if name then
			tcod[name:sub(6)]=tcodLib[name]
		end
	end
end
--[=[
	bugs:
		- namegen and color fails to parse due to a space before opening brace
		- structs are not parsed
		+ could be grouped and used as metatables
	]=]
function parseCdef(input) --todo real C parser...
	local tcod={}
	local defines={}
	for w in string.gmatch(input, "[^;]+") do
		if not w:find("typedef") then
			--print(w)
			local subSt=w:match("(TCOD_[^ ]+)%([^;]+")
			--print("SUBST:",subSt)
			if subSt  then
				local fullname=subSt
				local ns,name=string.match(fullname, "TCOD_(%a+)_([^%(]+)")
				if ns and ns~="" and name then --functions by namespace
					tcod[ns]=tcod[ns] or {}
					tcod[ns][name]=tcodLib[fullname]
					defines[tcodLib[fullname]]=w
				else
					--todo strange non-TCOD_NAMESPACE_NAME-functions
					--print("==",subSt)
				end
			else
				--todo enums and other crud
				if w:find("enum") then
					parseEnum(w,tcod)
				else
					local name=string.match(w, "const TCOD_color_t TCOD_([^;%[]+)")
					if name then --colors
						--print(w,name)
						tcod.color=tcod.color or {}
						tcod.color[name]=tcodLib["TCOD_"..name]
					else
						--print("--",w)
					end
				end
			end
		else
			if w:find("enum") then --enums, maybe group by type?
				parseEnum(w,tcod)
			else
				--print(w)
			end
		end
    end
	tcod.lib=tcodLib
	return tcod,defines
end
return parseCdef(header)
