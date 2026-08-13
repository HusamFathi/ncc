'use client';

import { useEffect } from 'react';
import Image from 'next/image';
import Link from 'next/link';
import { useTranslation } from '@/lib/i18n-context';

const PLAY_STORE_URL =
  'https://play.google.com/store/apps/details?id=org.msfhor.ncc';

export default function DownloadPage() {
  const { t: rootT, dir } = useTranslation();
  const t = (key: string) => rootT(`download.${key}`);

  // Auto-redirect Android users directly to the Play Store
  useEffect(() => {
    const ua = navigator.userAgent || '';
    const isAndroid = /android/i.test(ua);
    if (isAndroid) {
      window.location.href = PLAY_STORE_URL;
    }
  }, []);

  return (
    <div className="min-h-screen bg-paper-white flex flex-col" dir={dir}>
      {/* Header */}
      <header className="w-full max-w-[1200px] mx-auto px-6 md:px-12 pt-8 pb-4 flex items-center justify-between">
        <Link
          href="/"
          id="download-back-home"
          className="flex items-center gap-2 text-graphite hover:text-ink-black transition-colors font-sans text-sm font-semibold"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2.5"
            strokeLinecap="round"
            strokeLinejoin="round"
            className={dir === 'rtl' ? 'rotate-180' : ''}
          >
            <path d="M19 12H5M12 5l-7 7 7 7" />
          </svg>
          {t('backHome')}
        </Link>

        <Link href="/" className="flex items-center gap-2">
          <Image
            src="/images/app-icon.png"
            alt="App Icon"
            width={36}
            height={36}
            className="rounded-xl"
          />
        </Link>
      </header>

      {/* Main content */}
      <main className="flex-1 flex flex-col items-center justify-center px-6 py-12">
        {/* Title */}
        <div className="text-center mb-12">
          <h1 className="font-sans text-3xl md:text-5xl font-black text-ink-black uppercase tracking-tight mb-4">
            {t('title')}
          </h1>
          <p className="font-arial text-graphite text-base md:text-lg max-w-md mx-auto leading-relaxed">
            {t('subtitle')}
          </p>
        </div>

        {/* Cards */}
        <div className="flex flex-col sm:flex-row gap-6 md:gap-10 w-full max-w-2xl justify-center items-stretch">
          {/* ── Google Play Card ── */}
          <div
            id="download-card-android"
            className="flex-1 flex flex-col items-center bg-white border border-ink-black/10 rounded-3xl p-8 shadow-lg hover:shadow-xl transition-shadow duration-300"
          >
            {/* Platform icon */}
            <div className="w-24 h-24 flex items-center justify-center mb-4">
              <Image
                src="/google-play.png"
                alt="Google Play"
                width={96}
                height={96}
                className="drop-shadow-md"
              />
            </div>

            <h2 className="font-sans text-lg font-extrabold text-ink-black mb-6 uppercase tracking-wide">
              {t('androidCard')}
            </h2>

            {/* QR Code — fixed outer size: 160px image + p-3 (12px each side) = 186px */}
            <div className="w-[186px] h-[186px] bg-white p-3 rounded-2xl border border-ink-black/10 shadow-sm mb-4 flex items-center justify-center shrink-0">
              <Image
                src="/qrcode_android_app_link.png"
                alt="QR Code for Android App"
                width={160}
                height={160}
                className="rounded-lg block"
              />
            </div>
            <p className="text-xs font-sans text-graphite mb-4">
              {t('scanQr')}
            </p>

            {/* Spacer pushes button to bottom */}
            <div className="flex-1" />

            {/* Download button */}
            <a
              id="download-btn-android"
              href={PLAY_STORE_URL}
              target="_blank"
              rel="noopener noreferrer"
              className="w-full text-center bg-signal-purple hover:bg-signal-magenta text-paper-white font-sans text-sm font-bold rounded-2xl py-3 px-6 transition-all duration-300 hover:scale-[1.02] active:scale-[0.98]"
            >
              {t('downloadOnGoogle')}
            </a>
          </div>

          {/* ── App Store Card ── */}
          <div
            id="download-card-ios"
            className="flex-1 flex flex-col items-center bg-white border border-ink-black/10 rounded-3xl p-8 shadow-lg opacity-80"
          >
            {/* Platform icon */}
            <div className="w-24 h-24 flex items-center justify-center mb-4">
              <Image
                src="/app-store.png"
                alt="App Store"
                width={96}
                height={96}
                className="drop-shadow-md"
              />
            </div>

            <h2 className="font-sans text-lg font-extrabold text-ink-black mb-6 uppercase tracking-wide">
              {t('iosCard')}
            </h2>

            {/* Coming Soon — exact same outer size as QR wrapper: 186×186px */}
            <div className="w-[186px] h-[186px] p-3 rounded-2xl border border-ink-black/10 shadow-sm mb-4 flex items-center justify-center shrink-0">
              <div className="w-full h-full rounded-lg bg-gradient-to-br from-signal-purple/10 to-signal-magenta/10 flex flex-col items-center justify-center gap-3">
                <span className="text-4xl">🚀</span>
                <span className="font-sans text-sm font-extrabold text-signal-purple uppercase tracking-widest">
                  {t('comingSoon')}
                </span>
              </div>
            </div>
            <p className="text-xs font-sans text-graphite mb-4 opacity-0 select-none">
              —
            </p>

            {/* Spacer pushes button to bottom */}
            <div className="flex-1" />

            {/* Disabled button */}
            <button
              id="download-btn-ios"
              disabled
              className="w-full text-center bg-ink-black/10 text-graphite/60 font-sans text-sm font-bold rounded-2xl py-3 px-6 cursor-not-allowed"
            >
              {t('comingSoon')}
            </button>
          </div>
        </div>
      </main>
    </div>
  );
}
