"use client";

import Image from "next/image";
import { useTranslations } from "next-intl";
import { Link } from "@/i18n/navigation";

export default function Footer() {
  const t = useTranslations("footer");
  const currentYear = new Date().getFullYear();

  return (
    <footer className="w-full bg-paper-white border-t border-ink-black/10 py-16 px-6 md:px-12 max-w-[1200px] mx-auto mt-20">
      <div className="grid grid-cols-1 md:grid-cols-4 gap-8 md:gap-12">
        {/* Brand & Slogan */}
        <div className="md:col-span-2 flex flex-col space-y-4">
          <Link href="/" className="flex items-center gap-3 group">
            <Image
              src="/images/app-icon.png"
              alt="App Icon"
              width={50}
              height={50}
              className="w-[50px] h-[50px] rounded-2xl group-hover:scale-105 transition-transform duration-300 shrink-0"
            />
            <span className="font-sans text-base font-bold tracking-tight text-ink-black uppercase">
              {t("appName")}
            </span>
          </Link>
          <p className="font-arial text-xs text-graphite leading-relaxed max-w-sm">
            {t("description")}
          </p>
        </div>

        {/* Legal & Support Links */}
        <div className="flex flex-col space-y-3 font-sans text-sm">
          <h4 className="font-extrabold uppercase text-ink-black text-xs tracking-wider">
            {t("legalSupport")}
          </h4>
          <Link
            href="/terms"
            className="text-graphite hover:text-ink-black transition-colors"
          >
            {t("termsOfUse")}
          </Link>
          <Link
            href="/privacy"
            className="text-graphite hover:text-ink-black transition-colors"
          >
            {t("privacyPolicy")}
          </Link>
          <a
            href="mailto:info@msf-hor.org"
            className="text-graphite hover:text-ink-black transition-colors"
          >
            {t("supportEmail")}
          </a>
        </div>

        {/* Social */}
        <div className="flex flex-col space-y-3 font-sans text-sm">
          <h4 className="font-extrabold uppercase text-ink-black text-xs tracking-wider">
            {t("connect")}
          </h4>
          <a
            href="https://www.facebook.com/p/%D9%85%D8%B1%D9%83%D8%B2-%D8%A7%D9%84%D8%A3%D9%85%D8%A9-%D9%84%D9%84%D8%AA%D9%88%D8%A7%D8%B5%D9%84-61576664882231/"
            target="_blank"
            rel="noopener noreferrer"
            className="text-graphite hover:text-ink-black transition-colors"
          >
            {t("facebook")}
          </a>
        </div>
      </div>

      {/* Bottom info */}
      <div className="mt-12 pt-8 border-t border-ink-black/5 flex flex-col md:flex-row justify-center items-center gap-4 text-xs font-sans font-semibold text-graphite">
        <div>
          © {t("appName")} {currentYear} - {t("rights")}
        </div>
      </div>
    </footer>
  );
}
