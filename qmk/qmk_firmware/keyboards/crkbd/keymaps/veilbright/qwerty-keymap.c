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

// Left hand Beakl home row
#define LSFT_A LSFT_T(KC_A)
#define LCTL_E LCTL_T(KC_E)
#define LALT_I LALT_T(KC_I)
#define LGUI_H LGUI_T(KC_H)

// Right hand Beakl home row
#define ISFT_T RSFT_T(KC_T)
#define RCTL_R RCTL_T(KC_R)
#define RALT_N RALT_T(KC_N)
#define RGUI_W RGUI_T(KC_W)

// Thumb Layers
#define FUNC_TAB LT(FUNCTION, KC_TAB)
#define NAV_ENT LT(NAV, KC_ENT)
#define NUM_ESC LT(NUMBER, KC_ESC)
#define SYM_S LT(SYMBOL, KC_S)
#define SYM_TAB LT(SYMBOL, KC_TAB)
#define MOUS_ENT LT(MOUSE, KC_ENT)

// Left hand Symbol home row
#define LSFT_LC LSFT_T(KC_LCBR)
#define LCTL_QT LCTL_T(KC_QUOT)
#define LALT_MN LALT_T(KC_MINS)
#define LGUI_LT LGUI_T(KC_LT)

// Right hand Symbol home row
#define RSFT_CL RSFT_T(KC_COLN)
#define RCTL_DQ RCTL_T(KC_DQUO)
#define RALT_PL RALT_T(KC_PLUS)
#define RGUI_GT RGUI_T(KC_GT)

// Left hand Number home row
#define LSFT_3 LSFT_T(KC_3)
#define LCTL_2 LCTL_T(KC_2)
#define LALT_1 LALT_T(KC_1)
#define LGUI_7 LGUI_T(KC_7)

// Right hand Number home row
#define RSFT_4 RSFT_T(KC_4)
#define RCTL_5 RCTL_T(KC_5)
#define RALT_6 RALT_T(KC_6)
#define RGUI_9 RGUI_T(KC_9)

enum layers_names { BASE, SYM, FUNC, NAV, MOUSE };

const key_override_t *key_overrides[] = {};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [BASE] = LAYOUT_split_3x6_3(
           KC_ESC,     KC_Q,     KC_W,     KC_E,     KC_R,     KC_T,/*|*/      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P, OSL(FUNC),
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
           KC_TAB,     KC_A,     KC_S,     KC_D,     KC_F,     KC_G,/*|*/      KC_H,     KC_J,     KC_K,     KC_L,  KC_SCLN, KC_QUOT,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          KC_LCTL,     KC_Z,     KC_X,     KC_C,     KC_V,     KC_B,/*|*/      KC_N,     KC_M,  KC_COMM,   KC_DOT,  KC_SLSH, KC_LALT,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                                        KC_LSFT,   KC_SPC,  NAV_ENT,/*|*/   KC_BSPC,  MO(SYM),  KC_RSFT
    ),
    [SYM] = LAYOUT_split_3x6_3(
          _______,     KC_1,     KC_2,     KC_3,     KC_4,    KC_5, /*|*/      KC_6,    KC_7,     KC_8,     KC_9,     KC_0, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  KC_PAST,  KC_PMNS,  KC_PPLS,   KC_EQL, KC_AMPR, /*|*/   KC_EXLM,  KC_LPRN,  KC_LCBR,  KC_LBRC,  KC_UNDS, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  KC_HASH,  KC_PIPE,  KC_PERC,  KC_BSLS,   KC_AT, /*|*/   _______,   KC_DLR,  KC_CIRC,  KC_TILD,   KC_GRV, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                                         _______, _______, _______, /*|*/ _______, _______, _______
    ),
    [FUNC] = LAYOUT_split_3x6_3(
          _______,    KC_F1,    KC_F2,    KC_F3,    KC_F4,   KC_F5, /*|*/     KC_F6,    KC_F7,    KC_F8,    KC_F9,   KC_F10, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,   KC_F11,   KC_F12,  _______,  _______, _______, /*|*/   _______,  _______,  _______,  _______,  _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  _______,  _______,  _______,  _______, _______, /*|*/   _______,  _______,  _______,  _______,  _______,  _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                                         _______, _______, _______, /*|*/   _______,  _______,  _______
    ),
    [NAV] = LAYOUT_split_3x6_3(
          _______,  _______,  _______,  _______,  _______, _______, /*|*/   _______,   KC_PGUP, KC_WH_U,  KC_HOME,  _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  _______,  _______,  _______,  _______, _______, /*|*/   KC_LEFT,  KC_DOWN,    KC_UP, KC_RIGHT,  _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
          _______,  _______,  _______,  _______,  _______, _______, /*|*/   _______,  KC_PGDN,  KC_WH_D,   KC_END,  _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                                        _______,  _______, _______, /*|*/   _______,MO(MOUSE), _______
    ),
    [MOUSE] = LAYOUT_split_3x6_3(
        _______, _______, _______, _______, _______, _______, /*|*/ _______, _______, _______, _______, _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
        _______, _______, KC_BTN3, KC_BTN2, KC_BTN1, _______, /*|*/ KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
        _______, _______, _______, _______, _______, _______, /*|*/ _______, KC_BTN1, KC_BTN2, KC_BTN3, _______, _______,
        /* - - - | - - - - | - - - - | - - - - | - - - - | - - - - -  |  - - - - - | - - - - | - - - - | - - - - | - - - - | - - - */
                                _______, _______, _______, /*|*/ _______, _______, _______
    ),
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
