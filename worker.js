// Previous attempt tried to remove app=desktop directly.
// app=desktop was added by YouTube while redirecting from m.youtube.com.
// This didn't work for background tabs for some reason.
// Also, this didn't reliably work with foreground tabs.
// This may be result of bugs.
// Either way, now we try to rewrite m.youtube.com to youtube.com instead, which seems to be more reliable.

chrome.webNavigation.onBeforeNavigate.addListener(
  async ({ frameId, tabId, url }) => {
    // We do not care about subframes, I think.
    if (frameId != 0) return

    url = new URL(url)
    // As of 2026, www.youtube.com requires one less redirect than youtube.com.
    url.hostname = 'www.youtube.com'
    await chrome.tabs.update(tabId, { url: url.toString() })
  },

  // There are the filters.
  // We want to trigger only on `m.youtube.com`.
  {
    url: [
      {
        hostEquals: 'm.youtube.com'
      }
    ]
  }
)
