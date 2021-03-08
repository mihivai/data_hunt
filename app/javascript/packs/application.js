require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";

// Internal imports
import '../components/cookies'
import { hackerAnimation, hackerConsole } from '../components/hacker'
import { chartPlot } from '../components/chart'

document.addEventListener('turbolinks:load', () => {
  hackerConsole();
  hackerAnimation();
  chartPlot();
});
