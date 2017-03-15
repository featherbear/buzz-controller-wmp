;/*************************/;
;/*    Buzz Controller    */;
;/*************************/;
;/* O - BUTTON_CIRCLE - 1 */;
;/* = - BUTTON_BLUE   - 5 */;
;/* = - BUTTON_ORANGE - 4 */;
;/* = - BUTTON_GREEN  - 3 */;
;/* = - BUTTON_YELLOW - 2 */;
;/*************************/;

; http://www.autohotkey.com/docs/commands/PostMessage.htm
; PostMessage, Msg [, wParam, lParam, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]
SetTitleMatchMode, 2
MediaPlayerTitle=Windows Media Player 
1Joy1::
  PostMessage, 0x111, 32808, 0,,%MediaPlayerTitle%  ; Play/Pause Track
  return
1Joy5::
  PostMessage, 0x111, 32811, 0,,%MediaPlayerTitle%  ; Next Track
  return
1Joy4::
  PostMessage, 0x111, 32810, 0,,%MediaPlayerTitle%  ; Previous Track
  return
1Joy3::
  PostMessage, 0x111, 32815, 0,,%MediaPlayerTitle%  ; Volume Up
  SetTimer, WaitFor1Joy3, 150
  return
1Joy2::
  PostMessage, 0x111, 32816, 0,,%MediaPlayerTitle%  ; Volume Down
  SetTimer, WaitFor1Joy2, 150
  return


WaitFor1Joy3:
if not GetKeyState("1Joy3")  ; The button has been released.
{
    SetTimer, WaitFor1Joy3, off  ; Stop monitoring the button.
    return
}
; Since above didn't "return", the button is still being held down.
PostMessage, 0x111, 32815, 0,,%MediaPlayerTitle%  ; Volume Up
return

WaitFor1Joy2:
if not GetKeyState("1Joy2")  ; The button has been released.
{
    SetTimer, WaitFor1Joy2, off  ; Stop monitoring the button.
    return
}
; Since above didn't "return", the button is still being held down.
PostMessage, 0x111, 32816, 0,,%MediaPlayerTitle%  ; Volume Down
return