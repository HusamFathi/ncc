'use client';

import React, { createContext, useContext, useState, useEffect } from 'react';
import en from '@/messages/en.json';
import ar from '@/messages/ar.json';

export type Language = 'en' | 'ar';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const resolvePath = (obj: any, path: string) => {
  return path.split('.').reduce((acc, part) => acc && acc[part], obj) || path;
};

interface LanguageContextProps {
  language: Language;
  setLanguage: (lang: Language) => void;
  t: (key: string) => string;
  dir: 'ltr' | 'rtl';
}

const LanguageContext = createContext<LanguageContextProps | undefined>(
  undefined
);

export const LanguageProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  // Default to 'ar' since it's the main language for NCC
  const [language, setLanguageState] = useState<Language>('ar');

  useEffect(() => {
    // 1. Check if user has a saved preference
    const savedLang = localStorage.getItem('language') as Language;
    if (savedLang && ['en', 'ar'].includes(savedLang)) {
      setLanguageState(savedLang);
      return;
    }
    // 2. Otherwise, detect from browser/device language
    const deviceLang = navigator.language || navigator.languages?.[0] || 'ar';
    // If the device is set to any Arabic variant (ar, ar-SA, ar-LY, etc.) use 'ar', else 'en'
    const detected: Language = deviceLang.startsWith('ar') ? 'ar' : 'en';
    setLanguageState(detected);
  }, []);

  const setLanguage = (lang: Language) => {
    setLanguageState(lang);
    localStorage.setItem('language', lang);
  };

  const getTranslations = () => {
    return language === 'ar' ? ar : en;
  };

  const t = (key: string) => {
    const translations = getTranslations();
    return resolvePath(translations, key);
  };

  const dir = language === 'ar' ? 'rtl' : 'ltr';

  useEffect(() => {
    document.documentElement.dir = dir;
    document.documentElement.lang = language;
  }, [dir, language]);

  return (
    <LanguageContext.Provider
      value={{ language, setLanguage, t, dir }}
    >
      {children}
    </LanguageContext.Provider>
  );
};

export const useTranslation = () => {
  const context = useContext(LanguageContext);
  if (!context) {
    throw new Error('useTranslation must be used within a LanguageProvider');
  }
  return context;
};
