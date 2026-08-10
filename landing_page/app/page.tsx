import { redirect } from 'next/navigation';

export default function RootPage() {
  // Default to Arabic locale
  redirect('/ar');
}
