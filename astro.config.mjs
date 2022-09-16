import { defineConfig } from "astro/config";
import svelte from "@astrojs/svelte";

export default defineConfig({
  site: "https://www.riddlebit.net",
  server: {
    port: 3000,
    host: true
  },
  integrations: [svelte()]
});