import type { Metadata } from 'next';
import localFont from 'next/font/local';
import { LanguageProvider } from '@/lib/i18n-context';
import './globals.css';

const tajawal = localFont({
  src: [
    {
      path: '../public/fonts/Tajawal-Light.ttf',
      weight: '300',
      style: 'normal',
    },
    {
      path: '../public/fonts/Tajawal-Regular.ttf',
      weight: '400',
      style: 'normal',
    },
    {
      path: '../public/fonts/Tajawal-Medium.ttf',
      weight: '500',
      style: 'normal',
    },
    {
      path: '../public/fonts/Tajawal-Bold.ttf',
      weight: '700',
      style: 'normal',
    },
    {
      path: '../public/fonts/Tajawal-ExtraBold.ttf',
      weight: '800',
      style: 'normal',
    },
    {
      path: '../public/fonts/Tajawal-Black.ttf',
      weight: '900',
      style: 'normal',
    },
  ],
  variable: '--font-tajawal',
});

const siteUrl = 'https://nccplatform.ly'; // TODO: update with production URL

export const metadata: Metadata = {
  title: "The Nation's Platform - Live Radio & Media Streaming",
  description:
    "Stream live Libyan radio stations and national broadcasts on The Nation's Platform. Stay connected to the news, culture, and content that matters to your community - anytime, anywhere.",
  keywords:
    'Libya radio, Libyan media, live streaming, radio app, national broadcasts, منصة الأمة, NCC, news Libya, community media',
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
  openGraph: {
    type: 'website',
    url: siteUrl,
    siteName: "The Nation's Platform",
    title: "The Nation's Platform - Live Radio & Media Streaming",
    description: "Stream live Libyan radio stations and national broadcasts on The Nation's Platform. Stay connected to the news, culture, and content that matters to your community - anytime, anywhere.",
    images: [
      {
        url: `${siteUrl}/images/app-icon.png`,
        width: 512,
        height: 512,
        alt: "The Nation's Platform",
      },
    ],
    locale: 'en_US',
  },
  twitter: {
    card: 'summary_large_image',
    title: "The Nation's Platform - Live Radio & Media Streaming",
    description: "Stream live Libyan radio stations and national broadcasts on The Nation's Platform. Stay connected to the news, culture, and content that matters to your community - anytime, anywhere.",
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

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="ar" dir="rtl" className={`${tajawal.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col font-sans">
        <LanguageProvider>
          {children}
        </LanguageProvider>
      </body>
    </html>
  );
}
