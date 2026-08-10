import type { NextConfig } from 'next';
import createNextIntlPlugin from 'next-intl/plugin';

const withNextIntl = createNextIntlPlugin();

const nextConfig: NextConfig = {
  async redirects() {
    return [
      {
        source: '/',
        destination: '/ar',
        permanent: true, // 301 Redirect (Cached by browsers & CDNs)
      },
    ];
  },
  /* config options here */
};

export default withNextIntl(nextConfig);
