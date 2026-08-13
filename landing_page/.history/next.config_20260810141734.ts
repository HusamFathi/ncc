import type { NextConfig } from 'next';
import createNextIntlPlugin from 'next-intl/plugin';

const withNextIntl = createNextIntlPlugin();

const nextConfig: NextConfig = {
  async redirects() {
    return [{ source: '/', destination: '/ar', permanent: true }];
  },
  webpack: (config, { webpack }) => {
    config.plugins.push(
      new webpack.DefinePlugin({ __dirname: JSON.stringify('/') })
    );
    return config;
  },
};

export default withNextIntl(nextConfig);
