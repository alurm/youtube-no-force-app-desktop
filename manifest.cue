// This is needed as long as Firefox doesn't support background.service_worker.
// Example usage: cue export manifest.cue -t browser=chrome

#browser: _ @tag(browser)

name:             "Don't force desktop mode on synced YouTube tabs"
description:      "YouTube adds `&app=desktop` on a redirect from `m.youtube.com`, which makes the tab always open in desktop mode. This fixes that."
version:          "1.1"
manifest_version: 3
permissions: ["webNavigation"]
host_permissions: ["https://m.youtube.com/*"]
background: {type: "module"} & {
	#worker: "worker.js"
	chrome: service_worker: #worker
	firefox: scripts: [#worker]
}[#browser]
icons: "128": "icon.png"
homepage_url: "https://github.com/alurm/youtube-no-force-app-desktop"
