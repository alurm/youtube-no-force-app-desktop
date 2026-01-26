// Example usage: cue export manifest.cue -t browser=chrome

#browser: _ @tag(browser)

name: {
	chrome: "Don't force desktop mode on synced YouTube tabs"
	// As of 2026, Firefox requires name to be not longer than 45 characters.
	firefox: "No forced desktop mode on synced YouTube tabs"
}[#browser]
description:      "YouTube adds `&app=desktop` on a redirect from `m.youtube.com`, which makes the tab always open in desktop mode. This fixes that."
version:          "1.1"
manifest_version: 3
permissions: ["webNavigation"]
host_permissions: ["https://m.youtube.com/*"]
background: {type: "module"} & {
	#worker: "worker.js"
	chrome: service_worker: #worker
	// As of 2026, Firefox doesn't support background.service_worker.
	firefox: scripts: [#worker]
}[#browser]
icons: "128": "icon.png"
homepage_url: "https://github.com/alurm/youtube-no-force-app-desktop"
browser_specific_settings: gecko: {
	data_collection_permissions: required: ["none"]
	id: "@youtube-no-force-app-desktop.alurm"
}
