import type { MetadataRoute } from "next";

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: "FlashDeck",
    short_name: "FlashDeck",
    description: "Flashcards, quizzes and study streaks",
    start_url: "/",
    display: "standalone",
    background_color: "#fff3d6",
    theme_color: "#fdb833",
    icons: [
      { src: "/icon-192.png", sizes: "192x192", type: "image/png" },
      { src: "/icon-512.png", sizes: "512x512", type: "image/png" },
      { src: "/icon-maskable-512.png", sizes: "512x512", type: "image/png", purpose: "maskable" },
    ],
  };
}
