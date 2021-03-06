// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "src/chat";
import "src/chatra_update";
import "src/chaport_update";

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

import 'stylesheets/bs4'

const application = Application.start()
const context = require.context("../controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
