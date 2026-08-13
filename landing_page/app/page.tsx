import Navbar from '@/components/Navbar';
import Hero from '@/components/Hero';
import Features from '@/components/Features';
import VisionMission from '@/components/VisionMission';
import Footer from '@/components/Footer';

export default function Home() {
  return (
    <div className="min-h-screen bg-paper-white text-ink-black flex flex-col antialiased">
      {/* Navigation */}
      <Navbar />

      {/* Main Content */}
      <main className="flex-1">
        {/* Hero Section */}
        <div id="home">
          <Hero />
        </div>

        {/* Features Section */}
        <Features />

        {/* Vision & Mission Section */}
        <VisionMission />
      </main>

      {/* Footer */}
      <Footer />
    </div>
  );
}
