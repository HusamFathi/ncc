import { redirect } from 'next/navigation';

export default function RootPage() {
  // Bulletproof fallback to redirect root traffic to default locale
  redirect('/ar');
}
