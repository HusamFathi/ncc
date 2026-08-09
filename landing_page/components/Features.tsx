"use client";

import { useTranslations } from "next-intl";

export default function Features() {
  const t = useTranslations("features");

  return (
    <section
      id="features"
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

        {/* Features Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {/* Feature 1: Background Playback */}
          <div className="bg-paper-white rounded-lg border border-ink-black p-6 md:p-8 flex gap-6 items-start hover:border-signal-purple transition-all duration-300">
            <div className="w-12 h-12 rounded-xl bg-signal-purple/10 flex items-center justify-center text-signal-purple shrink-0">
              <svg className="w-7 h-7" fill="none" stroke="currentColor" strokeWidth="2.5" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" d="M19.114 5.636a9 9 0 010 12.728M16.463 8.288a5.25 5.25 0 010 7.424M6.75 8.25l4.72-4.72a.75.75 0 011.28.53v15.88a.75.75 0 01-1.28.53l-4.72-4.72H4.51c-.88 0-1.704-.507-1.938-1.354A9.01 9.01 0 012.25 12c0-.83.112-1.633.322-2.396C2.806 8.756 3.63 8.25 4.51 8.25H6.75z" />
              </svg>
            </div>
            <div className="flex flex-col space-y-2">
              <h3 className="font-sans text-lg font-extrabold uppercase text-ink-black">
                {t("backgroundPlayback.title")}
              </h3>
              <p className="font-arial text-sm text-graphite leading-relaxed">
                {t("backgroundPlayback.description")}
              </p>
            </div>
          </div>

          {/* Feature 2: Volume Level */}
          <div className="bg-paper-white rounded-lg border border-ink-black p-6 md:p-8 flex gap-6 items-start hover:border-signal-purple transition-all duration-300">
            <div className="w-12 h-12 rounded-xl bg-signal-magenta/10 flex items-center justify-center text-signal-magenta shrink-0">
              <svg className="w-7 h-7" fill="none" stroke="currentColor" strokeWidth="2.5" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" d="M10.5 6h9.75M10.5 6a1.5 1.5 0 11-3 0m3 0a1.5 1.5 0 10-3 0M3.75 6H7.5m3 12h9.75m-9.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-9.75 0h9.75" />
              </svg>
            </div>
            <div className="flex flex-col space-y-2">
              <h3 className="font-sans text-lg font-extrabold uppercase text-ink-black">
                {t("volumeLevel.title")}
              </h3>
              <p className="font-arial text-sm text-graphite leading-relaxed">
                {t("volumeLevel.description")}
              </p>
            </div>
          </div>

          {/* Feature 3: Broadcasting */}
          <div className="bg-paper-white rounded-lg border border-ink-black p-6 md:p-8 flex gap-6 items-start hover:border-signal-purple transition-all duration-300">
            <div className="w-12 h-12 rounded-xl bg-signal-coral/10 flex items-center justify-center text-signal-coral shrink-0">
              <svg className="w-7 h-7" fill="none" stroke="currentColor" strokeWidth="2.5" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" d="M12 7.5h1.5m-1.5 3h1.5m-7.5 3h7.5m-7.5 3h7.5m3-9h3.375c.621 0 1.125.504 1.125 1.125V18a2.25 2.25 0 01-2.25 2.25M16.5 7.5V18a2.25 2.25 0 002.25 2.25M16.5 7.5V4.875c0-.621-.504-1.125-1.125-1.125H4.125C3.504 3.75 3 4.254 3 4.875V18a2.25 2.25 0 002.25 2.25h13.5M6 7.5h3v3H6v-3z" />
              </svg>
            </div>
            <div className="flex flex-col space-y-2">
              <h3 className="font-sans text-lg font-extrabold uppercase text-ink-black">
                {t("broadcasting.title")}
              </h3>
              <p className="font-arial text-sm text-graphite leading-relaxed">
                {t("broadcasting.description")}
              </p>
            </div>
          </div>

          {/* Feature 4: Optimized Streaming */}
          <div className="bg-paper-white rounded-lg border border-ink-black p-6 md:p-8 flex gap-6 items-start hover:border-signal-purple transition-all duration-300">
            <div className="w-12 h-12 rounded-xl bg-signal-yellow/10 flex items-center justify-center text-signal-yellow shrink-0">
              <svg className="w-7 h-7" fill="none" stroke="currentColor" strokeWidth="2.5" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
              </svg>
            </div>
            <div className="flex flex-col space-y-2">
              <h3 className="font-sans text-lg font-extrabold uppercase text-ink-black">
                {t("optimizedStreaming.title")}
              </h3>
              <p className="font-arial text-sm text-graphite leading-relaxed">
                {t("optimizedStreaming.description")}
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
