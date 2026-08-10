import { Locale, localeDir } from '@/i18n/locales';
import { routing } from '@/i18n/routing';
import type { Metadata } from 'next';
import { NextIntlClientProvider } from 'next-intl';
import { getMessages } from 'next-intl/server';
import localFont from 'next/font/local';
import { notFound } from 'next/navigation';
import '../globals.css';

const tajawal = localFont({
  src: [
    {
      path: '../../public/fonts/Tajawal-Light.ttf',
      weight: '300',
      style: 'normal',
    },
    {
      path: '../../public/fonts/Tajawal-Regular.ttf',
      weight: '400',
      style: 'normal',
    },
    {
      path: '../../public/fonts/Tajawal-Medium.ttf',
      weight: '500',
      style: 'normal',
    },
    {
      path: '../../public/fonts/Tajawal-Bold.ttf',
      weight: '700',
      style: 'normal',
    },
    {
      path: '../../public/fonts/Tajawal-ExtraBold.ttf',
      weight: '800',
      style: 'normal',
    },
    {
      path: '../../public/fonts/Tajawal-Black.ttf',
      weight: '900',
      style: 'normal',
    },
  ],
  variable: '--font-tajawal',
});

const siteUrl = 'https://nccplatform.ly'; // TODO: update with production URL

const metaByLocale: Record<
  string,
  { title: string; description: string; keywords: string }
> = {
  en: {
    title: "The Nation's Platform - Live Radio & Media Streaming",
    description:
      "Stream live Libyan radio stations and national broadcasts on The Nation's Platform. Stay connected to the news, culture, and content that matters to your community - anytime, anywhere.",
    keywords:
      'Libya radio, Libyan media, live streaming, radio app, national broadcasts, منصة الأمة, NCC, news Libya, community media',
  },
  ar: {
    title: 'منصة الأمة - بث مباشر للراديو والإعلام الليبي',
    description:
      'استمع للإذاعات الليبية المباشرة وتابع البث الوطني عبر منصة الأمة. ابقَ على تواصل مع الأخبار والثقافة والمحتوى الذي يهمك - في أي وقت ومن أي مكان.',
    keywords:
      'منصة الأمة, راديو ليبيا, بث مباشر, إذاعة ليبية, أخبار ليبيا, تطبيق راديو, NCC, إعلام وطني, بث إعلامي',
  },
};

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}): Promise<Metadata> {
  const { locale } = await params;
  const meta = metaByLocale[locale] ?? metaByLocale['en'];
  const canonicalUrl = `${siteUrl}/${locale}`;

  return {
    title: meta.title,
    description: meta.description,
    keywords: meta.keywords,
    authors: [{ name: "The Nation's Platform" }],
    creator: "NCC - Nation's Communication Channel",
    icons: {
      icon: [
        { url: '/images/app-icon.png', type: 'image/png', sizes: '512x512' },
        { url: '/images/app-icon.png', type: 'image/png', sizes: '192x192' },
        { url: '/images/app-icon.png', type: 'image/png', sizes: '32x32' },
      ],
      apple: [
        { url: '/images/app-icon.png', sizes: '180x180', type: 'image/png' },
      ],
      shortcut: '/images/app-icon.png',
    },
    metadataBase: new URL(siteUrl),
    alternates: {
      canonical: canonicalUrl,
      languages: {
        en: `${siteUrl}/en`,
        ar: `${siteUrl}/ar`,
      },
    },
    openGraph: {
      type: 'website',
      url: canonicalUrl,
      siteName: locale === 'ar' ? 'منصة الأمة' : "The Nation's Platform",
      title: meta.title,
      description: meta.description,
      images: [
        {
          url: `${siteUrl}/images/app-icon.png`,
          width: 512,
          height: 512,
          alt: locale === 'ar' ? 'منصة الأمة' : "The Nation's Platform",
        },
      ],
      locale: locale === 'ar' ? 'ar_LY' : 'en_US',
    },
    twitter: {
      card: 'summary_large_image',
      title: meta.title,
      description: meta.description,
      images: [`${siteUrl}/images/app-icon.png`],
    },
    robots: {
      index: true,
      follow: true,
      googleBot: {
        index: true,
        follow: true,
        'max-video-preview': -1,
        'max-image-preview': 'large',
        'max-snippet': -1,
      },
    },
  };
}

export function generateStaticParams() {
  return routing.locales.map((locale) => ({ locale }));
}

export default async function LocaleLayout({
  children,
  params,
}: {
  children: React.ReactNode;
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;

  // Validate that the incoming `locale` parameter is valid
  if (!routing.locales.includes(locale as Locale)) {
    notFound();
  }

  const messages = await getMessages();
  const dir = localeDir[locale as Locale];

  return (
    <html
      lang={locale}
      dir={dir}
      className={`${tajawal.variable} h-full antialiased`}
    >
      <body className="min-h-full flex flex-col font-sans">
        <NextIntlClientProvider messages={messages}>
          {children}
        </NextIntlClientProvider>
      </body>
    </html>
  );
}
