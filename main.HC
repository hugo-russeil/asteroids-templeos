#include "./inputHandling.HC"

Keys keys;

U0 Main() {

  I64 sc;
  I64 arg1, arg2;

  // Setting up the window.
  SettingsPush;
  WinBorder;
  WinMax;
  DocCursor;
  DocClear;

  Seed;
  InitializeBullets;
  InitializeAsteroids;

  Fs->draw_it = &DrawIt;

  try {
    while (TRUE) {
      switch (GetMsg(&arg1, &arg2, 1 << MSG_KEY_DOWN | 1 << MSG_KEY_UP)) {
        case MSG_KEY_DOWN:
          switch (arg1) {
            case CH_SPACE: keys.space = TRUE; break;
            case CH_ESC: goto done;
            case 0:
              switch (arg2.u8[0]) {
                case SC_CURSOR_UP: keys.up = TRUE; break;
                case SC_CURSOR_DOWN: keys.down = TRUE; break;
                case SC_CURSOR_LEFT: keys.left = TRUE; break;
                case SC_CURSOR_RIGHT: keys.right = TRUE; break;
              }
              break;
          }
          break;

        case MSG_KEY_UP:
          switch (arg1) {
            case CH_SPACE: keys.space = FALSE; break;
            case 0:
              switch (arg2.u8[0]) {
                case SC_CURSOR_UP: keys.up = FALSE; break;
                case SC_CURSOR_DOWN: keys.down = FALSE; break;
                case SC_CURSOR_LEFT: keys.left = FALSE; break;
                case SC_CURSOR_RIGHT: keys.right = FALSE; break;
              }
              break;
          }
          break;
      }
      HandleInput(&keys);
      ActivateAsteroid;
    }
  done:
  }

  catch {
    PutExcept;
    SettingsPop;
    MenuPop;
  }
  return;
}

Main;
