// Copyright (c) 2009, ConTEXT Project Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
// Neither the name of ConTEXT Project Ltd nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

unit uMessages;

interface

{$I ConTEXT.inc}

const
  ML_MAIN_HINT_NOTDEFINED                 = 01000;
  ML_MAIN_CANNOT_EXPORT_TXT_FILES         = 01001;
  ML_MAIN_CLOSE_FILES                     = 01010;
  ML_MAIN_CLOSE_ALL_OPEN_FILES            = 01011;
  ML_MAIN_CONFIRM_CAPT                    = 01012;
  ML_MAIN_OVERWRITE_WARNING               = 01013;
  ML_MAIN_ACCESS_DENIED_ON_FILE           = 01014;

  ML_MAIN_TB_HINT_NEW                     = 01300;
  ML_MAIN_TB_HINT_OPEN                    = 01301;
  ML_MAIN_TB_HINT_SAVE                    = 01302;
  ML_MAIN_TB_HINT_SAVE_ALL                = 01303;
  ML_MAIN_TB_HINT_CLOSE                   = 01304;
  ML_MAIN_TB_HINT_PRINT                   = 01305;
  ML_MAIN_TB_HINT_PRINT_PREVIEW           = 01306;
  ML_MAIN_TB_HINT_CUT                     = 01307;
  ML_MAIN_TB_HINT_COPY                    = 01308;
  ML_MAIN_TB_HINT_PASTE                   = 01309;
  ML_MAIN_TB_HINT_UNDO                    = 01310;
  ML_MAIN_TB_HINT_REDO                    = 01311;
  ML_MAIN_TB_HINT_FIND                    = 01312;
  ML_MAIN_TB_HINT_FIND_NEXT               = 01313;
  ML_MAIN_TB_HINT_REPLACE                 = 01314;
  ML_MAIN_TB_HINT_WORDWRAP                = 01315;
  ML_MAIN_TB_HINT_STAY_ON_TOP             = 01316;
  ML_MAIN_TB_HINT_ACTIVE_HIGHLIGHTER      = 01317;
  ML_MAIN_TB_HINT_HELP                    = 01318;

  ML_CUSTTYP_EXT_EDIT_CAPTION             = 02000;
  ML_CUSTTYP_EXT_EDIT_TEXT                = 02001;

  ML_EDIT_MODIFIED                        = 03000;
  ML_EDIT_INSERT                          = 03001;
  ML_EDIT_OVERWRITE                       = 03002;
  ML_EDIT_RECORDING                       = 03003;
  ML_EDIT_SEL_NORMAL                      = 03004;
  ML_EDIT_SEL_COLUMN                      = 03005;
  ML_EDIT_FILE_SIZE                       = 03006;
  ML_EDIT_READONLY_MARKER                 = 03007;
  ML_EDIT_ERR_OPENING                     = 03010;
  ML_EDIT_ERR_SAVING                      = 03011;
  ML_EDIT_ERR_CAPTION                     = 03012;
  ML_EDIT_WARN_FILE_CHANGED               = 03013;
  ML_EDIT_WARN_FILE_DELETED               = 03014;
  ML_EDIT_WARN_FILE_NOT_SAVED             = 03015;
  ML_EDIT_ERR_SAVING_BACKUP               = 03016;
  ML_EDIT_READ_ONLY_WARNING               = 03017;
  ML_EDIT_GOTO_CAPTION                    = 03020;
  ML_EDIT_GOTO_TEXT                       = 03021;

  ML_FIND_CAPT_FIND                       = 04000;
  ML_FIND_CAPT_REPLACE                    = 04001;
  ML_FIND_FIND_BTN_CAPTION                = 04002;
  ML_FIND_FINDNEXT_BTN_CAPTION            = 04003;
  ML_FIND_NOT_FOUND                       = 04010;
  ML_FIND_REPLACE_REPORT                  = 04011;
  ML_FIND_MACROSTOP                       = 04012;
  ML_FIND_PANEL_CAPTION                   = 04020;

  ML_MACRO_SYNTAX_ERROR                   = 05100;
  ML_MACRO_ERR_SAVING                     = 05101;

  ML_MACROSTART_CAPT                      = 06500;
  ML_MACROEDIT_CAPT                       = 06501;
  ML_MACRO_SAVE_PROMPT                    = 06502;
  ML_MACRO_MANAGE_LV_CAPT_NAME            = 06510;
  ML_MACRO_MANAGE_LV_CAPT_SHORTCUT        = 06511;
  ML_MACRO_MANAGE_LV_CAPT_ENABLED         = 06512;

  ML_MACRO_START_HOTKEY_USED              = 07000;
  ML_MACRO_START_HOTKEY_DEFINED           = 07001;

  ML_OPT_USER_EXEC_KEYS                   = 08000;
  ML_OPT_USER_EXT_EDIT_CAPT               = 08001;
  ML_OPT_USER_EXT_EDIT_TEXT               = 08002;
  ML_OPT_USER_DEL_USR_CMD                 = 08003;
  ML_OPT_ASSOC_CAPT                       = 08010;
  ML_OPT_ASSOC_TEXT                       = 08011;
  ML_OPT_ASSOC_DEL                        = 08012;
  ML_OPT_LANGUAGE_CHANGE                  = 08013;
  ML_OPT_SELECT_BACKUP_DIR                = 08014;
  ML_OPT_ASSOC_EXEFILES_NOT_ALLOWED       = 08015;
  ML_OPT_ONSTART_NOTHING                  = 08020;
  ML_OPT_ONSTART_CREATE_BLANK_FILE        = 08021;
  ML_OPT_ONSTART_OPEN_LAST_FILE           = 08022;
  ML_OPT_CURSOR_SHAPE1                    = 08100;
  ML_OPT_CURSOR_SHAPE2                    = 08101;
  ML_OPT_CURSOR_SHAPE3                    = 08102;
  ML_OPT_CURSOR_SHAPE4                    = 08103;
  ML_OPT_FGBG_CAPT1                       = 08110;
  ML_OPT_FGBG_CAPT2                       = 08111;
  ML_OPT_TABSMODE1                        = 08125;
  ML_OPT_TABSMODE2                        = 08126;
  ML_OPT_KEYS_LV_COMMAND                  = 08200;
  ML_OPT_KEYS_LV_SHORTCUT                 = 08201;
  ML_OPT_KEYS_DEFAULT_WARNING             = 08205;
  ML_OPT_HELP_LV_FILETYPE                 = 08210;
  ML_OPT_HELP_LV_HELPFILE                 = 08211;
  ML_OPT_EXEC_SAVE_CURRENT                = 08300;
  ML_OPT_EXEC_SAVE_ALL                    = 08301;
  ML_OPT_EXEC_SAVE_NONE                   = 08302;

  ML_PRN_INVALID_NUM                      = 09000;
  ML_PRN_NO_DRIVER                        = 09010;
  ML_PRN_PAGE_NUM                         = 09020;
  ML_PRN_ZOOM1                            = 09030;
  ML_PRN_ZOOM2                            = 09031;
  ML_PRN_ZOOM3                            = 09032;
  ML_PRN_SPACING1                         = 09040;
  ML_PRN_SPACING2                         = 09041;
  ML_PRN_SPACING3                         = 09042;
  ML_PRN_SPACING4                         = 09043;
  ML_PRN_HINT_FIRST                       = 09050;
  ML_PRN_HINT_PREV                        = 09051;
  ML_PRN_HINT_NEXT                        = 09052;
  ML_PRN_HINT_LAST                        = 09053;
  ML_PRN_HINT_ZOOM                        = 09054;
  ML_PRN_HINT_PRINT                       = 09055;
  ML_PRN_HINT_PAGE_NUM                    = 09100;
  ML_PRN_HINT_TOTAL_PAGES                 = 09101;
  ML_PRN_HINT_TIME                        = 09102;
  ML_PRN_HINT_DATE                        = 09103;
  ML_PRN_HINT_FILENAME                    = 09104;
  ML_PRN_HINT_FONT                        = 09105;
  ML_PRN_HINT_BOLD                        = 09106;
  ML_PRN_HINT_ITALIC                      = 09107;
  ML_PRN_HINT_UNDERLINE                   = 09108;

  ML_USREXEC_ERR_CREATING_PIPE            = 10000;
  ML_USREXEC_ERR_EXEC_SUBPRG              = 10001;
  ML_USREXEC_ERR_PARAM_CAPT               = 10010;
  ML_USREXEC_ERR_PARAM_TEXT               = 10011;
  ML_USREXEC_ERR_NO_ASSOCIATON            = 10012;

  ML_USREXEC_EXECUTING                    = 10013;
  ML_USREXEC_FINISHED                     = 10014;
  ML_USREXEC_TERMINATED                   = 10015;
  ML_USREXEC_TERMINATE_CAPTION            = 10016;

  ML_USREXEC_FINISHED_DLG                 = 10020;
  ML_EXEC_POP_COPY                        = 10030;
  ML_EXEC_POP_CLEAR                       = 10031;
  ML_EXEC_POP_HIDE                        = 10032;
  ML_EXEC_POP_COPY_LINE                   = 10033;
  ML_EXEC_POP_COMPILER_JUMP_TO_LINE       = 10040;
  ML_USREXEC_PANEL_CAPTION                = 10050;

  ML_FILLBLOCK_CAPT                       = 11000;
  ML_FILLBLOCK_TEXT                       = 11001;

  ML_CODETEMPLATE_LV_NAME                 = 12000;
  ML_CODETEMPLATE_LV_DESCR                = 12001;

  ML_EXPL_HINT_ADD                        = 13000;
  ML_EXPL_HINT_REMOVE                     = 13001;
  ML_EXPL_HINT_OPEN                       = 13002;
  ML_EXPL_HINT_TOGGLEPATH                 = 13003;
  ML_EXPL_HINT_MOVEUP                     = 13004;
  ML_EXPL_HINT_MOVEDOWN                   = 13005;
  ML_EXPL_HINT_REMOVE_ALL                 = 13006;
  ML_EXPL_LARGE_ICONS                     = 13010;
  ML_EXPL_SMALL_ICONS                     = 13011;
  ML_EXPL_LIST                            = 13012;
  ML_EXPL_DETAILS                         = 13013;
  ML_EXPL_CAPT_FAVORITES                  = 13014;
  ML_EXPL_VIEWSTYLE                       = 13015;
  ML_EXPL_UPONELEVEL                      = 13016;
  ML_EXPL_FILTER                          = 13017;
  ML_EXPL_FILETREE                        = 13018;
  ML_FAV_ADD                              = 13020;
  ML_FAV_REMOVE                           = 13021;
  ML_FAV_OPEN                             = 13022;
  ML_FAV_SHOW_PATH                        = 13023;
  ML_FAV_MOVE_UP                          = 13024;
  ML_FAV_MOVE_DOWN                        = 13025;
  ML_FAV_REMOVE_ALL                       = 13026;
  ML_EXPL_CAPTION                         = 13050;
  ML_EXPL_PAGE_EXPLORER                   = 13051;
  ML_EXPL_PAGE_FAVORITES                  = 13052;
  ML_EXPL_PAGE_HISTORY                    = 13053;
  ML_EXPL_PAGE_PROJECT                    = 13054;

  ML_PRJFILES_HINT_ADD                    = 14000;
  ML_PRJFILES_HINT_ADD_CURRENT            = 14001;
  ML_PRJFILES_HINT_ADD_ALL                = 14002;
  ML_PRJFILES_HINT_REMOVE                 = 14003;
  ML_PRJFILES_HINT_OPEN_FILE              = 14004;
  ML_PRJFILES_HINT_CLOSE_FILE             = 14005;
  ML_PRJFILES_HINT_MOVE_UP                = 14006;
  ML_PRJFILES_HINT_MOVE_DN                = 14007;
  ML_PRJFILES_HINT_RELATIVE_TO            = 14008;
  ML_PRJFILES_HINT_SET_MAKEFILE           = 14009;
  ML_PRJFILES_CAPT_ADD_CURRENT            = 14020;
  ML_PRJFILES_CAPT_ADD_ALL                = 14021;
  ML_PRJFILES_CAPT_CLOSE                  = 14022;
  ML_PRJFILES_CAPT_SET_MAKEFILE           = 14023;
  ML_PRJFILES_CAPT_NEW_PRJ                = 14024;


implementation

end.
