import Component from "@ember/component";
import { ajax } from "discourse/lib/ajax";

export default Component.extend({
  sender: "",
  receiver: "",
  subject: "",
  body: "",
  successMessage: "",
  errorMessage: "",

  actions: {
    sendMessage() {
      this.set("successMessage", "");
      this.set("errorMessage", "");

      ajax("/messages-broadcaster", {
        type: "POST",
        data: {
          sender: this.sender,
          receiver: this.receiver,
          subject: this.subject,
          body: this.body,
        },
      })
        .then((response) => {
          this.set("successMessage", "Message sent successfully!");
          this.set("sender", "");
          this.set("receiver", "");
          this.set("subject", "");
          this.set("body", "");
        })
        .catch((error) => {
          this.set("errorMessage", "Error sending message. Please try again.");
        });
    },
  },
});
