files := manifest.json icon.png worker.js

extension.zip: $(files); zip extension.zip $(files)
