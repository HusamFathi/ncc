// File: app/page.tsx
import { redirect } from 'next/navigation';

export default function RootPage() {
    // If a user somehow visits the root (/) and bypasses the middleware,
    // this file will catch them and force a redirect to the Arabic version.
    redirect('/ar');
}