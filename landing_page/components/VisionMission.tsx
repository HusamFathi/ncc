"use client";

import { useTranslations, useLocale } from "next-intl";
import { localeDir, Locale } from "@/i18n/locales";

export default function VisionMission() {
  const t = useTranslations("about");
  const locale = useLocale() as Locale;
  const dir = localeDir[locale];
  const arrow = dir === "rtl" ? "←" : "→";

  return (
    <section
      id="about"
      className="w-full bg-paper-white py-20 px-6 md:px-12 max-w-[1200px] mx-auto border-t border-ink-black/5"
    >
      <div className="flex flex-col space-y-12">
        {/* Header */}
        <div className="max-w-[700px] flex flex-col space-y-4">
          <span className="text-xs uppercase font-bold tracking-widest text-signal-purple">
            {t("tag")}
          </span>
          <h2 className="text-4xl md:text-5xl font-black text-ink-black uppercase leading-tight">
            {t("title")}
          </h2>
          <p className="font-arial text-sm text-graphite leading-relaxed">
            {t("description")}
          </p>
        </div>

        {/* Cards Grid */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 md:gap-8">
          {/* Vision */}
          <div className="bg-paper-white rounded-lg border border-ink-black p-6 md:p-8 flex flex-col justify-between hover:border-signal-purple transition-colors duration-300">
            <div>
              <div className="w-8 h-8 rounded-full bg-signal-purple/10 flex items-center justify-center text-signal-purple font-black mb-6">
                {t("vision.label")}
              </div>
              <h3 className="font-sans text-xl font-extrabold uppercase text-ink-black mb-4">
                {t("vision.title")}
              </h3>
              <p className="font-arial text-sm text-graphite leading-relaxed">
                {t("vision.description")}
              </p>
            </div>
            <div className="mt-8 pt-4 border-t border-ink-black/5 flex items-center text-xs font-semibold text-signal-purple uppercase">
              {t("vision.link")} <span className="mx-1">{arrow}</span>
            </div>
          </div>

          {/* Mission */}
          <div className="bg-paper-white rounded-lg border border-ink-black p-6 md:p-8 flex flex-col justify-between hover:border-signal-purple transition-colors duration-300">
            <div>
              <div className="w-8 h-8 rounded-full bg-signal-magenta/10 flex items-center justify-center text-signal-magenta font-black mb-6">
                {t("mission.label")}
              </div>
              <h3 className="font-sans text-xl font-extrabold uppercase text-ink-black mb-4">
                {t("mission.title")}
              </h3>
              <p className="font-arial text-sm text-graphite leading-relaxed">
                {t("mission.description")}
              </p>
            </div>
            <div className="mt-8 pt-4 border-t border-ink-black/5 flex items-center text-xs font-semibold text-signal-magenta uppercase">
              {t("mission.link")} <span className="mx-1">{arrow}</span>
            </div>
          </div>

          {/* Goals */}
          <div className="bg-paper-white rounded-lg border border-ink-black p-6 md:p-8 flex flex-col justify-between hover:border-signal-purple transition-colors duration-300">
            <div>
              <div className="w-8 h-8 rounded-full bg-signal-coral/10 flex items-center justify-center text-signal-coral font-black mb-6">
                {t("goals.label")}
              </div>
              <h3 className="font-sans text-xl font-extrabold uppercase text-ink-black mb-4">
                {t("goals.title")}
              </h3>
              <p className="font-arial text-sm text-graphite leading-relaxed">
                {t("goals.description")}
              </p>
            </div>
            <div className="mt-8 pt-4 border-t border-ink-black/5 flex items-center text-xs font-semibold text-signal-coral uppercase">
              {t("goals.link")} <span className="mx-1">{arrow}</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
