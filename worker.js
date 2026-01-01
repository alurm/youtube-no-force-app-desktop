chrome.webNavigation.onBeforeNavigate.addListener(
  async ({ frameId, tabId, url }) => {
    // We do not care about subframes, I think.
    if (frameId != 0) return

    url = new URL(url)

    // Delete app=desktop.
    if (url.searchParams.get('app') === 'desktop') {
      // Sadly this doesn't signal if something has been deleted.
      // So that's why a separate check is required.
      url.searchParams.delete('app', 'desktop')
      await chrome.tabs.update(tabId, { url: url.toString() })
    }
  },

  // Filters: trigger only on youtube.com.
  {
    url: [
      {
        hostSuffix: 'youtube.com'
      }
    ]
  }
)
