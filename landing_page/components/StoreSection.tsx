'use client';

import Image from 'next/image';
import Link from 'next/link';
import { useTranslation } from '@/lib/i18n-context';

const PLAY_STORE_URL =
  'https://play.google.com/store/apps/details?id=org.msfhor.ncc';

export default function StoreSection() {
  const { t: rootT } = useTranslation();
  const t = (key: string) => rootT(`storeSection.${key}`);

  return (
    <section className="w-full py-10 px-6 md:px-12 max-w-[1200px] mx-auto">
      {/* Heading */}
      <div className="text-center mb-8">
        <h2 className="font-sans text-xl md:text-2xl font-extrabold text-ink-black uppercase tracking-tight">
          {t('title')}
        </h2>
        <p className="font-arial text-sm text-graphite mt-2 max-w-md mx-auto leading-relaxed">
          {t('subtitle')}
        </p>
      </div>

      {/* Badges */}
      <div className="flex flex-wrap justify-center items-center gap-4">

        {/* Google Play Badge */}
        <a
          id="store-badge-google-play"
          href={PLAY_STORE_URL}
          target="_blank"
          rel="noopener noreferrer"
          aria-label="Download on Google Play"
          className="group flex items-center gap-3 bg-ink-black hover:bg-zinc-800 text-paper-white rounded-2xl px-5 py-3 transition-all duration-200 hover:scale-105 active:scale-95 shadow-md"
        >
          <Image
            src="/google-play.png"
            alt="Google Play"
            width={28}
            height={28}
            className="shrink-0"
          />
          <div className="flex flex-col leading-tight">
            <span className="text-[10px] font-sans opacity-70 tracking-wide">GET IT ON</span>
            <span className="text-base font-sans font-bold tracking-tight">Google Play</span>
          </div>
        </a>

        {/* App Store Badge */}
        <Link
          id="store-badge-app-store"
          href="/download"
          aria-label="App Store – Coming Soon"
          className="group relative flex items-center gap-3 bg-ink-black/10 text-ink-black/50 rounded-2xl px-5 py-3 transition-all duration-200 hover:scale-105 active:scale-95 shadow-sm cursor-pointer"
        >
          <Image
            src="/app-store.png"
            alt="App Store"
            width={28}
            height={28}
            className="shrink-0 grayscale opacity-60"
          />
          <div className="flex flex-col leading-tight">
            <span className="text-[10px] font-sans opacity-60 tracking-wide">DOWNLOAD ON THE</span>
            <span className="text-base font-sans font-bold tracking-tight">App Store</span>
          </div>
          {/* Coming Soon pill */}
          <span className="absolute -top-2.5 -end-2 bg-signal-purple text-paper-white text-[10px] font-bold font-sans px-2 py-0.5 rounded-full shadow-md whitespace-nowrap">
            Soon
          </span>
        </Link>

      </div>
    </section>
  );
}
