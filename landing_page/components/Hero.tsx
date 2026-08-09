"use client";

import Image from "next/image";
import { useTranslations, useLocale } from "next-intl";
import { localeDir, Locale } from "@/i18n/locales";

export default function Hero() {
  const t = useTranslations("hero");
  const locale = useLocale() as Locale;
  const dir = localeDir[locale];
  const arrow = dir === "rtl" ? "←" : "→";

  return (
    <section className="w-full bg-paper-white py-12 md:py-24 px-6 md:px-12 max-w-[1200px] mx-auto overflow-hidden">
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-16 items-center">
        {/* Text & CTAs */}
        <div className="flex flex-col items-start space-y-8 max-w-[560px]">
          <h1 className="text-display text-ink-black tracking-tight uppercase">
            {t("title")}
          </h1>
          <p className="font-arial text-body text-graphite leading-relaxed">
            {t("description")}
          </p>
          <div className="flex flex-wrap gap-4 w-full">
            <a
              href="#features"
              className="bg-signal-purple hover:bg-signal-magenta text-paper-white font-sans text-sm md:text-base font-bold rounded-2xl py-3 px-6 transition-all duration-300 flex items-center gap-2"
            >
              {t("exploreFeatures")} <span className="text-lg">{arrow}</span>
            </a>
            <a
              href="#about"
              className="border border-ink-black text-ink-black hover:bg-ink-black hover:text-paper-white font-sans text-sm md:text-base font-bold rounded-2xl py-3 px-6 transition-all duration-300"
            >
              {t("learnMore")}
            </a>
          </div>
        </div>

        {/* Android Mockup with Blob */}
        <div className="relative w-full flex justify-center items-center py-8">
          <div className="absolute w-[300px] h-[300px] md:w-[450px] md:h-[450px] bg-signal-purple/20 blob-backing animate-[pulse_6s_infinite] -z-10 translate-x-4 -translate-y-4"></div>
          <div className="absolute w-[280px] h-[280px] md:w-[420px] md:h-[420px] bg-signal-magenta/25 blob-backing animate-[pulse_8s_infinite] -z-10 -translate-x-6 translate-y-6"></div>

          {/* Android Mockup Frame */}
          <div className="relative w-[280px] h-[570px] md:w-[310px] md:h-[630px] bg-ink-black rounded-[36px] p-[8px] shadow-[0_25px_50px_-12px_rgba(0,0,0,0.25)] border-[4px] border-ink-black ring-[1px] ring-ink-black/20">
            <div className="w-full h-full rounded-[28px] overflow-hidden bg-zinc-900 relative">
              <Image
                src="/app_screenshot.png"
                alt={t("screenshotAlt")}
                fill
                priority
                sizes="(max-width: 768px) 280px, 310px"
                className="object-cover object-top"
              />
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
