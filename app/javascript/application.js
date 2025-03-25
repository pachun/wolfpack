// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

// https://github.com/basecamp/local_time?tab=readme-ov-file#importmaps
import LocalTime from "local-time";
LocalTime.start();
document.addEventListener("turbo:morph", () => {
  LocalTime.run();
});
