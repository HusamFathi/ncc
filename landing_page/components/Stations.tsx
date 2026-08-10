import Image from 'next/image';

export default function Stations() {
  return (
    <section
      id="stations"
      className="w-full bg-paper-white py-20 px-6 md:px-12 max-w-[1200px] mx-auto space-y-32"
    >
      {/* Station 1: Notion Radio */}
      <div
        id="notion-radio"
        className="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-16 items-center"
      >
        {/* Left: Text Content */}
        <div className="flex flex-col items-start text-left space-y-6 max-w-[500px]">
          <span className="bg-signal-purple text-paper-white font-sans text-xs font-black tracking-widest px-3 py-1 rounded-full uppercase">
            93.9 FM Broadcast
          </span>
          <h2 className="text-4xl md:text-5xl font-black text-ink-black uppercase leading-tight tracking-tight">
            Notion Radio
          </h2>
          <p className="italic text-base text-signal-purple font-semibold">
            "Notion Radio... The Pulse of the Nation"
          </p>
          <p className="font-arial text-sm text-graphite leading-relaxed">
            Launched in Benghazi on 1/1/2020, Radio Al-Umma serves as a unified
            shortwave platform for independent dialogue and cultural expression.
            It represents a bridge of communication, providing spaces of
            knowledge, literature, and purposeful journalism.
          </p>
          <a
            href="#"
            className="border-2 border-ink-black hover:bg-ink-black hover:text-paper-white text-ink-black font-sans text-sm font-bold rounded-2xl py-3 px-6 transition-all duration-300 inline-flex items-center gap-2"
          >
            Stream Notion Radio <span>→</span>
          </a>
        </div>

        {/* Right: Mockup with Purple Blob */}
        <div className="relative w-full flex justify-center items-center py-6">
          {/* Organic Blob */}
          <div className="absolute w-[280px] h-[280px] md:w-[400px] md:h-[400px] bg-signal-purple/10 blob-backing -z-10 translate-x-6 -translate-y-4"></div>

          {/* Android Player Mockup Container */}
          <div className="relative w-[280px] h-[480px] md:w-[320px] md:h-[540px] bg-ink-black rounded-[36px] p-2 shadow-xl border-[4px] border-ink-black flex flex-col justify-between">
            {/* Screen */}
            <div className="flex-1 bg-zinc-900 rounded-[28px] p-6 flex flex-col justify-between relative overflow-hidden">
              {/* Punch-hole Camera */}
              <div className="absolute top-[10px] left-1/2 -translate-x-1/2 w-3 h-3 bg-ink-black rounded-full z-20"></div>
              {/* Top Navigation inside mockup */}
              <div className="flex justify-between items-center z-10">
                <span className="text-[10px] text-zinc-500 font-bold uppercase">
                  LIVE STREAM
                </span>
                <span className="bg-signal-purple text-paper-white text-[9px] font-black px-2 py-0.5 rounded uppercase tracking-wider">
                  Notion FM
                </span>
              </div>

              {/* Radio Player Graphic */}
              <div className="my-auto flex flex-col items-center text-center space-y-6 z-10">
                {/* Visualizer Disk */}
                <div className="w-28 h-28 md:w-36 md:h-36 rounded-full border-4 border-signal-purple/30 flex items-center justify-center relative bg-zinc-950 animate-[spin_10s_linear_infinite]">
                  <div className="w-20 h-20 md:w-28 md:h-28 rounded-full border border-signal-purple/50 flex items-center justify-center">
                    <div className="w-6 h-6 rounded-full bg-signal-purple"></div>
                  </div>
                </div>

                <div>
                  <h4 className="text-paper-white font-bold text-base md:text-lg">
                    The Pulse of the Nation
                  </h4>
                  <p className="text-zinc-400 text-xs mt-1">
                    Radio Al-Umma 93.9
                  </p>
                </div>
              </div>

              {/* Player Controls */}
              <div className="flex justify-around items-center z-10 pt-4 border-t border-zinc-800">
                <button className="text-zinc-500 hover:text-paper-white transition-colors">
                  <svg
                    className="w-5 h-5"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z" />
                  </svg>
                </button>
                <button className="w-12 h-12 rounded-full bg-signal-purple text-paper-white flex items-center justify-center hover:bg-signal-magenta transition-colors">
                  <svg
                    className="w-6 h-6 ml-0.5"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M8 5v14l11-7z" />
                  </svg>
                </button>
                <button className="text-zinc-500 hover:text-paper-white transition-colors">
                  <svg
                    className="w-5 h-5"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M7 24h2v-2H7v2zm8-24h-2v2h2V0zM9 2h2V0H9v2zm8 22h2v-2h-2v2zm-4 0h2v-2h-2v2zM5 4h2V2H5v2zm0 16h2v-2H5v2zm12-16h2V2h-2v2z" />
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Station 2: Heritage Radio */}
      <div
        id="heritage-radio"
        className="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-16 items-center"
      >
        {/* Left: Mockup with Yellow/Orange Blob (Alternated Order for Desktop) */}
        <div className="relative w-full flex justify-center items-center py-6 lg:order-first order-last">
          {/* Organic Blob */}
          <div className="absolute w-[280px] h-[280px] md:w-[400px] md:h-[400px] bg-signal-yellow/10 blob-backing -z-10 -translate-x-6 translate-y-4"></div>

          {/* Android Player Mockup Container */}
          <div className="relative w-[280px] h-[480px] md:w-[320px] md:h-[540px] bg-ink-black rounded-[36px] p-2 shadow-xl border-[4px] border-ink-black flex flex-col justify-between">
            {/* Screen */}
            <div className="flex-1 bg-zinc-900 rounded-[28px] p-6 flex flex-col justify-between relative overflow-hidden">
              {/* Punch-hole Camera */}
              <div className="absolute top-[10px] left-1/2 -translate-x-1/2 w-3 h-3 bg-ink-black rounded-full z-20"></div>
              {/* Top Navigation inside mockup */}
              <div className="flex justify-between items-center z-10">
                <span className="text-[10px] text-zinc-500 font-bold uppercase">
                  LIVE STREAM
                </span>
                <span className="bg-signal-yellow text-ink-black text-[9px] font-black px-2 py-0.5 rounded uppercase tracking-wider">
                  Heritage
                </span>
              </div>

              {/* Radio Player Graphic */}
              <div className="my-auto flex flex-col items-center text-center space-y-6 z-10">
                {/* Visualizer Disk */}
                <div className="w-28 h-28 md:w-36 md:h-36 rounded-full border-4 border-signal-yellow/30 flex items-center justify-center relative bg-zinc-950 animate-[spin_12s_linear_infinite]">
                  <div className="w-20 h-20 md:w-28 md:h-28 rounded-full border border-signal-yellow/50 flex items-center justify-center">
                    <div className="w-6 h-6 rounded-full bg-signal-yellow"></div>
                  </div>
                </div>

                <div>
                  <h4 className="text-paper-white font-bold text-base md:text-lg">
                    Echoing the Past
                  </h4>
                  <p className="text-zinc-400 text-xs mt-1">
                    Al-Ummah Heritage Radio
                  </p>
                </div>
              </div>

              {/* Player Controls */}
              <div className="flex justify-around items-center z-10 pt-4 border-t border-zinc-800">
                <button className="text-zinc-500 hover:text-paper-white transition-colors">
                  <svg
                    className="w-5 h-5"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z" />
                  </svg>
                </button>
                <button className="w-12 h-12 rounded-full bg-signal-yellow text-ink-black flex items-center justify-center hover:bg-signal-yellow-light transition-colors">
                  <svg
                    className="w-6 h-6 ml-0.5"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M8 5v14l11-7z" />
                  </svg>
                </button>
                <button className="text-zinc-500 hover:text-paper-white transition-colors">
                  <svg
                    className="w-5 h-5"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M7 24h2v-2H7v2zm8-24h-2v2h2V0zM9 2h2V0H9v2zm8 22h2v-2h-2v2zm-4 0h2v-2h-2v2zM5 4h2V2H5v2zm0 16h2v-2H5v2zm12-16h2V2h-2v2z" />
                  </svg>
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* Right: Text Content */}
        <div className="flex flex-col items-start text-left space-y-6 max-w-[500px]">
          <span className="bg-signal-yellow text-ink-black font-sans text-xs font-black tracking-widest px-3 py-1 rounded-full uppercase">
            Preserving History
          </span>
          <h2 className="text-4xl md:text-5xl font-black text-ink-black uppercase leading-tight tracking-tight">
            Nation Heritage Radio
          </h2>
          <p className="italic text-base text-signal-yellow font-semibold">
            "Echoing the past... Resonating with the present"
          </p>
          <p className="font-arial text-sm text-graphite leading-relaxed">
            A cultural broadcasting initiative dedicated to preserving Libyan
            heritage. Operated by the Nation Communication Center, it explores
            national history, traditional arts, regional customs, and preserve
            stories for future generations.
          </p>
          <a
            href="#"
            className="border-2 border-ink-black hover:bg-ink-black hover:text-paper-white text-ink-black font-sans text-sm font-bold rounded-2xl py-3 px-6 transition-all duration-300 inline-flex items-center gap-2"
          >
            Stream Heritage Radio <span>→</span>
          </a>
        </div>
      </div>
    </section>
  );
}
