import { defineRouting } from "next-intl/routing";

export const routing = defineRouting({
  // All supported locales - add new languages here
  locales: ["ar", "en"],
  // Default locale
  defaultLocale: "ar",
  // Locale prefix strategy: "always" includes /ar/ or /en/ in URL
  localePrefix: "always",
});
