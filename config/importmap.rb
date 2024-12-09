# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flowbite" # @2.5.2
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin "flowbite-datepicker" # @1.3.0
