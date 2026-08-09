// Centralized locale type — add new locales here
export type Locale = "ar" | "en";

// Human-readable locale labels for the language switcher
export const localeLabels: Record<Locale, string> = {
  ar: "العربية",
  en: "English",
};

// Text direction per locale
export const localeDir: Record<Locale, "rtl" | "ltr"> = {
  ar: "rtl",
  en: "ltr",
};
