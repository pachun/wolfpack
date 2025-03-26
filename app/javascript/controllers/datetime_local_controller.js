import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { datetime: String };

  connect() {
    const utcDate = new Date(this.datetimeValue);

    // Convert to local time for display
    const local = new Date(
      utcDate.getTime() - utcDate.getTimezoneOffset() * 60000,
    );
    this.element.value = local.toISOString().slice(0, 16);

    // Convert back to UTC before submit
    this.element.form?.addEventListener("submit", () => {
      const localDate = new Date(this.element.value);
      const utcString = localDate.toISOString().slice(0, 16);
      this.element.value = utcString;
    });
  }
}
