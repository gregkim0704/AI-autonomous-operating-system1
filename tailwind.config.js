/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        // 커스텀 다크 테마 색상
        'aos-dark': {
          900: '#0f0f1a',
          800: '#1a1a2e',
          700: '#252540',
          600: '#2d2d4a',
        },
        'aos-purple': {
          500: '#8b5cf6',
          400: '#a78bfa',
          300: '#c4b5fd',
        },
        'aos-cyan': {
          500: '#06b6d4',
          400: '#22d3ee',
          300: '#67e8f9',
        },
      },
      animation: {
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'glow': 'glow 2s ease-in-out infinite alternate',
      },
      keyframes: {
        glow: {
          '0%': { boxShadow: '0 0 5px rgba(139, 92, 246, 0.5)' },
          '100%': { boxShadow: '0 0 20px rgba(139, 92, 246, 0.8)' },
        },
      },
    },
  },
  plugins: [],
}
