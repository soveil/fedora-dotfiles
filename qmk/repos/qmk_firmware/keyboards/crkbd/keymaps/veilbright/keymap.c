/*
Copyright 2019 @foostan
Copyright 2020 Drashna Jaelre <@drashna>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H

// Thumb Layers
#define NAV_ENT LT(NAV, KC_ENT)

// Home Row Mods
#define CTL_F LCTL_T(KC_F)
#define GUI_D LGUI_T(KC_D)
#define ALT_S LALT_T(KC_S)

#define CTL_M    RCTL_T(KC_M)
#define GUI_COMM RGUI_T(KC_COMM)
#define ALT_DOT  LALT_T(KC_DOT)

#define CTL_EQL LCTL_T(KC_EQL)
#define GUI_PLS LGUI_T(KC_PPLS)
#define ALT_MNS LALT_T(KC_PMNS)

#define CTL_7 RCTL_T(KC_7)
#define GUI_8 RGUI_T(KC_8)
#define ALT_9 LALT_T(KC_9)


// Key Overrides
const key_override_t paren_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_LPRN, KC_RPRN);
const key_override_t curly_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_LCBR, KC_RCBR);
const key_override_t bracket_key_override = ko_make_basic(MOD_MASK_SHIFT, KC_LBRC, KC_RBRC);

// This globally defines all key overrides to be used
const key_override_t *key_overrides[] = {
	&paren_key_override,
    &curly_key_override,
    &bracket_key_override
};


// Chord Handedness
const char chordal_hold_layout[MATRIX_ROWS][MATRIX_COLS] PROGMEM =
    LAYOUT(
        'L', 'L', 'L', 'L', 'L', 'L',  'R', 'R', 'R', 'R', 'R', 'R', 
        'L', 'L', 'L', 'L', 'L', 'L',  'R', 'R', 'R', 'R', 'R', 'R', 
        'L', 'L', 'L', 'L', 'L', 'L',  'R', 'R', 'R', 'R', 'R', 'R', 
                       'L', 'L', 'L',  'R', 'R', 'R'
    );


enum layers_names { BASE, SYM, GUI, FUNC };

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [BASE] = LAYOUT_split_3x6_3(
           KC_ESC,     KC_Q,     KC_W,     KC_E,     KC_R,     KC_T,/*|*/      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P, OSL(FUNC),
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
           KC_TAB,     KC_A,     KC_S,     KC_D,     KC_F,     KC_G,/*|*/      KC_H,     KC_J,     KC_K,     KC_L,  KC_SCLN, KC_QUOT,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          KC_LCTL,     KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,/*|*/      KC_N,     KC_M,  KC_COMM,   KC_DOT,  KC_SLSH, KC_LALT,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                             LM(GUI, MOD_LGUI),   KC_SPC,  MO(SYM),/*|*/   KC_BSPC,  KC_LSFT,   KC_ENT
    ),
    [SYM] = LAYOUT_split_3x6_3(
            KC_AT,     KC_1,     KC_2,     KC_3,     KC_4,    KC_5, /*|*/      KC_6,     KC_7,     KC_8,     KC_9,     KC_0,  KC_DEL,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
           KC_GRV,  KC_PAST,  KC_MINS,  KC_PLUS,   KC_EQL, KC_AMPR, /*|*/   KC_LEFT,  KC_DOWN,    KC_UP, KC_RIGHT,  KC_UNDS, KC_CIRC,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  KC_EXLM,  KC_LBRC,  KC_LCBR,  KC_LPRN, KC_HASH, /*|*/   KC_PERC,  KC_PIPE,  KC_BSLS,   KC_DLR,  KC_TILD, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                                         _______, _______, _______, /*|*/   _______,  _______,  _______
    ),
    [GUI] = LAYOUT_split_3x6_3(
          _______,     KC_1,     KC_2,     KC_3,     KC_4,    KC_5, /*|*/      KC_6,     KC_7,     KC_8,     KC_9,    KC_0, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  _______,  _______,  _______,  _______, _______, /*|*/   _______,  _______,  _______,  _______,  _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  _______,  _______,  _______,  _______, _______, /*|*/   _______,  _______,  _______,  _______,  _______,  _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                                         _______, _______, _______, /*|*/   _______,  _______,  _______
    ),
    // [BASE] = LAYOUT_split_3x6_3(
    //        KC_ESC,     KC_Q,     KC_W,     KC_E,     KC_R,     KC_T,/*|*/      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P, OSL(FUNC),
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //        KC_TAB,     KC_A,    ALT_S,    GUI_D,    CTL_F,     KC_G,/*|*/      KC_H,     KC_J,     KC_K,     KC_L,  KC_SCLN, KC_QUOT,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //       _______,     KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,/*|*/      KC_N,    CTL_M, GUI_COMM,  ALT_DOT,  KC_SLSH, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //                                     MO(NAV),   KC_SPC,  MO(SYM),/*|*/   KC_BSPC,  KC_LSFT,   KC_ENT
    // ),
    // [SYM] = LAYOUT_split_3x6_3(
    //       _______,   KC_GRV,  KC_LBRC,  KC_LCBR,  KC_LPRN, KC_BSLS, /*|*/   KC_EXLM,  KC_1,  KC_2,  KC_3,   KC_NUM, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //       _______,  KC_PAST,  ALT_MNS,  GUI_PLS,  CTL_EQL, KC_AMPR, /*|*/   KC_PIPE,  KC_4,  KC_5,  KC_6,  KC_UNDS, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //       _______,    KC_AT,  KC_TILD,  KC_CIRC,   KC_DLR, KC_HASH, /*|*/   KC_PERC,    CTL_7,    GUI_8,    ALT_9,  _______, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //                                      _______, _______, _______, /*|*/   _______,  _______,  KC_0
    // ),
    [FUNC] = LAYOUT_split_3x6_3(
          _______,    KC_F1,    KC_F2,    KC_F3,    KC_F4,   KC_F5, /*|*/     KC_F6,    KC_F7,    KC_F8,    KC_F9,   KC_F10, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,   KC_F11,   KC_F12,  _______,  _______, _______, /*|*/   _______,  _______,  _______,  _______,  _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  _______,  _______,  _______,  _______, _______, /*|*/   _______,  _______,  _______,  _______,  _______,  _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                                         _______, _______, _______, /*|*/   _______,  _______,  _______
    ),
    // [NAV] = LAYOUT_split_3x6_3(
    //       _______,  _______,  _______,  _______,  _______, _______, /*|*/   _______,   KC_PGUP, KC_WH_U,  KC_HOME,  _______, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //       _______,  _______,  _______,  _______,  _______, _______, /*|*/   KC_LEFT,  KC_DOWN,    KC_UP, KC_RIGHT,  _______, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //       _______,  _______,  _______,  _______,  _______, _______, /*|*/   _______,  KC_PGDN,  KC_WH_D,   KC_END,  _______, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //                                     _______,  _______, _______, /*|*/   _______,MO(MOUSE), _______
    // ),
    // [MOUSE] = LAYOUT_split_3x6_3(
    //     _______, _______, _______, _______, _______, _______, /*|*/ _______, _______, _______, _______, _______, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //     _______, _______, KC_BTN3, KC_BTN2, KC_BTN1, _______, /*|*/ KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, _______, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //     _______, _______, _______, _______, _______, _______, /*|*/ _______, KC_BTN1, KC_BTN2, KC_BTN3, _______, _______,
    //     /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
    //                             _______, _______, _______, /*|*/ _______, _______, _______
    // ),
};

#ifdef ENCODER_MAP_ENABLE
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
    [0] =
        {
            ENCODER_CCW_CW(KC_VOLD, KC_VOLU),
            ENCODER_CCW_CW(KC_MPRV, KC_MNXT),
            ENCODER_CCW_CW(RM_VALD, RM_VALU),
            ENCODER_CCW_CW(KC_RGHT, KC_LEFT),
        },
    [1] =
        {
            ENCODER_CCW_CW(KC_VOLD, KC_VOLU),
            ENCODER_CCW_CW(KC_MPRV, KC_MNXT),
            ENCODER_CCW_CW(RM_VALD, RM_VALU),
            ENCODER_CCW_CW(KC_RGHT, KC_LEFT),
        },
    [2] =
        {
            ENCODER_CCW_CW(KC_VOLD, KC_VOLU),
            ENCODER_CCW_CW(KC_MPRV, KC_MNXT),
            ENCODER_CCW_CW(RM_VALD, RM_VALU),
            ENCODER_CCW_CW(KC_RGHT, KC_LEFT),
        },
    [3] =
        {
            ENCODER_CCW_CW(KC_VOLD, KC_VOLU),
            ENCODER_CCW_CW(KC_MPRV, KC_MNXT),
            ENCODER_CCW_CW(RM_VALD, RM_VALU),
            ENCODER_CCW_CW(KC_RGHT, KC_LEFT),
        },
};
#endif
