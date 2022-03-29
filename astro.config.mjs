export default {
  // projectRoot: '.',     // Where to resolve all URLs relative to. Useful if you have a monorepo project.
  // pages: './src/pages', // Path to Astro components, pages, and data
  // dist: './dist',       // When running `astro build`, path to final static output
  // public: './public',   // A folder of static files Astro will copy to the root. Useful for favicons, images, and other files that don’t need processing.
  buildOptions: {
    site: "https://www.riddlebit.net", // Your public domain. Used to generate sitemaps and canonical URLs.
    sitemap: true, // Generate sitemap
  },
  devOptions: {
    hostname: "0.0.0.0", // The hostname to run the dev server on.
    port: 3000, // The port to run the dev server on.
  },
  renderers: ["@astrojs/renderer-svelte"],
};
