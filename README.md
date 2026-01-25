# Don't force desktop mode on synced YouTube tabs

YouTube adds `&app=desktop` on a redirect from `m.youtube.com`, which makes the tab always open in desktop mode. This fixes that.

Here's how the problem occurs:

1) On mobile, a `m.youtube.com` tab is opened.
2) The same tab is opened on desktop.
3) YouTube redirects `m.youtube.com` to `www.youtube.com` and adds the `app=desktop` query parameter.
4) The same tab is opened on mobile.
5) The query parameter is never removed, so the desktop mode of the site is loaded.

This browser extension prevents `app=desktop` from being added by redirecting from `m.youtube.com` to `www.youtube.com` directly.

## Installation

### Chrome

Visit the Chrome web store page: https://chromewebstore.google.com/detail/dont-force-desktop-mode-o/jkmnboelmllcdpijkgigpifgihfjdbnf

Or, you can do it manually:

1) Open chrome://extensions.
2) Enable "Developer mode" switch.
3) Clone this code.
4) Load the folder with the "Load unpacked" button.
