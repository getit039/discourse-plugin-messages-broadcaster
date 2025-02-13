import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "message-form",

  initialize(container) {
    withPluginApi("0.8", (api) => {
      api.decorateWidget("header-icons:before", (helper) => {
        return helper.attach("message-form");
      });
    });
  },
};
