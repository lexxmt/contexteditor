XPTheme.pas v1.0 (2001-12-26)
by Jordan Russell, www.jrsoftware.org

This unit enables support for Windows XP visual styles in Delphi
applications.


To use
======

In your project's .dpr file, add XPTheme to the top of the "uses" list.


Notes
=====

- If you use TListView in vsReport mode, you will need to make a change to
  your VCL sources, or else you'll get access violations. Copy ComCtrls.pas
  to your project's directory (or some other directory in your Search Path
  that has precedence over delphi\source\vcl) and change these two lines:

      if FImageIndex <> -1 then
        fmt := fmt or LVCFMT_IMAGE or LVCFMT_COL_HAS_IMAGES;

  to:

      if FImageIndex <> -1 then
        fmt := fmt or LVCFMT_IMAGE or LVCFMT_COL_HAS_IMAGES
      else
        mask := mask and not LVCF_IMAGE;

- If you use TStatusBar, the size grip part may get corrupted when you resize
  the form at run-time. You can work around this by creating an OnResize
  event handler on the TStatusBar with this code:

  procedure TForm1.StatusBar1Resize(Sender: TObject);
  begin
    if StatusBar1.HandleAllocated then
     InvalidateRect(StatusBar1.Handle, nil, True);
  end;

- For more information, see:
  http://msdn.microsoft.com/library/en-us/shellcc/platform/commctls/userex/overview/cookbook.asp
