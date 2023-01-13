// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import $ from 'jquery'
import * as datatables from 'datatables.net-bs4'

require('./taxpayer-datatable')
require('./company-datatable')
require('./user-datatable')

global.$ = jQuery;
global.toastr = require("toastr")
