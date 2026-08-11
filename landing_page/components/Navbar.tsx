'use client';

import { useTranslation, Language } from '@/lib/i18n-context';
import Link from 'next/link';
import Image from 'next/image';

const localeLabels: Record<Language, string> = {
  en: 'English',
  ar: 'العربية',
};

const localeDir: Record<Language, 'ltr' | 'rtl'> = {
  en: 'ltr',
  ar: 'rtl',
};

export default function Navbar() {
  const { t: rootT, language: locale, setLanguage } = useTranslation();
  const t = (key: string) => rootT(`nav.${key}`);

  // Cycle through available locales on toggle
  const handleLocaleChange = (newLocale: Language) => {
    setLanguage(newLocale);
  };

  // Get all other locales (not current)
  const allLocales: Language[] = ['en', 'ar'];
  const otherLocales = allLocales.filter((l) => l !== locale) as Language[];

  return (
    <nav className="w-full bg-paper-white py-6 px-6 md:px-12 flex justify-between items-center max-w-[1200px] mx-auto z-50">
      {/* Logo */}
      <Link href="/" className="flex items-center gap-3 group">
        <Image
          src="/images/app-icon.png"
          alt="App Icon"
          width={50}
          height={50}
          className="w-[50px] h-[50px] rounded-2xl group-hover:scale-105 transition-transform duration-300 shrink-0"
        />
        <span className="font-sans text-sm md:text-base font-bold tracking-tight text-ink-black uppercase">
          {t('appName')}
        </span>
      </Link>

      {/* Nav Links & Language Switcher */}
      <div className="flex items-center gap-4 md:gap-8 font-sans text-xs md:text-sm font-semibold tracking-tight">
        <Link
          href="/#home"
          className="text-ink-black hover:underline underline-offset-4 decoration-graphite"
        >
          {t('home')}
        </Link>
        <Link
          href="/#features"
          className="text-ink-black relative hover:underline underline-offset-4 decoration-graphite"
        >
          {t('features')}
          <span className="absolute -top-1 -right-2 w-1.5 h-1.5 bg-alert-magenta rounded-full"></span>
        </Link>
        <Link
          href="/#about"
          className="text-ink-black hover:underline underline-offset-4 decoration-graphite"
        >
          {t('about')}
        </Link>

        {/* Language Switcher - cycles through all available locales */}
        <div className="flex items-center gap-2 ms-2">
          {otherLocales.map((targetLocale) => (
            <button
              key={targetLocale}
              onClick={() => handleLocaleChange(targetLocale)}
              type="button"
              aria-label={`Switch to ${localeLabels[targetLocale]}`}
              className="border border-ink-black/20 hover:border-signal-purple hover:bg-signal-purple/5 text-ink-black font-bold rounded-full px-3.5 py-1.5 text-xs transition-all duration-300 flex items-center gap-1.5 cursor-pointer"
              style={{ direction: localeDir[targetLocale] }}
            >
              <span className="w-2 h-2 rounded-full bg-signal-purple shrink-0"></span>
              <span>{localeLabels[targetLocale]}</span>
            </button>
          ))}
        </div>
      </div>
    </nav>
  );
}
