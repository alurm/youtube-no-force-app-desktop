# Don't force the desktop mode on synced YouTube tabs

As of 2026, YouTube adds the "app=desktop" query parameter when redirecting from its mobile website. It forces the tab to use the desktop version of the site.

This is very annoying to deal with when the tab is synced and opened on mobile:

1) On mobile, the m.youtube.com mobile version is opened.
2) On desktop, m. is removed and app=desktop is added.
3) On mobile, the desktop version of the site is opened (the annoying part).

This small browser extension stops YouTube from forcing desktop mode on synced tabs by removing thie app=desktop query parameter.

## Installation instructions

1) Open chrome://extensions.
2) Enable "Developer mode" switch.
3) Clone this code.
4) Load the folder with the "Load unpacked" button.
