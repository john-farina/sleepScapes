# Pin npm packages by running ./bin/importmap
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "howler", to: "https://ga.jspm.io/npm:howler@2.2.3/dist/howler.js"
pin "swup", to: "https://ga.jspm.io/npm:swup@2.0.19/lib/index.js"
pin "delegate-it", to: "https://ga.jspm.io/npm:delegate-it@3.0.1/index.js"
